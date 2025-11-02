# Development Guidelines

## Prerequisites

- **Node.js**: v18 or higher
- **pnpm**: v8 or higher
- **Cloudflare Account**: For Wrangler CLI
- **Git**: For version control

## Initial Setup

### 1. Clone and Install

```bash
git clone <repository-url>
cd sggweb
pnpm install
```

### 2. Environment Configuration

Create `.env.local` file:

```bash
PUBLIC_SITE_URL=http://localhost:3000
CLOUDFLARE_ACCOUNT_ID=your_account_id
CLOUDFLARE_API_TOKEN=your_api_token
```

**Note**: Never commit `.env.local` - it's in `.gitignore`

### 3. Wrangler Setup

```bash
# Login to Cloudflare
pnpm wrangler login

# Verify authentication
pnpm wrangler whoami
```

### 4. D1 & R2 Setup (Already Configured)

The project uses Cloudflare D1 (database) and R2 (storage) with two environments:

**D1 Databases:**
- Production: `sgg-db` (ID: `1a91d742-44d7-44ac-b3a3-5a01042abbf9`)
- Development: `sgg-db-dev` (ID: `b67c454e-a94f-4965-b4f1-8c5296483091`)

**R2 Buckets:**
- Production: `sgg-assets`
- Development: `sgg-assets-dev`

**Apply Migrations:**
```bash
# Migrations are already applied, but to re-run:
pnpm wrangler d1 migrations apply sgg-db --env production
pnpm wrangler d1 migrations apply sgg-db-dev --env dev
```

**Query D1:**
```bash
# Query production database
pnpm wrangler d1 execute sgg-db --env production --command "SELECT * FROM contacts"

# Query dev database
pnpm wrangler d1 execute sgg-db-dev --env dev --command "SELECT * FROM contacts"
```

## Development Workflow

### Running Development Server

```bash
# Start dev server (http://localhost:3000)
pnpm dev

# Dev server with specific port
pnpm dev --port 3001
```

### Building for Production

```bash
# Build production bundle
pnpm build

# Preview production build locally
pnpm preview
```

## Project Structure

```
src/
├── routes/
│   ├── __root.tsx           # Root layout
│   ├── index.tsx            # Homepage (redirects to /en)
│   └── [locale]/
│       └── index.tsx        # Localized homepage (to be created)
├── components/
│   ├── ui/                  # shadcn/ui components
│   ├── sections/            # Page sections (Hero, Vision, etc.)
│   └── shared/              # Shared components (Header, Footer)
├── styles/
│   └── styles.css           # Global styles + Tailwind
├── i18n/
│   ├── en.json              # English translations
│   ├── ar.json              # Arabic translations
│   └── tr.json              # Turkish translations
├── lib/
│   ├── utils.ts             # Utility functions
│   └── i18n.ts              # i18n helpers
└── data/
    └── constants.ts         # Constants (colors, links, etc.)

public/
├── fonts/                   # NeueHaasDisplay font files (to be added)
├── images/                  # Logos, icons (to be added)
└── favicon.ico

migrations/
└── 0001_create_contacts.sql # D1 database migrations

wrangler.toml                # Cloudflare Workers config
vite.config.ts               # Vite configuration
tsconfig.json                # TypeScript configuration
```

## Adding New Components

### Using shadcn/ui

```bash
# Add a new shadcn component
pnpm dlx shadcn-ui@latest add button

# Add multiple components
pnpm dlx shadcn-ui@latest add button card dialog
```

Components will be added to `src/components/ui/`

### Creating Custom Components

```typescript
// src/components/sections/Hero.tsx
import { motion } from 'framer-motion';

export function Hero() {
  return (
    <motion.section
      className="min-h-screen bg-sgg-obsidian"
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
    >
      {/* Component content */}
    </motion.section>
  );
}
```

## Internationalization (i18n)

### Translation Files

```json
// src/i18n/en.json
{
  "hero": {
    "tagline": "Unite, shine, and play.",
    "headline": "World-Class Games. Made for the Middle East."
  },
  "nav": {
    "game": "Blood Strike Max",
    "vision": "Our Vision",
    "about": "Who We Are"
  }
}
```

### Using Translations

```typescript
import { useTranslation } from '@/lib/i18n';

export function Hero() {
  const { t } = useTranslation();
  
  return <h1>{t('hero.tagline')}</h1>;
}
```

### RTL Support

```typescript
// Automatically handled by locale
<html dir={locale === 'ar' ? 'rtl' : 'ltr'}>
```

## Styling Guidelines

### Tailwind Classes

```typescript
// Use brand colors from tailwind.config.ts
<div className="bg-sgg-obsidian text-white">
  <button className="bg-sgg-orange hover:bg-sgg-amber">
    Click me
  </button>
</div>
```

### Custom Animations

```typescript
// Use Framer Motion for smooth animations
<motion.div
  initial={{ y: 20, opacity: 0 }}
  animate={{ y: 0, opacity: 1 }}
  transition={{ duration: 0.6 }}
>
  Content
</motion.div>
```

## Git Workflow

### Branch Strategy

- **main**: Production-ready code
- **dev**: Development/staging
- **feature/***: Individual features (optional)

### Commit Messages

```bash
# Format: type: description
git commit -m "feat: add contact form"
git commit -m "fix: resolve RTL layout issue"
git commit -m "docs: update README"

# Types: feat, fix, docs, style, refactor, test, chore
```

### Pull Request Workflow

```bash
# Create feature branch
git checkout -b feat/contact-form

# Make changes and commit
git add .
git commit -m "feat: implement contact form with D1"

# Push to remote
git push origin feat/contact-form

# Create PR to dev branch
```

## Testing

### Manual Testing Checklist

- [ ] Test all three languages (EN, AR, TR)
- [ ] Verify RTL layout for Arabic
- [ ] Test on mobile, tablet, desktop
- [ ] Check all download links
- [ ] Test contact form submission
- [ ] Verify smooth animations
- [ ] Check accessibility (keyboard navigation)

### Browser Testing

- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile Safari (iOS)
- Chrome Mobile (Android)

## Common Commands

```bash
# Install dependencies
pnpm install

# Add a dependency
pnpm add <package-name>

# Add a dev dependency
pnpm add -D <package-name>

# Remove a dependency
pnpm remove <package-name>

# Update dependencies
pnpm update

# Run type checking
pnpm tsc --noEmit

# Format code (if using Prettier)
pnpm format

# Lint code (if using ESLint)
pnpm lint
```

## Troubleshooting

### Port Already in Use

```bash
# Kill process on port 3000
lsof -ti:3000 | xargs kill -9

# Or use different port
pnpm dev --port 3001
```

### Wrangler Login Issues

```bash
# Re-login to Cloudflare
pnpm wrangler logout
pnpm wrangler login
```

### Build Errors

```bash
# Clear cache and rebuild
rm -rf .vinxi node_modules
pnpm install
pnpm build
```

### Font Loading Issues

Ensure NeueHaasDisplay fonts are in `public/fonts/` and properly declared in `src/styles/styles.css`

## Development Tips

1. **Hot Reload**: Dev server supports hot module replacement
2. **Type Safety**: Use TypeScript for all components
3. **CSS Organization**: Use Tailwind utilities first, custom CSS only when necessary
4. **Performance**: Lazy load images and heavy components
5. **Accessibility**: Always include proper ARIA labels and semantic HTML
6. **Mobile First**: Design for mobile, enhance for desktop

## Resources

- [TanStack Start Docs](https://tanstack.com/start/latest)
- [TanStack Router Docs](https://tanstack.com/router/latest)
- [Tailwind CSS Docs](https://tailwindcss.com/docs)
- [shadcn/ui Docs](https://ui.shadcn.com)
- [Framer Motion Docs](https://www.framer.com/motion/)
- [Cloudflare Workers Docs](https://developers.cloudflare.com/workers/)

## Getting Help

- Check [TODO.md](./TODO.md) for current tasks
- Review [DESIGN.md](./DESIGN.md) for design guidelines
- See [DEPLOYMENT.md](./DEPLOYMENT.md) for deployment issues
