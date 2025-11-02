# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Stellar Gate Games Corporate Website** - A single-page landing site for Stellar Gate Games, a joint venture bringing world-class gaming experiences to the Middle East.

**Current Status**: Infrastructure complete - TanStack Start initialized, Cloudflare D1/R2 configured, deployed to workers.dev, ready for feature implementation.

## Tech Stack

- **Framework**: TanStack Start (React) + TanStack Router
- **Styling**: Tailwind CSS + shadcn/ui + Framer Motion
- **Typography**: NeueHaasDisplay (custom font)
- **Deployment**: Cloudflare Workers + Pages
- **Database**: Cloudflare D1 (optional, for contact forms)
- **Storage**: Cloudflare R2 (for assets)
- **Package Manager**: pnpm

## Development Commands

When the project is initialized:

```bash
# Install dependencies
pnpm install

# Run development server
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview

# Add shadcn/ui component
pnpm dlx shadcn-ui@latest add [component-name]

# Type checking
pnpm tsc --noEmit

# Deploy to Cloudflare
pnpm wrangler deploy --env [dev|production]
```

## Architecture & Structure

### Routing Architecture
- **Base path routing**: `/[locale]/` where locale is `en`, `ar`, or `tr`
- **TanStack Router**: File-based routing with locale parameters
- **SSR**: Server-side rendering via Cloudflare Workers
- **i18n**: Route-level language switching with RTL support for Arabic

### Project Structure
```
src/
├── routes/              # TanStack Start routes
│   ├── __root.tsx      # Root layout with locale handling
│   ├── index.tsx       # Homepage
│   └── [locale]/       # Localized routes (to be created)
├── components/
│   ├── ui/             # shadcn/ui components (customized)
│   ├── sections/       # Page sections (Hero, Vision, etc.)
│   └── shared/         # Header, Footer, LanguageSwitcher
├── i18n/
│   ├── en.json         # English translations
│   ├── ar.json         # Arabic translations
│   └── tr.json         # Turkish translations
├── styles/
│   └── styles.css      # Global styles + Tailwind
├── lib/
│   ├── utils.ts        # Utility functions
│   └── i18n.ts         # i18n helpers
└── data/
    └── constants.ts    # Constants (colors, links, etc.)

public/
├── fonts/              # NeueHaasDisplay font files (to be added)
└── images/             # Logos, icons (to be added)

migrations/
└── 0001_create_contacts.sql  # D1 database schema
```

## Design System

### Brand Colors (Tailwind Config)
```javascript
colors: {
  'sgg-orange': '#FF7F00',    // Primary - Vivid Orange
  'sgg-amber': '#FF9F00',     // Secondary - Amber Glow
  'sgg-obsidian': '#1E1E1E',  // Background - Obsidian
  'sgg-teal': '#002929',      // Depth - Cosmic Teal
  'sgg-steel': '#3F3F3F',     // Contrast - Steel Gray
}
```

### Typography
- **Font**: NeueHaasDisplay (Regular, Medium, Bold, Black)
- **Scale**: Mobile-first responsive typography
- **RTL Support**: Special handling for Arabic text (no letter-spacing, taller line-height)

### Component Patterns
- **Buttons**: Primary (orange), Secondary (outline), Ghost
- **Animations**: Framer Motion with fade-in, scale-in, and stagger effects
- **Cards**: Dark backgrounds with hover glow effects
- **Forms**: Dark inputs with orange focus states

## Internationalization (i18n)

### Supported Languages
- **English** (`en`) - Default, LTR
- **Arabic** (`ar`) - RTL layout
- **Turkish** (`tr`) - LTR

### RTL Implementation
```typescript
// Set html dir attribute based on locale
<html dir={locale === 'ar' ? 'rtl' : 'ltr'}>

// Use Tailwind's RTL-aware utilities
// ms/me instead of ml/mr
// start/end instead of left/right
```

### Translation Usage
```typescript
import { useTranslation } from '@/lib/i18n';

const { t } = useTranslation();
return <h1>{t('hero.tagline')}</h1>;
```

## Key Features

### Page Sections (in order)
1. **Hero** - Full-screen with particle effect, "Unite, shine, and play."
2. **Blood Strike Max** - Game showcase with download CTAs
3. **Our Vision** - Mission statement
4. **Who We Are** - Joint venture story (East meets Middle East)
5. **Our Partners** - NetEase and Ajlan & Bros logos
6. **Contact** - Contact form and information
7. **Footer** - Legal links, social media

### Critical Requirements
- **Mobile-first**: Excellent mobile experience required
- **RTL Arabic**: Flawless RTL layout for Arabic
- **Performance**: Lighthouse score 90+, <2s load time
- **Accessibility**: WCAG AA compliant, keyboard navigation
- **Animations**: Smooth 60fps, reduced motion support
- **Brand Adherence**: Strict adherence to brand colors and cosmic theme

## Deployment

### Environments
- **Production**: `sggplay.com` (main branch) - Not yet deployed
- **Development**: `https://sggweb-dev.stvnz.workers.dev` (dev branch) - ✅ Live
- **Auto-deploy**: Enabled on push to respective branches

### Wrangler Configuration
```toml
# wrangler.toml structure (already configured)
name = "sggweb"
main = "@tanstack/react-start/server-entry"
compatibility_date = "2025-11-02"
compatibility_flags = ["nodejs_compat"]

[env.production]
name = "sggweb-production"
route = "sggplay.com/*"
# D1: sgg-db (1a91d742-44d7-44ac-b3a3-5a01042abbf9)
# R2: sgg-assets (binding: R2_ASSETS)

[env.dev]
name = "sggweb-dev"
workers_dev = true  # Uses *.workers.dev subdomain
# D1: sgg-db-dev (b67c454e-a94f-4965-b4f1-8c5296483091)
# R2: sgg-assets-dev (binding: R2_ASSETS)
```

### Deployment Process
1. **Development**:
   - Build: `CLOUDFLARE_ENV=dev pnpm build`
   - Deploy: `pnpm wrangler deploy --env dev`
   - Live: https://sggweb-dev.stvnz.workers.dev
2. **Production**:
   - Build: `pnpm build`
   - Deploy: `pnpm wrangler deploy --env production`
   - Will be live at: sggplay.com
3. Test locally with `pnpm dev` or `pnpm preview`
4. Monitor Cloudflare Dashboard for deployment status

## Development Guidelines

### Code Style
- **TypeScript**: Use TypeScript for all components
- **Tailwind First**: Use Tailwind utilities; custom CSS only when necessary
- **Components**: Functional components with hooks
- **File Naming**: PascalCase for components, kebab-case for utilities

### Performance Best Practices
- Lazy load images with `loading="lazy"`
- Use WebP format with JPEG fallback
- Implement code splitting for routes
- Optimize animations (use `transform` and `opacity`)
- Compress all images (80-85% quality)

### Accessibility Requirements
- Semantic HTML (`<header>`, `<main>`, `<section>`, `<footer>`)
- ARIA labels for interactive elements
- Keyboard navigation support
- Focus indicators visible
- Color contrast meets WCAG AA
- Screen reader compatibility

### Git Workflow
- **Branches**: `main` (production), `dev` (staging), `feature/*` (optional)
- **Commits**: Format as `type: description` (feat, fix, docs, style, etc.)
- **PRs**: Merge feature → dev → main

## Project Constraints

- **Team Size**: Small team (<3 developers)
- **Distributed Team**: Multiple cities
- **Timeline**: Quick launch required
- **Future Plans**: New game launch H2 2026
- **Single Page**: Landing page only (for now)

## Testing Requirements

### Manual Testing Checklist
- All three languages (EN, AR, TR)
- RTL layout for Arabic
- Mobile, tablet, desktop responsiveness
- All download links functional
- Contact form submission (if implemented)
- Smooth animations (60fps)
- Keyboard navigation
- Screen reader compatibility

### Browser Support
- Chrome/Edge (latest)
- Firefox (latest)
- Safari (latest)
- Mobile Safari (iOS)
- Chrome Mobile (Android)

## Important Notes

### Asset Requirements
- **NeueHaasDisplay fonts**: Must be in `/public/fonts/` before launch
- **Logos**: SGG, NetEase, Ajlan & Bros in SVG format
- **Blood Strike Max**: High-quality screenshots
- **Favicon**: Multiple sizes + Apple Touch icons
- **OG Image**: For social media sharing

### Optional Features
- Contact form with D1 database (can be deferred)
- Newsletter signup (future enhancement)
- Analytics tracking (Cloudflare Analytics)

### Success Criteria
- Website loads in <2 seconds
- Lighthouse score 90+
- All languages working perfectly
- Arabic RTL layout flawless
- Mobile experience excellent
- Brand guidelines followed precisely
- Zero console errors
- WCAG AA compliant

## Resources

- **Project Docs**: See `/Docs/` for detailed guidelines
  - `DESIGN.md` - Complete design system and component specs
  - `DEVELOPMENT.md` - Development setup and workflow
  - `DEPLOYMENT.md` - Deployment procedures and troubleshooting
  - `TODO.md` - Comprehensive task list (384 tasks across 12 phases)

- **External Docs**:
  - [TanStack Start](https://tanstack.com/start/latest)
  - [TanStack Router](https://tanstack.com/router/latest)
  - [Tailwind CSS](https://tailwindcss.com/docs)
  - [shadcn/ui](https://ui.shadcn.com)
  - [Framer Motion](https://www.framer.com/motion/)
  - [Cloudflare Workers](https://developers.cloudflare.com/workers/)

## Team & Contact

**Location**: Riyadh, Kingdom of Saudi Arabia
**Tagline**: Unite, shine, and play.
**Website**: sggplay.com (when launched)
