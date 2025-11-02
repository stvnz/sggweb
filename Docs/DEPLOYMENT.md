# Deployment Guidelines

## Overview

The website is deployed on Cloudflare Workers with static assets on Cloudflare Pages. Two environments: **dev** (staging) and **production**.

## Prerequisites

- Cloudflare account with Workers enabled
- Wrangler CLI authenticated
- Access to `wrangler.toml` configuration
- Proper environment variables set

## Environment Setup

### Production Environment

- **URL**: sggplay.com
- **Branch**: main
- **Auto-deploy**: Enabled on push to main

### Development Environment

- **URL**: https://sggweb-dev.stvnz.workers.dev
- **Branch**: dev
- **Auto-deploy**: Enabled on push to dev
- **Note**: Uses workers.dev subdomain (custom domain can be added later)

## Deployment Methods

### Method 1: Automatic Deployment (Recommended)

```bash
# Deploy to dev environment
git checkout dev
git pull origin dev
git push origin dev
# Auto-deploys to dev.sggplay.com

# Deploy to production
git checkout main
git merge dev
git push origin main
# Auto-deploys to sggplay.com
```

### Method 2: Manual Deployment via Wrangler

```bash
# Deploy to dev environment
CLOUDFLARE_ENV=dev pnpm build
pnpm wrangler deploy --env dev

# Deploy to production
pnpm build
pnpm wrangler deploy --env production
```

**Note**: Use `CLOUDFLARE_ENV=dev` for dev builds to ensure correct environment configuration.

## Pre-Deployment Checklist

- [ ] All tests pass locally
- [ ] Code is reviewed and approved
- [ ] Translations updated for all languages (EN, AR, TR)
- [ ] Images optimized and compressed
- [ ] Environment variables configured
- [ ] No console errors or warnings
- [ ] Mobile responsiveness verified
- [ ] RTL layout tested for Arabic
- [ ] All links verified (download buttons, social media)
- [ ] Contact form tested (if applicable)

## Configuration Files

### wrangler.toml Structure

```toml
name = "sggweb"
main = "@tanstack/react-start/server-entry"
compatibility_date = "2025-11-02"
compatibility_flags = ["nodejs_compat"]

# Production environment
[env.production]
name = "sggweb-production"
route = "sggplay.com/*"
vars = { ENVIRONMENT = "production" }

# Production D1 database
[[env.production.d1_databases]]
binding = "DB"
database_name = "sgg-db"
database_id = "1a91d742-44d7-44ac-b3a3-5a01042abbf9"

# Production R2 bucket
[[env.production.r2_buckets]]
binding = "R2_ASSETS"
bucket_name = "sgg-assets"

# Development environment
[env.dev]
name = "sggweb-dev"
vars = { ENVIRONMENT = "development" }
workers_dev = true

# Development D1 database
[[env.dev.d1_databases]]
binding = "DB"
database_name = "sgg-db-dev"
database_id = "b67c454e-a94f-4965-b4f1-8c5296483091"

# Development R2 bucket
[[env.dev.r2_buckets]]
binding = "R2_ASSETS"
bucket_name = "sgg-assets-dev"
```

## Cloudflare Dashboard Setup

### 1. Workers & Pages

1. Navigate to **Workers & Pages** in Cloudflare Dashboard
2. Connect GitHub repository (if using automatic deployment)
3. Configure build settings:
   - **Build command**: `pnpm build`
   - **Build output directory**: `.output`
   - **Root directory**: `/`

### 2. Custom Domain Setup

**Production (sggplay.com)**:
1. Go to **Custom domains** in your Worker
2. Add `sggplay.com` and `www.sggplay.com`
3. Cloudflare will automatically configure DNS

**Development (dev.sggplay.com)**:
1. Add subdomain `dev.sggplay.com` to dev Worker
2. Verify DNS configuration

### 3. Environment Variables

Set in Cloudflare Dashboard under **Settings > Variables**:

**Production**:
```
PUBLIC_SITE_URL=https://sggplay.com
ENVIRONMENT=production
```

**Development**:
```
PUBLIC_SITE_URL=https://dev.sggplay.com
ENVIRONMENT=development
```

## R2 Storage Setup (When Needed)

### Create R2 Buckets

```bash
# Create production bucket
pnpm wrangler r2 bucket create sgg-assets

# Create preview bucket for dev
pnpm wrangler r2 bucket create sgg-assets-preview
```

### Upload Assets to R2

```bash
# Upload file to production bucket
pnpm wrangler r2 object put sgg-assets/images/logo.png --file=./public/images/logo.png

# Upload entire directory
pnpm wrangler r2 object put sgg-assets/videos/ --file=./public/videos/ --recursive
```

## D1 Database Setup (When Needed)

### Create Databases

```bash
# Create production database
pnpm wrangler d1 create sgg-db

# Create dev database
pnpm wrangler d1 create sgg-db-dev
```

### Run Migrations

```bash
# Apply migrations to production
pnpm wrangler d1 migrations apply sgg-db --env production

# Apply migrations to dev
pnpm wrangler d1 migrations apply sgg-db-dev --env dev
```

### Example Migration

```sql
-- migrations/0001_create_contacts.sql
CREATE TABLE IF NOT EXISTS contacts (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT NOT NULL,
  email TEXT NOT NULL,
  message TEXT NOT NULL,
  locale TEXT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

## Deployment Process

### Step-by-Step Production Deployment

1. **Merge to main branch**
   ```bash
   git checkout main
   git merge dev
   ```

2. **Verify build locally**
   ```bash
   pnpm build
   pnpm preview
   # Test at http://localhost:3000
   ```

3. **Push to trigger deployment**
   ```bash
   git push origin main
   ```

4. **Monitor deployment**
   - Check Cloudflare Dashboard > Workers & Pages > Deployments
   - View deployment logs for errors

5. **Verify production site**
   - Visit https://sggplay.com
   - Test all three languages
   - Verify all CTAs and links
   - Check mobile responsiveness

### Rollback Procedure

If deployment fails or issues found:

```bash
# Option 1: Revert commit
git revert HEAD
git push origin main

# Option 2: Manual rollback in Cloudflare Dashboard
# Go to Deployments > Select previous version > Rollback
```

## Monitoring & Analytics

### Check Deployment Status

```bash
# View recent deployments
pnpm wrangler deployments list

# View specific deployment
pnpm wrangler deployment view <deployment-id>
```

### View Logs

```bash
# Tail production logs
pnpm wrangler tail --env production

# Tail dev logs
pnpm wrangler tail --env dev
```

### Performance Monitoring

Check in Cloudflare Dashboard:
- **Analytics > Workers**: Request volume, errors, duration
- **Speed > Performance**: Core Web Vitals
- **Analytics > Traffic**: Geographic distribution

## Troubleshooting

### Deployment Fails

1. Check build logs in Cloudflare Dashboard
2. Verify `wrangler.toml` configuration
3. Ensure all dependencies are in `package.json`
4. Check for TypeScript errors: `pnpm tsc --noEmit`

### 404 Errors After Deployment

- Verify route configuration in `wrangler.toml`
- Check TanStack Router configuration
- Ensure `__root.tsx` and route files are correct

### Assets Not Loading

- Check R2 bucket permissions
- Verify asset paths in code
- Ensure CORS settings allow your domain

### Database Connection Issues

- Verify D1 binding in `wrangler.toml`
- Check database ID is correct
- Ensure migrations have been applied

### Slow Performance

- Enable Cloudflare caching for static assets
- Optimize images (use WebP, proper sizing)
- Minimize JavaScript bundle size
- Use lazy loading for images and components

## SSL/TLS Configuration

SSL is automatically managed by Cloudflare:
- **SSL Mode**: Full (strict) - recommended
- **Always Use HTTPS**: Enabled
- **Automatic HTTPS Rewrites**: Enabled
- **Minimum TLS Version**: 1.2

## CDN & Caching

### Cache Configuration

```typescript
// Set cache headers in your responses
export const headers = {
  'Cache-Control': 'public, max-age=3600, s-maxage=86400',
};
```

### Purge Cache

```bash
# Purge entire cache
pnpm wrangler kv:key purge --all

# Or via Cloudflare Dashboard > Caching > Purge Cache
```

## Security Checklist

- [ ] HTTPS enforced
- [ ] Environment variables not exposed to client
- [ ] Content Security Policy configured
- [ ] CORS properly configured
- [ ] Rate limiting enabled (if using forms)
- [ ] Input validation on all forms
- [ ] SQL injection prevention (parameterized queries)

## Post-Deployment

### Verification Steps

1. **Smoke Test**:
   - Homepage loads correctly
   - All sections visible
   - Language switcher works
   - Download buttons link correctly

2. **Cross-Browser Test**:
   - Chrome, Firefox, Safari
   - Mobile Safari, Chrome Mobile

3. **Performance Check**:
   - Run Lighthouse audit
   - Verify Core Web Vitals
   - Check mobile performance

4. **Monitoring Setup**:
   - Verify analytics tracking
   - Set up error alerts
   - Monitor request logs

### Update Team

Notify team of successful deployment:
- Share deployment URL
- List new features/changes
- Note any required actions

## Costs & Limits

### Cloudflare Workers Free Tier

- **Requests**: 100,000/day
- **Duration**: 10ms CPU time per request
- **Memory**: 128MB per worker

### Paid Plan Benefits

- **Requests**: Unlimited
- **Duration**: 50ms CPU time
- **Memory**: 512MB

### Current Usage Monitoring

Check in Cloudflare Dashboard > Workers & Pages > Analytics

## Emergency Contacts

- **Cloudflare Support**: https://dash.cloudflare.com/support
- **Wrangler Issues**: https://github.com/cloudflare/workers-sdk/issues

## Additional Resources

- [Cloudflare Workers Docs](https://developers.cloudflare.com/workers/)
- [Wrangler CLI Docs](https://developers.cloudflare.com/workers/wrangler/)
- [TanStack Start Cloudflare Guide](https://tanstack.com/start/latest/docs/framework/react/guide/hosting)
- [Cloudflare R2 Docs](https://developers.cloudflare.com/r2/)
- [Cloudflare D1 Docs](https://developers.cloudflare.com/d1/)
