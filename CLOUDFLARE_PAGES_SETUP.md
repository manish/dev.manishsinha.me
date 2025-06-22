# Cloudflare Pages Setup Instructions

## Repository Setup ✅
- [x] Repository: `manish/dev.manishsinha.me`
- [x] Submodule: `sqlite-otel` (feature/mkdocs-documentation branch)
- [x] Build process: Configured in package.json
- [x] Output directory: `dist/`

## Cloudflare Pages Configuration

1. **Go to Cloudflare Pages Dashboard**
   - Visit: https://dash.cloudflare.com/pages
   - Click "Create a project"

2. **Connect Repository**
   - Select "Connect to Git"
   - Choose GitHub
   - Select repository: `manish/dev.manishsinha.me`

3. **Build Configuration**
   ```
   Framework preset: None
   Build command: npm run build
   Build output directory: dist
   Root directory: / (leave empty)
   ```

4. **Environment Variables**
   ```
   NODE_VERSION = 18
   ```

5. **Custom Domain Setup**
   - After initial deployment, go to "Custom domains"
   - Add: `manishs.pages.dev`
   - The site will be available at: https://manishs.pages.dev/

## Build Process Details

The build process:
1. Runs `npm run build` which calls `npm run build:sqlite-otel`
2. Copies the landing page to `dist/index.html`
3. Copies the pre-built SQLite OTEL site from `sqlite-otel/site/` to `dist/sqlite-otel/`
4. Copies the documentation to `dist/sqlite-otel/docs/`
5. Cloudflare Pages serves from `dist/` directory

## Access URLs

Once deployed:
- **Landing Page**: https://manishs.pages.dev/
- **SQLite OTEL Site**: https://manishs.pages.dev/sqlite-otel/
- **SQLite OTEL Documentation**: https://manishs.pages.dev/sqlite-otel/docs/
- **Quick Start**: https://manishs.pages.dev/sqlite-otel/quickstart/
- **API Reference**: https://manishs.pages.dev/sqlite-otel/api/
- **CLI Reference**: https://manishs.pages.dev/sqlite-otel/cli/
- **Deployment Guide**: https://manishs.pages.dev/sqlite-otel/deployment/

## Future Updates

To update documentation:
1. Make changes in `sqlite-otel` repository
2. Commit and push to feature/mkdocs-documentation branch
3. In `dev.manishsinha.me`:
   ```bash
   cd sqlite-otel
   git pull origin feature/mkdocs-documentation
   cd ..
   npm run build
   git add -A
   git commit -m "docs: update sqlite-otel documentation"
   git push origin main
   ```
4. Cloudflare Pages will auto-deploy the changes

## Manual Setup Required

⚠️ **Action Required**: Complete the Cloudflare Pages setup manually:
1. Go to https://dash.cloudflare.com/pages
2. Follow the configuration steps above
3. Deploy and verify at:
   - Landing page: https://manishs.pages.dev/
   - SQLite OTEL: https://manishs.pages.dev/sqlite-otel/