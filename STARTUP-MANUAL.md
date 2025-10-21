# BigCommerce Stencil Theme - Startup Manual

This guide will help you set up and run this BigCommerce Stencil theme locally on your development PC.

## Prerequisites

### 1. Node.js and npm
This project requires **Node.js version 20** and **npm version 10**.

Check your current versions:
```bash
node --version  # Should show v20.x.x
npm --version   # Should show 10.x.x
```

If you need to install or switch Node versions, use [nvm (Node Version Manager)](https://github.com/nvm-sh/nvm):
```bash
# Install Node 20
nvm install 20
nvm use 20
```

### 2. Grunt CLI
Install Grunt command-line tool globally:
```bash
npm install -g grunt-cli
```

### 3. BigCommerce Stencil CLI
Install the Stencil CLI globally:
```bash
npm install -g @bigcommerce/stencil-cli
```

Verify installation:
```bash
stencil --version
```

### 4. BigCommerce Store Access
You'll need:
- A BigCommerce store (you can create a free trial at [bigcommerce.com](https://www.bigcommerce.com))
- Store API credentials with the following scopes:
  - **Themes**: `modify`
  - **Store Information**: `read-only`

## Initial Setup (First Time Only)

### Step 1: Install Dependencies
Navigate to the theme directory and install npm packages:
```bash
cd "/mnt/c/Nikola/ME/New BWM Store/theme code"
npm install
```

**Important**: Make sure you're using Node 20 and npm 10 before running this command.

### Step 2: Build Assets
Build the theme JavaScript bundles:
```bash
npm run build
```

Or for development build:
```bash
npm run buildDev
```

### Step 3: Generate SVG Sprite
Generate the SVG icon sprite:
```bash
grunt svgstore
```

Or run all Grunt tasks:
```bash
grunt
```

### Step 4: Configure Stencil CLI

Initialize Stencil configuration with your BigCommerce store:
```bash
stencil init
```

You'll be prompted for:
1. **Store URL** - Your BigCommerce store URL (e.g., `https://yourstore.mybigcommerce.com`)
2. **Access Token** - API token from your store
3. **Port** - Local server port (default: 3000)

This creates a `.stencil` file with your store credentials.

#### How to Get API Credentials:

1. Log in to your BigCommerce store admin panel
2. Go to **Advanced Settings** → **API Accounts** → **Create API Account**
3. Select **Store-level API account**
4. Name it (e.g., "Local Development")
5. Set OAuth Scopes:
   - Themes: **modify**
   - Store Information: **read-only**
6. Save and copy the **Access Token** (you won't see it again!)

## Running the Theme Locally

### Start the Development Server

Once configured, start the local development server:

```bash
stencil start
```

This will:
- Start a local server (default: http://localhost:3000)
- Watch for file changes in `/templates` and `/lang` directories
- Automatically rebuild JavaScript when files in `assets/js` change
- Hot-reload the browser when changes are detected

**Your theme is now running!** Open http://localhost:3000 in your browser.

### Development Workflow

The `stencil start` command watches for changes:

**Auto-reload triggers:**
- Template changes (`/templates/**/*.html`)
- Language file changes (`/lang/**/*.json`)
- JavaScript changes (`/assets/js/**/*.js`) - webpack rebuilds automatically

**Manual rebuild required:**
- SCSS changes - Run `stencil start` with the `--theme-editor` flag, or push theme to see SCSS changes
- SVG icon changes - Run `grunt svgstore`

### Common Development Commands

While developing, you may need these commands in separate terminal windows:

```bash
# Terminal 1: Run Stencil server
stencil start

# Terminal 2: Watch and run tests
npm run test:watch

# Terminal 3: Lint and fix SCSS
npm run stylelint:fix
```

## Troubleshooting

### Problem: "Port 3000 is already in use"
**Solution**: Stop the existing process or use a different port:
```bash
stencil start --port 3001
```

### Problem: "Cannot find module" errors after npm install
**Solution**: Delete node_modules and reinstall:
```bash
rm -rf node_modules package-lock.json
npm install
```

### Problem: JavaScript changes not appearing
**Solution**:
1. Stop the server (Ctrl+C)
2. Rebuild JavaScript: `npm run buildDev`
3. Restart: `stencil start`

### Problem: SCSS changes not appearing
**Solution**: SCSS is compiled by BigCommerce servers, not locally. To see SCSS changes:
1. Bundle theme: `stencil bundle`
2. Upload to store via BigCommerce admin

OR use Theme Editor in BigCommerce admin panel for live SCSS editing.

### Problem: ".stencil file not found"
**Solution**: Run `stencil init` to create configuration file with your store credentials.

### Problem: Node/npm version mismatch warnings
**Solution**: Switch to Node 20:
```bash
nvm use 20
npm install
```

## Quick Reference - Common Tasks

### Starting Fresh Each Day
```bash
# Navigate to project
cd "/mnt/c/Nikola/ME/New BWM Store/theme code"

# Start development server
stencil start
```

### Making JavaScript Changes
1. Edit files in `assets/js/`
2. Webpack automatically rebuilds
3. Browser auto-refreshes

### Making Template Changes
1. Edit files in `templates/`
2. Browser auto-refreshes

### Adding New SVG Icons
1. Add `.svg` file to `assets/icons/`
2. Run `grunt svgstore`
3. Restart `stencil start`
4. Use in templates: `<svg><use xlink:href="#icon-filename" /></svg>`

### Running Tests
```bash
npm test                  # Run all tests once
npm run test:watch        # Run tests in watch mode
```

### Linting
```bash
npm run stylelint         # Check SCSS for issues
npm run stylelint:fix     # Auto-fix SCSS issues
grunt eslint              # Check JavaScript for issues
```

### Building for Production
```bash
# Build production JavaScript
npm run build

# Bundle entire theme for upload
stencil bundle
```

This creates a `.zip` file in the root directory that can be uploaded to BigCommerce.

## Project Structure Quick Reference

```
├── assets/
│   ├── dist/           # Compiled JavaScript bundles (generated)
│   ├── icons/          # Individual SVG icons (run grunt svgstore after changes)
│   ├── js/             # JavaScript source files
│   │   ├── app.js      # Main entry point
│   │   └── theme/      # Page-specific modules
│   └── scss/           # SCSS styles
├── templates/
│   ├── components/     # Reusable Handlebars components
│   ├── layout/         # Base layout templates
│   └── pages/          # Page-level templates
├── lang/               # Translation files
├── config.json         # Theme configuration and settings
├── stencil.conf.cjs    # Stencil CLI configuration
├── .stencil            # Your store credentials (DO NOT COMMIT)
└── package.json        # Dependencies and scripts
```

## Important Files Not to Commit

Add these to `.gitignore` if not already present:
- `.stencil` - Contains your API credentials
- `node_modules/` - Dependencies
- `assets/dist/` - Generated bundles
- `parsed/` - Parsed templates

## Additional Resources

- [Stencil CLI Documentation](https://developer.bigcommerce.com/stencil-docs/installing-stencil-cli/installing-stencil)
- [Theme Development Guide](https://developer.bigcommerce.com/stencil-docs/getting-started/about-stencil)
- [Handlebars Helpers Reference](https://developer.bigcommerce.com/stencil-docs/reference-docs/handlebars-helpers-reference)
- [Theme Objects Reference](https://developer.bigcommerce.com/stencil-docs/reference-docs/global-objects-and-properties)

## Need Help?

1. Check BigCommerce Developer Documentation: https://developer.bigcommerce.com/
2. BigCommerce Community Forums: https://support.bigcommerce.com/s/community
3. Review `CLAUDE.md` for architecture details
