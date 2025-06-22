#!/bin/bash
# Cloudflare Pages deployment script
# Run this after installing: npm install -g wrangler

echo "🚀 Setting up Cloudflare Pages for manishs.pages.dev..."

# Login to Cloudflare (will open browser)
echo "1. Logging into Cloudflare..."
wrangler login

# Create Pages project
echo "2. Creating Pages project..."
wrangler pages project create manishs-pages --compatibility-date=2024-06-21

# Deploy the site
echo "3. Deploying site..."
wrangler pages deploy dist --project-name=manishs-pages

# Set up custom domain (requires manual verification)
echo "4. Setting up custom domain..."
echo "⚠️  You'll need to manually add 'manishs.pages.dev' as a custom domain in the Cloudflare dashboard"
echo "   Go to: https://dash.cloudflare.com/pages"
echo "   Select your project → Custom domains → Set up a custom domain"

echo "✅ Deployment complete!"
echo "📱 Your site should be available at:"
echo "   - https://manishs-pages.pages.dev/sqlite-otel/"
echo "   - https://manishs.pages.dev/sqlite-otel/ (after custom domain setup)"