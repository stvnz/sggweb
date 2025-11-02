# TODO List

**Last Updated**: 2025-01-XX  
**Project Status**: Initial Setup Phase

## Phase 1: Project Foundation

### Setup & Configuration
- [ ] Initialize TanStack Start project
- [ ] Configure wrangler.toml for Cloudflare Workers
- [ ] Set up Tailwind CSS with brand colors
- [ ] Add shadcn/ui components library
- [ ] Configure NeueHaasDisplay font loading
- [ ] Set up Framer Motion for animations
- [ ] Create environment files (.env.example, .env.local)
- [ ] Initialize Git repository
- [ ] Create GitHub/GitLab repository
- [ ] Set up dev and main branches

### Project Structure
- [ ] Create folder structure (routes, components, i18n, styles)
- [ ] Set up TanStack Router with locale-based routing
- [ ] Create __root.tsx with base layout
- [ ] Set up global styles (fonts.css, globals.css)
- [ ] Configure TypeScript paths (@/components, @/lib, etc.)

### Design System
- [ ] Create Tailwind config with SGG brand colors
- [ ] Set up color variables in CSS
- [ ] Create typography classes
- [ ] Define spacing system
- [ ] Create reusable animation variants
- [ ] Set up responsive breakpoints

## Phase 2: Core Components

### Layout Components
- [ ] Create Header component with logo and language switcher
- [ ] Create Footer component with legal links and social media
- [ ] Create LanguageSwitcher component
- [ ] Create Container component for consistent layout
- [ ] Set up RTL support for Arabic

### shadcn/ui Components
- [ ] Install and customize Button component
- [ ] Install and customize Card component
- [ ] Install and customize Input component
- [ ] Install and customize Textarea component
- [ ] Install and customize Dialog/Modal component
- [ ] Install and customize Select component (for language switcher)

### Custom Components
- [ ] Create ParticleBackground component (hero section)
- [ ] Create SectionHeading component
- [ ] Create ScrollIndicator component
- [ ] Create GlowButton component (with orange glow effect)
- [ ] Create ImageWithFallback component
- [ ] Create LoadingSpinner component

## Phase 3: Internationalization

### i18n Setup
- [ ] Create translation structure (en.json, ar.json, tr.json)
- [ ] Set up i18n utilities and hooks
- [ ] Configure locale detection
- [ ] Implement language switcher functionality
- [ ] Set up RTL layout switching for Arabic
- [ ] Test language switching without page reload

### Translation Content
- [ ] Translate Hero section (all languages)
- [ ] Translate Blood Strike Max section (all languages)
- [ ] Translate Our Vision section (all languages)
- [ ] Translate Who We Are section (all languages)
- [ ] Translate Partners section (all languages)
- [ ] Translate Contact section (all languages)
- [ ] Translate Footer (all languages)
- [ ] Translate meta tags and SEO content (all languages)

## Phase 4: Page Sections

### Hero Section
- [ ] Create Hero component with full-screen layout
- [ ] Add particle/star background effect
- [ ] Add SGG logo with fade-in animation
- [ ] Add tagline "Unite, shine, and play."
- [ ] Add scroll indicator
- [ ] Implement smooth scroll to next section
- [ ] Test responsive layout (mobile, tablet, desktop)
- [ ] Optimize animations for performance

### Blood Strike Max Section
- [ ] Create BloodStrikeMax component
- [ ] Add game screenshots/visuals
- [ ] Add game description and key features
- [ ] Create download button components
- [ ] Add platform icons (iOS, Android, PC)
- [ ] Implement hover effects on download buttons
- [ ] Add stats display (27 countries, player count)
- [ ] Test responsive image loading

### Our Vision Section
- [ ] Create Vision component
- [ ] Write compelling copy (2-3 paragraphs)
- [ ] Add background gradient or texture
- [ ] Implement fade-in animation on scroll
- [ ] Add decorative elements (if needed)
- [ ] Test typography scaling on mobile

### Who We Are Section
- [ ] Create About component
- [ ] Add joint venture story content
- [ ] Create visual split (East meets Middle East)
- [ ] Add subtle animations
- [ ] Test responsive layout

### Our Partners Section
- [ ] Create Partners component
- [ ] Add NetEase logo and description
- [ ] Add Ajlan & Bros logo and description
- [ ] Implement clean two-column layout
- [ ] Add hover effects on partner cards
- [ ] Ensure logos are high-quality and optimized

### Contact Section
- [ ] Create Contact component
- [ ] Add contact information (email, location)
- [ ] Create contact form (name, email, message)
- [ ] Add form validation
- [ ] Implement form submission (if using D1)
- [ ] Add success/error messages
- [ ] Add social media links
- [ ] Test form on all devices

### Footer
- [ ] Create Footer component
- [ ] Add SGG, NetEase, ABHG logos
- [ ] Add legal links (Privacy, Terms, Cookies)
- [ ] Add social media icons
- [ ] Add copyright notice
- [ ] Add "Unite, shine, and play." tagline
- [ ] Ensure responsive layout

## Phase 5: Assets & Media

### Logos & Branding
- [ ] Export SGG logo (colored version) as SVG
- [ ] Export SGG logo (white version) as SVG
- [ ] Export NetEase logo
- [ ] Export Ajlan & Bros logo
- [ ] Add favicon (multiple sizes)
- [ ] Add Apple Touch icons
- [ ] Add OG image for social sharing

### Fonts
- [ ] Download NeueHaasDisplay font files
- [ ] Convert to WOFF2 format
- [ ] Upload to /public/fonts/
- [ ] Set up @font-face declarations
- [ ] Test font loading on all browsers

### Images
- [ ] Collect Blood Strike Max screenshots
- [ ] Optimize images (WebP format)
- [ ] Create responsive image variants
- [ ] Add placeholder images for development
- [ ] Add background textures/gradients
- [ ] Compress all images for web

### Icons
- [ ] Set up Lucide React icons
- [ ] Choose icons for download buttons
- [ ] Choose icons for social media
- [ ] Choose icons for contact section
- [ ] Ensure consistent icon sizing

## Phase 6: Features & Functionality

### Smooth Scrolling
- [ ] Implement smooth scroll behavior
- [ ] Add scroll-to-section navigation
- [ ] Test scroll performance on mobile
- [ ] Add scroll-triggered animations

### Animations
- [ ] Implement fade-in animations on scroll
- [ ] Add glow effects on buttons/CTAs
- [ ] Create particle effect for hero section
- [ ] Add subtle parallax effects
- [ ] Test animation performance (60fps)
- [ ] Reduce motion for accessibility preferences

### Responsive Design
- [ ] Test on mobile devices (iOS, Android)
- [ ] Test on tablets (portrait and landscape)
- [ ] Test on desktop (various screen sizes)
- [ ] Test on large screens (1920px+)
- [ ] Fix any layout issues
- [ ] Optimize touch targets for mobile

### Performance Optimization
- [ ] Implement lazy loading for images
- [ ] Optimize bundle size
- [ ] Enable code splitting
- [ ] Compress assets
- [ ] Set up CDN caching headers
- [ ] Test Lighthouse performance score (aim for 90+)
- [ ] Test on slow 3G connection

## Phase 7: Database & Forms (Optional)

### D1 Database Setup
- [ ] Create D1 database (production and dev)
- [ ] Write migration for contacts table
- [ ] Apply migrations
- [ ] Set up database bindings in wrangler.toml

### Contact Form Backend
- [ ] Create API route for form submission
- [ ] Implement form data validation
- [ ] Save submissions to D1 database
- [ ] Add email notification (optional)
- [ ] Implement rate limiting
- [ ] Test form submission flow

## Phase 8: SEO & Meta

### Meta Tags
- [ ] Add title tags (all languages)
- [ ] Add meta descriptions (all languages)
- [ ] Add Open Graph tags
- [ ] Add Twitter Card tags
- [ ] Add canonical URLs
- [ ] Add hreflang tags for multilingual SEO
- [ ] Add JSON-LD structured data

### Sitemap & Robots
- [ ] Generate sitemap.xml
- [ ] Create robots.txt
- [ ] Submit sitemap to Google Search Console
- [ ] Test meta tags with social media debuggers

### Analytics
- [ ] Set up Cloudflare Analytics (or alternative)
- [ ] Implement basic event tracking
- [ ] Track language preferences
- [ ] Track download button clicks
- [ ] Test analytics in production

## Phase 9: Testing

### Manual Testing
- [ ] Test all sections on desktop browsers (Chrome, Firefox, Safari)
- [ ] Test all sections on mobile browsers (iOS Safari, Chrome Mobile)
- [ ] Test language switching (EN ↔ AR ↔ TR)
- [ ] Test RTL layout for Arabic
- [ ] Test all download links
- [ ] Test contact form submission
- [ ] Test keyboard navigation
- [ ] Test screen reader compatibility

### Cross-Browser Testing
- [ ] Chrome (latest)
- [ ] Firefox (latest)
- [ ] Safari (latest)
- [ ] Edge (latest)
- [ ] Mobile Safari (iOS)
- [ ] Chrome Mobile (Android)

### Performance Testing
- [ ] Run Lighthouse audit (aim for 90+ score)
- [ ] Test Core Web Vitals
- [ ] Test on slow 3G connection
- [ ] Optimize based on results

### Accessibility Testing
- [ ] Run WAVE accessibility checker
- [ ] Test keyboard navigation
- [ ] Test screen reader (VoiceOver, NVDA)
- [ ] Verify color contrast ratios
- [ ] Check ARIA labels
- [ ] Test focus indicators

## Phase 10: Deployment

### Cloudflare Setup
- [ ] Create Cloudflare Workers project
- [ ] Configure production environment
- [ ] Configure dev/staging environment
- [ ] Set up custom domain (sggplay.com)
- [ ] Set up dev subdomain (dev.sggplay.com)
- [ ] Configure SSL/TLS settings
- [ ] Set up environment variables

### Initial Deployment
- [ ] Deploy to dev environment
- [ ] Test dev deployment
- [ ] Fix any deployment issues
- [ ] Deploy to production
- [ ] Verify production deployment
- [ ] Test all functionality in production

### Post-Deployment
- [ ] Monitor error logs
- [ ] Check analytics data
- [ ] Verify all links work
- [ ] Test from different geographic locations
- [ ] Get team feedback
- [ ] Make necessary adjustments

## Phase 11: Documentation

- [x] Create README.md
- [x] Create DEVELOPMENT.md
- [x] Create DEPLOYMENT.md
- [x] Create DESIGN.md
- [x] Create TODO.md
- [ ] Document deployment process
- [ ] Document troubleshooting steps
- [ ] Create component documentation (if needed)

## Phase 12: Future Enhancements

### Content Management
- [ ] Consider adding CMS for easier content updates
- [ ] Add blog section (if needed)
- [ ] Add news/announcements section

### Additional Features
- [ ] Add newsletter signup
- [ ] Add career page (separate from main landing)
- [ ] Add press/media kit page
- [ ] Implement advanced analytics
- [ ] Add A/B testing capabilities

### Games Section Expansion
- [ ] Prepare for adding new games in 2026
- [ ] Create modular game card component
- [ ] Plan games archive/grid layout

## Notes for AI Agents

### Priority Levels
- **P0** (Critical): Project setup, core sections, i18n, deployment
- **P1** (High): Contact form, animations, responsive design, SEO
- **P2** (Medium): Advanced features, optimizations, analytics
- **P3** (Low): Future enhancements, nice-to-haves

### Current Focus
Start with Phase 1 (Project Foundation) and Phase 2 (Core Components)

### Dependencies
- NeueHaasDisplay font files needed before Phase 5
- Brand assets (logos) needed before Phase 5
- Blood Strike Max screenshots needed before Phase 4
- Translation content needed before Phase 4

### Known Constraints
- Small team (<3 developers)
- Distributed across multiple cities
- Must launch quickly but with high quality
- Future game launch not until H2 2026
- Contact form may be optional initially

### Success Criteria
- [ ] Website loads in <2 seconds
- [ ] Lighthouse score 90+
- [ ] All three languages working perfectly
- [ ] Arabic RTL layout flawless
- [ ] Mobile experience excellent
- [ ] Brand guidelines followed precisely
- [ ] Zero console errors
- [ ] Accessible (WCAG AA compliant)

---

**Instructions for AI Agents**:
- Update this file as tasks are completed
- Add new tasks as they arise
- Mark completed tasks with [x]
- Add notes for complex tasks
- Flag blockers immediately
- Keep this file in sync with actual progress
