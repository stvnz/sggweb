# Design Guidelines

## Brand Identity

**Tagline**: Unite, shine, and play.  
**Visual Theme**: Cosmic/stellar with premium gaming aesthetic  
**Core Values**: World-class quality, regional authenticity, unity

## Color System

### Primary Colors

```css
--sgg-orange: #FF7F00;      /* Vivid Orange - Primary brand color */
--sgg-amber: #FF9F00;       /* Amber Glow - Secondary/accents */
--sgg-obsidian: #1E1E1E;    /* Obsidian - Primary background */
--sgg-teal: #002929;        /* Cosmic Teal - Depth/contrast */
--sgg-steel: #3F3F3F;       /* Steel Gray - Secondary background */
```

### Tailwind Configuration

```javascript
// tailwind.config.ts
colors: {
  'sgg-orange': '#FF7F00',
  'sgg-amber': '#FF9F00',
  'sgg-obsidian': '#1E1E1E',
  'sgg-teal': '#002929',
  'sgg-steel': '#3F3F3F',
}
```

### Color Usage Guidelines

- **Primary Actions**: Use `sgg-orange` for buttons, CTAs, links
- **Hover States**: Use `sgg-amber` for glow effects and hover transitions
- **Backgrounds**: Use `sgg-obsidian` as primary, `sgg-teal` or `sgg-steel` for sections
- **Text**: White on dark backgrounds, adjust opacity for hierarchy
- **Gradients**: Orange → Amber for visual interest

### Color Examples

```tsx
// Primary button
<button className="bg-sgg-orange hover:bg-sgg-amber">
  Download Now
</button>

// Section with depth
<section className="bg-sgg-teal">
  <div className="bg-sgg-obsidian">
    Content
  </div>
</section>

// Gradient background
<div className="bg-gradient-to-r from-sgg-orange to-sgg-amber">
  Header
</div>
```

## Typography

### Font Family

**Primary Font**: NeueHaasDisplay

- **Regular**: Body text, paragraphs
- **Medium**: Subheadings, labels
- **Bold**: Headlines, emphasis
- **Black**: Hero headlines, major CTAs

### Font Setup

```css
/* app/styles/fonts.css */
@font-face {
  font-family: 'NeueHaasDisplay';
  src: url('/fonts/NeueHaasDisplay-Regular.woff2') format('woff2');
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: 'NeueHaasDisplay';
  src: url('/fonts/NeueHaasDisplay-Medium.woff2') format('woff2');
  font-weight: 500;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: 'NeueHaasDisplay';
  src: url('/fonts/NeueHaasDisplay-Bold.woff2') format('woff2');
  font-weight: 700;
  font-style: normal;
  font-display: swap;
}

@font-face {
  font-family: 'NeueHaasDisplay';
  src: url('/fonts/NeueHaasDisplay-Black.woff2') format('woff2');
  font-weight: 900;
  font-style: normal;
  font-display: swap;
}
```

### Typography Scale

```css
/* Headlines */
.h1 { font-size: 4rem; font-weight: 900; line-height: 1.1; }    /* 64px */
.h2 { font-size: 3rem; font-weight: 700; line-height: 1.2; }    /* 48px */
.h3 { font-size: 2rem; font-weight: 700; line-height: 1.3; }    /* 32px */
.h4 { font-size: 1.5rem; font-weight: 500; line-height: 1.4; }  /* 24px */

/* Body */
.body-large { font-size: 1.25rem; font-weight: 400; }    /* 20px */
.body { font-size: 1rem; font-weight: 400; }             /* 16px */
.body-small { font-size: 0.875rem; font-weight: 400; }   /* 14px */

/* Mobile adjustments */
@media (max-width: 768px) {
  .h1 { font-size: 2.5rem; }   /* 40px */
  .h2 { font-size: 2rem; }     /* 32px */
  .h3 { font-size: 1.5rem; }   /* 24px */
}
```

### Tailwind Typography Classes

```tsx
<h1 className="text-6xl md:text-7xl font-black">Hero Headline</h1>
<h2 className="text-4xl md:text-5xl font-bold">Section Title</h2>
<h3 className="text-2xl md:text-3xl font-bold">Subsection</h3>
<p className="text-base md:text-lg font-normal">Body text</p>
```

## Spacing System

Use Tailwind's spacing scale (4px base):

```
4px   = space-1    (p-1, m-1)
8px   = space-2    (p-2, m-2)
16px  = space-4    (p-4, m-4)
24px  = space-6    (p-6, m-6)
32px  = space-8    (p-8, m-8)
48px  = space-12   (p-12, m-12)
64px  = space-16   (p-16, m-16)
96px  = space-24   (p-24, m-24)
128px = space-32   (p-32, m-32)
```

### Section Spacing

```tsx
// Standard section padding
<section className="py-24 md:py-32">
  <div className="container mx-auto px-4 md:px-6">
    Content
  </div>
</section>
```

## Components

### Button Styles

```tsx
// Primary button (Orange)
<button className="px-6 py-3 bg-sgg-orange hover:bg-sgg-amber text-white font-medium rounded-lg transition-all duration-300 hover:shadow-lg hover:shadow-sgg-orange/50">
  Download Now
</button>

// Secondary button (Outline)
<button className="px-6 py-3 border-2 border-sgg-orange text-sgg-orange hover:bg-sgg-orange hover:text-white font-medium rounded-lg transition-all duration-300">
  Learn More
</button>

// Ghost button
<button className="px-6 py-3 text-sgg-orange hover:text-sgg-amber font-medium transition-colors duration-300">
  View Details
</button>
```

### Card Styles

```tsx
// Standard card
<div className="bg-sgg-steel rounded-xl p-6 hover:bg-sgg-steel/80 transition-all duration-300 border border-sgg-steel">
  <h3 className="text-xl font-bold mb-4">Title</h3>
  <p className="text-white/80">Description</p>
</div>

// Card with glow effect
<div className="bg-sgg-steel rounded-xl p-6 hover:shadow-xl hover:shadow-sgg-orange/20 transition-all duration-300">
  Content
</div>
```

### Input Styles

```tsx
// Text input
<input
  type="text"
  className="w-full px-4 py-3 bg-sgg-steel border border-sgg-steel rounded-lg text-white placeholder:text-white/50 focus:outline-none focus:border-sgg-orange transition-colors"
  placeholder="Enter your email"
/>

// Textarea
<textarea
  className="w-full px-4 py-3 bg-sgg-steel border border-sgg-steel rounded-lg text-white placeholder:text-white/50 focus:outline-none focus:border-sgg-orange transition-colors resize-none"
  rows={5}
  placeholder="Your message"
/>
```

## Animations

### Framer Motion Presets

```tsx
// Fade in from bottom
const fadeInUp = {
  initial: { y: 40, opacity: 0 },
  animate: { y: 0, opacity: 1 },
  transition: { duration: 0.6, ease: 'easeOut' }
};

// Fade in
const fadeIn = {
  initial: { opacity: 0 },
  animate: { opacity: 1 },
  transition: { duration: 0.8 }
};

// Scale in
const scaleIn = {
  initial: { scale: 0.9, opacity: 0 },
  animate: { scale: 1, opacity: 1 },
  transition: { duration: 0.5, ease: 'easeOut' }
};

// Stagger children
const staggerContainer = {
  animate: {
    transition: {
      staggerChildren: 0.1
    }
  }
};
```

### Usage Examples

```tsx
<motion.section
  initial="initial"
  whileInView="animate"
  viewport={{ once: true }}
  variants={fadeInUp}
>
  <motion.h2 variants={fadeInUp}>Title</motion.h2>
  <motion.p variants={fadeInUp}>Content</motion.p>
</motion.section>
```

### Glow Effects

```tsx
// Orange glow on hover
<button className="hover:shadow-lg hover:shadow-sgg-orange/50 transition-shadow duration-300">
  Button
</button>

// Pulsing glow animation
@keyframes pulse-glow {
  0%, 100% { box-shadow: 0 0 20px rgba(255, 127, 0, 0.3); }
  50% { box-shadow: 0 0 40px rgba(255, 127, 0, 0.6); }
}

<div className="animate-[pulse-glow_2s_ease-in-out_infinite]">
  Content
</div>
```

## Layout Patterns

### Hero Section

```tsx
<section className="relative min-h-screen flex items-center justify-center bg-sgg-obsidian overflow-hidden">
  {/* Background particles/stars */}
  <div className="absolute inset-0 opacity-30">
    {/* Particle component */}
  </div>
  
  {/* Content */}
  <div className="relative z-10 text-center px-4">
    <motion.h1 
      className="text-6xl md:text-7xl font-black text-white mb-6"
      {...fadeInUp}
    >
      Unite, shine, and play.
    </motion.h1>
    <motion.p 
      className="text-xl md:text-2xl text-white/80 mb-8"
      {...fadeInUp}
    >
      World-Class Games. Made for the Middle East.
    </motion.p>
  </div>
</section>
```

### Section Container

```tsx
<section className="py-24 md:py-32 bg-sgg-obsidian">
  <div className="container mx-auto px-4 md:px-6 max-w-7xl">
    <h2 className="text-4xl md:text-5xl font-bold text-white mb-12 text-center">
      Section Title
    </h2>
    {/* Section content */}
  </div>
</section>
```

### Grid Layouts

```tsx
// Two-column split
<div className="grid md:grid-cols-2 gap-12 items-center">
  <div>Left content</div>
  <div>Right content</div>
</div>

// Three-column grid
<div className="grid md:grid-cols-3 gap-8">
  <div>Card 1</div>
  <div>Card 2</div>
  <div>Card 3</div>
</div>
```

## Responsive Design

### Breakpoints

```javascript
// tailwind.config.ts
screens: {
  'sm': '640px',   // Mobile landscape
  'md': '768px',   // Tablet
  'lg': '1024px',  // Desktop
  'xl': '1280px',  // Large desktop
  '2xl': '1536px', // Extra large
}
```

### Mobile-First Approach

```tsx
// Default: Mobile styles
// md: Tablet and up
// lg: Desktop and up

<div className="text-2xl md:text-4xl lg:text-5xl">
  Responsive heading
</div>

<div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4 md:gap-6 lg:gap-8">
  Cards
</div>
```

## RTL Support (Arabic)

### Layout Adjustments

```tsx
// Conditional direction
<html dir={locale === 'ar' ? 'rtl' : 'ltr'}>

// RTL-aware margins
<div className="ms-4 me-8">  {/* Use ms/me instead of ml/mr */}
  Content
</div>

// RTL-aware text alignment
<p className="text-start">  {/* Use start/end instead of left/right */}
  Text that respects direction
</p>
```

### Arabic Typography

```css
/* Optimize for Arabic script */
[dir="rtl"] {
  letter-spacing: normal;  /* Arabic doesn't use letter-spacing */
}

/* Adjust line-height for Arabic */
[dir="rtl"] .body {
  line-height: 1.8;  /* Slightly taller for Arabic */
}
```

## Accessibility

### Color Contrast

All text meets WCAG AA standards:
- White text on `sgg-obsidian`: ✅ AAA
- White text on `sgg-orange`: ✅ AA
- Orange text on `sgg-obsidian`: ✅ AAA

### Focus States

```tsx
<button className="focus:outline-none focus:ring-2 focus:ring-sgg-orange focus:ring-offset-2 focus:ring-offset-sgg-obsidian">
  Accessible button
</button>
```

### Semantic HTML

```tsx
// Use proper semantic elements
<header>Navigation</header>
<main>
  <section aria-label="Hero">
    <h1>Main heading</h1>
  </section>
</main>
<footer>Footer content</footer>

// Add ARIA labels
<button aria-label="Download Blood Strike Max">
  <DownloadIcon />
</button>
```

## Image Guidelines

### Logo Usage

- **Primary**: Colored logo (orange gate) on dark backgrounds
- **Alternative**: White logo on very dark backgrounds
- **Minimum Size**: 120px width
- **Clear Space**: At least 20px padding around logo

### Image Formats

- **Logos/Icons**: SVG (preferred) or PNG with transparency
- **Photos**: WebP with JPEG fallback
- **Large Images**: Progressive JPEG or WebP
- **Optimization**: Compress all images (80-85% quality)

### Responsive Images

```tsx
<img
  src="/images/hero.webp"
  srcSet="/images/hero-400.webp 400w, /images/hero-800.webp 800w, /images/hero-1200.webp 1200w"
  sizes="(max-width: 768px) 100vw, (max-width: 1200px) 80vw, 1200px"
  alt="Blood Strike Max gameplay"
  loading="lazy"
/>
```

## Icon System

Use **Lucide React** icons for consistency:

```tsx
import { Download, Globe, Mail, ArrowRight } from 'lucide-react';

<Download className="w-6 h-6 text-sgg-orange" />
<Globe className="w-5 h-5 text-white/80" />
```

## Performance Guidelines

### CSS Optimization

- Use Tailwind utilities first
- Minimize custom CSS
- Avoid `@apply` overuse
- Purge unused styles in production

### Animation Performance

- Prefer `transform` and `opacity` for animations
- Use `will-change` sparingly
- Avoid animating `width`, `height`, `top`, `left`

### Image Optimization

- Serve WebP format
- Use appropriate dimensions
- Implement lazy loading
- Add blur placeholders

## Design Checklist

Before pushing to production:

- [ ] All colors from brand palette
- [ ] NeueHaasDisplay font loaded correctly
- [ ] Responsive on mobile, tablet, desktop
- [ ] RTL layout works for Arabic
- [ ] Animations smooth (60fps)
- [ ] Accessible (keyboard navigation, ARIA labels)
- [ ] Images optimized and compressed
- [ ] Contrast ratios meet WCAG AA
- [ ] No console errors or warnings
- [ ] Hover states defined for interactive elements
- [ ] Focus states visible for accessibility
- [ ] Loading states for async actions

## Design Resources

- **Brand Guidelines PDF**: `/docs/SGG_Brand_Guidelines.pdf`
- **Logo Files**: `/public/images/logo/`
- **Font Files**: `/public/fonts/NeueHaasDisplay/`
- **Figma**: [Link to design files if available]

## Component Library

Use shadcn/ui components as base, customize with brand colors:

```bash
# Install component
pnpm dlx shadcn-ui@latest add button

# Customize in app/components/ui/button.tsx
# Apply sgg-orange, hover states, etc.
```
