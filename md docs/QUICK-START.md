# Quick Start Guide - You're All Set! ✅

## ✅ What's Already Done

1. ✅ **Node 20.11.1** installed and configured
2. ✅ **Stencil CLI** (v8.10.4) installed globally
3. ✅ **Project dependencies** installed (1199 packages)
4. ✅ **JavaScript bundles** built successfully

## 🚀 Next Steps

### Step 1: Configure Stencil with Your BigCommerce Store

Before you can run the project, you need to connect it to your BigCommerce store.

**Open Command Prompt in this directory and run:**

```cmd
nvm use 20.11.1
stencil init
```

You'll be asked for:
- **Store URL**: Your BigCommerce store URL (e.g., `https://yourstore.mybigcommerce.com`)
- **Access Token**: API token from your store (see below how to get it)
- **Port**: Press Enter for default (3000)

#### How to Get Your API Access Token:

1. Log in to your **BigCommerce store admin panel**
2. Go to **Settings** → **API** → **Store-level API Accounts**
3. Click **Create API Account**
4. Fill in the form:
   - **Name**: "Local Development" (or any name you want)
   - **OAuth Scopes**:
     - **Themes**: Select **modify**
     - **Store Information**: Select **read-only**
5. Click **Save**
6. **IMPORTANT**: Copy the **Access Token** immediately (you won't see it again!)
7. Use this token when running `stencil init`

### Step 2: Start the Development Server

After `stencil init` completes successfully, start the server:

**Option A - Simple way (Use the batch file):**
```cmd
start-dev.bat
```

**Option B - Manual way:**
```cmd
nvm use 20.11.1
stencil start
```

The server will start at: **http://localhost:3000**

Open your browser and navigate to http://localhost:3000 to see your theme!

## 📝 Daily Workflow

Every time you want to work on this project:

### Quick Start (Easiest)
Just double-click: **`start-dev.bat`**

### Manual Start
```cmd
cd "C:\Nikola\ME\New BWM Store\theme code"
nvm use 20.11.1
stencil start
```

## 🛠️ Common Commands (After nvm use 20.11.1)

```cmd
# Start development server
stencil start

# Start on different port
stencil start --port 3001

# Build JavaScript (production)
npm run build

# Build JavaScript (development)
npm run buildDev

# Run tests
npm test

# Run tests in watch mode
npm run test:watch

# Lint SCSS
npm run stylelint

# Fix SCSS issues automatically
npm run stylelint:fix

# Generate SVG sprite (after adding new icons to assets/icons/)
grunt svgstore

# Bundle theme for upload to BigCommerce
stencil bundle
```

## ⚠️ Important Notes

### Always Use Node 20!
Before running ANY npm or stencil commands, make sure you're using Node 20:
```cmd
nvm use 20.11.1
```

To check which version you're currently using:
```cmd
node --version
```

### .stencil File
After running `stencil init`, a `.stencil` file will be created with your store credentials.

**DO NOT commit this file to Git!** It contains your API token.

## 🔧 Troubleshooting

### "stencil: command not found"
**Solution**: Make sure you're using Node 20:
```cmd
nvm use 20.11.1
stencil --version
```

### "Port 3000 already in use"
**Solution**: Use a different port or kill the process:
```cmd
stencil start --port 3001
```

Or find and kill the process using port 3000:
```cmd
netstat -ano | findstr :3000
taskkill /PID <PID_NUMBER> /F
```

### Changes not appearing in browser
**Solution**:
- Template changes should auto-reload
- JavaScript changes should auto-rebuild
- If not working, stop the server (Ctrl+C) and restart with `stencil start`

### "Error: Cannot find store"
**Solution**: You need to run `stencil init` first to configure your store connection

## 📚 Additional Documentation

- **STARTUP-MANUAL.md** - Complete setup and development guide
- **WINDOWS-SETUP-FIX.md** - Windows-specific troubleshooting
- **CLAUDE.md** - Architecture and code structure documentation
- **README.md** - Original Cornerstone theme documentation

## 🎯 What You Can Do Now

1. **Edit Templates**: Modify files in `/templates` - changes auto-reload
2. **Edit JavaScript**: Modify files in `/assets/js` - webpack auto-rebuilds
3. **Edit SCSS**: Modify files in `/assets/scss` - requires theme bundle/upload to see changes
4. **Add SVG Icons**: Add to `/assets/icons` and run `grunt svgstore`

## ✨ You're Ready to Go!

Your environment is fully set up. Just run:

```cmd
stencil init
```

Then:

```cmd
stencil start
```

Happy coding! 🚀
