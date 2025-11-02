# Repository Guidelines

## Project Structure & Module Organization
- Source lives under `app/` (when initialized): `routes/`, `components/`, `styles/`, `i18n/`, `utils/`.
- Static assets in `public/` (fonts, images, favicon).
- Config at repo root: `wrangler.toml`, `tailwind.config.ts`, `tsconfig.json`.
- Planning-first repo: the `app/` tree is created during project init.

## Build, Test, and Development Commands
- Install: `pnpm install`
- Dev server: `pnpm dev` (add `--port 3001` to change port)
- Build/Preview: `pnpm build` / `pnpm preview`
- Type check: `pnpm tsc --noEmit`
- Lint/Format: `pnpm lint` / `pnpm format`
- Cloudflare auth: `pnpm wrangler login` then `pnpm wrangler whoami`
- Env: create `.env.local` with `PUBLIC_SITE_URL`, `CLOUDFLARE_ACCOUNT_ID`, `CLOUDFLARE_API_TOKEN` (do not commit).

## Coding Style & Naming Conventions
- Language: TypeScript, ESM modules, 2-space indent.
- Components: React function components; PascalCase filenames in `app/components/`.
- Routes and utilities: kebab-case files; locale routes under `app/routes/[locale]/`.
- Styling: Tailwind-first; custom CSS in `app/styles/`. Use brand colors from `tailwind.config.ts`.
- i18n: JSON keys use dot notation (e.g., `hero.tagline`); import via `@/lib/i18n` alias.
- Animations: Prefer Framer Motion for interactions and entrances.

## Testing Guidelines
- No formal unit tests yet; rely on manual checks (Docs/DEVELOPMENT.md checklist).
- Validate: language switching (EN/AR/TR), RTL layout, responsiveness, accessibility (keyboard + contrast), and zero console errors.
- Run `pnpm build && pnpm preview` before PRs; fix type errors with `pnpm tsc --noEmit`.

## Commit & Pull Request Guidelines
- Branches: `main` (prod), `dev` (staging), `feature/*` for work.
- Conventional commits: `type: description` (e.g., `feat: add contact form`, `fix: resolve RTL layout issue`).
- PRs target `dev`. Include: clear summary, linked issues, screenshots for UI changes, and any i18n or accessibility notes.

## Security & Configuration Tips
- Never commit secrets or `.env.local`.
- Keep fonts in `public/fonts/` and verify `app/styles/fonts.css` declarations.
- Use Cloudflare Wrangler via `pnpm wrangler …`; verify envs in `wrangler.toml` before deploy.

## Project Docs
- Project Docs: See `/Docs/` for detailed guidelines
  - `DESIGN.md` - Complete design system and component specs
  - `DEVELOPMENT.md` - Development setup and workflow
  - `DEPLOYMENT.md` - Deployment procedures and troubleshooting
  - `TODO.md` - Comprehensive task list
