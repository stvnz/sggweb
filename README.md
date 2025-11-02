# Stellar Gate Games - Corporate Website

Official website for Stellar Gate Games, bringing world-class gaming experiences to the Middle East.

## Overview

Single-page landing website built with TanStack Start and deployed on Cloudflare Workers. Features multilingual support (English, Arabic RTL, Turkish) and brand-aligned design with cosmic theme.

## Tech Stack

- **Framework**: TanStack Start + TanStack Router
- **Styling**: Tailwind CSS + shadcn/ui + Framer Motion
- **Typography**: NeueHaasDisplay
- **Deployment**: Cloudflare Workers + Pages
- **Storage**: Cloudflare R2 (assets) + D1 (database)
- **Package Manager**: pnpm

## Quick Start

```bash
# Install dependencies
pnpm install

# Run development server
pnpm dev

# Build for production
pnpm build

# Preview production build
pnpm preview
```

## Website Sections

1. **Hero** - Brand introduction with "Unite, shine, and play."
2. **Blood Strike Max** - Game showcase with download CTAs
3. **Our Vision** - Mission statement
4. **Who We Are** - Joint venture story
5. **Our Partners** - NetEase and Ajlan & Bros logos
6. **Contact** - Contact form and information
7. **Footer** - Legal links and social media

## Documentation

- **[DEVELOPMENT.md](./DEVELOPMENT.md)** - Setup and development guidelines
- **[DEPLOYMENT.md](./DEPLOYMENT.md)** - Deployment procedures
- **[DESIGN.md](./DESIGN.md)** - Design system and brand guidelines
- **[TODO.md](./TODO.md)** - Project tasks and progress

## Brand Colors

- **Vivid Orange** (#FF7F00) - Primary
- **Amber Glow** (#FF9F00) - Secondary
- **Obsidian** (#1E1E1E) - Background
- **Cosmic Teal** (#002929) - Depth
- **Steel Gray** (#3F3F3F) - Contrast

## Languages

- English (`/en`)
- Arabic (`/ar`) - RTL support
- Turkish (`/tr`)

## Project Structure

```
sgg-website/
├── app/
│   ├── routes/          # TanStack Start routes
│   ├── components/      # React components
│   ├── styles/          # Global styles
│   ├── i18n/            # Translation files
│   └── utils/           # Helper functions
├── public/              # Static assets
├── docs/                # Documentation
└── wrangler.toml        # Cloudflare config
```

## Team

Small distributed team (<3 developers)  
Riyadh, Kingdom of Saudi Arabia

## License

© 2025 Stellar Gate Games. All rights reserved.

---

**Website**: sggplay.com  
**Tagline**: Unite, shine, and play.
