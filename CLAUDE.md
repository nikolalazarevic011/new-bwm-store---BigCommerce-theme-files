# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a BigCommerce Stencil theme based on Cornerstone, the reference theme for the BigCommerce Stencil platform. It uses Handlebars v4 templating, Webpack for JavaScript bundling, and SCSS for styling.

## Development Requirements

- Node.js version 20
- npm version 10
- Grunt CLI installed globally: `npm install -g grunt-cli`

**IMPORTANT**: When updating `package-lock.json`, always use Node 20 and npm 10. If using different versions, delete `package-lock.json` before running `npm install` and before pushing to GitHub.

## Common Commands

### Build and Development
- `npm run build` - Build production JavaScript bundle (webpack.prod.js)
- `npm run buildDev` - Build development JavaScript bundle (webpack.dev.js)
- `npm install` - Install dependencies (use Node 20 and npm 10)
- `npm update <package_name>` - Update a specific package (avoid running `npm install` for updates)

### Testing and Linting
- `npm test` - Run Jest tests
- `npm run test:watch` - Run Jest tests in watch mode
- `npm run stylelint` - Lint SCSS files
- `npm run stylelint:fix` - Auto-fix SCSS linting issues

### Grunt Tasks
- `grunt` - Run default tasks (eslint, svgstore)
- `grunt svgstore` - Generate SVG sprite from individual SVG files in `assets/icons`
- `grunt eslint` - Lint JavaScript files
- `grunt stylelint` - Lint SCSS files

### Stencil CLI
The theme is designed to work with BigCommerce Stencil CLI. Common commands include:
- `stencil start` - Start local development server with live reload
- `stencil bundle` - Bundle theme for upload to BigCommerce
- `stencil push` - Push theme to BigCommerce store

## Architecture

### JavaScript Structure

**Page-Based Loading System**: The theme uses a dynamic import system in `assets/js/app.js` that loads page-specific JavaScript only when needed:
- Each page type maps to an ES6 module that extends `PageManager` (base class in `assets/js/theme/page-manager.js`)
- Pages lazy-load their modules via webpack code-splitting
- Global JavaScript (`assets/js/theme/global.js`) loads on all pages

**Entry Points** (defined in `webpack.common.js`):
- `main` - Main application bundle (app.js)
- `head_async` - Lazy loading library (lazysizes)
- `font` - Web font loader
- `polyfills` - Browser compatibility polyfills
- `polyfill_form_data` - FormData polyfill

**Key Page Modules**:
- Account pages → `assets/js/theme/account.js`
- Auth pages (login, signup) → `assets/js/theme/auth.js`
- Product pages → `assets/js/theme/product.js`
- Category/Brand pages → `assets/js/theme/catalog.js`, `assets/js/theme/category.js`, `assets/js/theme/brand.js`
- Cart → `assets/js/theme/cart.js`
- Search → `assets/js/theme/search.js`

### Template Context Injection

Use Handlebars helpers to pass server-side data to client-side JavaScript:

```handlebars
{{inject "myProductName" product.title}}

<script>
var jsContext = JSON.parse({{jsContext}});
console.log(jsContext.myProductName);
</script>
```

The injected context is available as `this.context` in PageManager instances.

### Template Structure

- `templates/pages/` - Main page templates (home, product, category, cart, etc.)
- `templates/components/` - Reusable components organized by domain (cart, products, common, etc.)
- `templates/layout/` - Base layout template (`base.html` includes SVG sprite injection)

### SCSS Organization

- `assets/scss/settings/` - Variables and configuration (foundation, citadel, vendor - READ ONLY)
- `assets/scss/components/` - Component styles (foundation, citadel, vendor - READ ONLY)
- `assets/scss/layouts/` - Layout-specific styles
- `assets/scss/common/` - Common styles
- `assets/scss/utilities/` - Utility classes
- `assets/scss/tools/` - Mixins and functions

**Read-Only Paths**: Do not modify files in these directories (defined in `config.json`):
- `/assets/scss/components/citadel`
- `/assets/scss/components/foundation`
- `/assets/scss/components/vendor`
- `/assets/scss/settings/citadel`
- `/assets/scss/settings/foundation`
- `/assets/scss/settings/normalize`
- `/assets/scss/settings/vendor`
- `/assets/scss/vendor`

### SVG Icon System

Icons are delivered via a single SVG sprite embedded in `templates/layout/base.html`:
1. Add individual SVG files to `assets/icons/`
2. Run `grunt svgstore` to generate sprite
3. Reference icons in templates: `<svg><use xlink:href="#icon-fileName" /></svg>`

The icon ID is the filename prefixed with `icon-` (e.g., `#icon-facebook` for `facebook.svg`).

### Stencil Configuration

- `config.json` - Theme metadata, variations (Light/Bold/Warm), and theme settings
- `schema.json` - Theme Editor UI configuration (defines editable fields in BigCommerce backend)
- `stencil.conf.cjs` - Stencil development server configuration with webpack integration
- `manifest.json` - Theme manifest file

**Theme Settings System** - Making content editable from BigCommerce backend:

1. **Define settings in `config.json`**:
   ```json
   {
     "demo_hero_heading": "Welcome to Our Store",
     "demo_show_hero_section": true
   }
   ```

2. **Create UI fields in `schema.json`**:
   ```json
   {
     "name": "Demo Sections",
     "settings": [
       {
         "type": "text",
         "label": "Hero Heading",
         "id": "demo_hero_heading",
         "force_reload": true
       },
       {
         "type": "checkbox",
         "label": "Show Hero Section",
         "id": "demo_show_hero_section",
         "force_reload": true
       }
     ]
   }
   ```

3. **Use in templates with Handlebars**:
   ```handlebars
   {{#if theme_settings.demo_show_hero_section}}
     <h1>{{theme_settings.demo_hero_heading}}</h1>
   {{/if}}
   ```

**Important Constraints**:
- **64-character limit**: Default text values in `config.json` that map to `type: "text"` fields in `schema.json` must be ≤64 characters
- **Allowed field types in schema.json**: `text`, `checkbox`, `color`, `font`, `select`, `heading`, `paragraph` (NO `textarea`)
- **Always add `force_reload: true`** to schema fields to refresh preview when values change
- Local development uses `config.json` values; live store uses values from Theme Editor
- Use `stencil pull` to sync live theme settings to local `config.json`

### Polyfilling Strategy

Feature detection is implemented in `templates/components/common/polyfill-script.html`. If modern features are missing, the polyfills bundle loads before the main bundle executes. This prioritizes performance for modern browsers while maintaining backward compatibility.

## Key Libraries and Dependencies

- **@bigcommerce/stencil-utils** (6.19.0) - BigCommerce utility library for theme events and API calls
- **jQuery** (3.6.1) - DOM manipulation (exposed globally via webpack)
- **Foundation Sites** (5.5.3) - CSS framework
- **slick-carousel** (1.8.1) - Carousel/slider functionality
- **lazysizes** (5.2.2) - Lazy loading images
- **nod-validate** (2.0.12) - Form validation
- **lodash** (4.17.21) - Utility library (tree-shaken via babel-plugin-lodash)

## Theme Variations

The theme includes three variations configured in `config.json`:
- **Light** - Clean, versatile design (default)
- **Bold** - Dark theme for fashion/jewelry
- **Warm** - Warm tones for food/beverage

Each variation has custom color schemes and typography settings.

## Webpack Build Process

- `webpack.common.js` - Shared configuration
- `webpack.dev.js` - Development build (extends common)
- `webpack.prod.js` - Production build with optimizations (extends common)
- Output: `assets/dist/theme-bundle.[name].js`

The `stencil.conf.cjs` file integrates webpack with Stencil CLI:
- In development mode: watches for changes and triggers hot reload
- In production mode: runs webpack build before bundling theme

## Testing

Tests are located in `assets/js/test-unit/` and use Jest with jsdom environment. Test files follow the pattern `*.spec.js`.
