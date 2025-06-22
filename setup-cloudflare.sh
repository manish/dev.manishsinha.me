#!/bin/bash

# Cloudflare Pages setup script with proper Node.js environment

echo "🚀 Setting up Cloudflare Pages with Wrangler CLI..."

# Load nvm and use Node.js 20
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm use 20

echo "📋 Node.js version: $(node --version)"
echo "📋 NPM version: $(npm --version)"

# Check if we're in the right directory
if [ ! -f "package.json" ]; then
    echo "❌ Error: Run this script from the dev.manishsinha.me directory"
    exit 1
fi

# Run Wrangler commands
echo "1️⃣ Authenticating with Cloudflare..."
echo "   This will open your browser for authentication."
echo "   Please log into your Cloudflare account when prompted."
read -p "Press Enter to continue..."

npx wrangler login

echo ""
echo "2️⃣ Creating Cloudflare Pages project..."
npx wrangler pages project create manishs-pages --compatibility-date=2024-06-21

echo ""
echo "3️⃣ Deploying your site..."
npx wrangler pages deploy dist --project-name=manishs-pages

echo ""
echo "✅ Deployment complete!"
echo ""
echo "📱 Your site is now available at:"
echo "   https://manishs-pages.pages.dev/sqlite-otel/"
echo ""
echo "🔧 To set up the custom domain 'manishs.pages.dev':"
echo "   1. Go to https://dash.cloudflare.com/pages"
echo "   2. Click on your 'manishs-pages' project"
echo "   3. Go to 'Custom domains' tab"
echo "   4. Click 'Set up a custom domain'"
echo "   5. Enter: manishs.pages.dev"
echo "   6. Follow the verification steps"
echo ""
echo "🔄 For future updates:"
echo "   - Update the sqlite-otel submodule"
echo "   - Run: npm run build"
echo "   - Run: npx wrangler pages deploy dist --project-name=manishs-pages"