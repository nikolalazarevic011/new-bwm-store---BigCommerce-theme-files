# Windows Setup Fix Guide

## Problem
You're currently using Node 24.5.0, but this project requires Node 20.x. The Stencil CLI installation is failing due to:
1. Wrong Node version
2. node-sass dependency issues
3. Missing Windows SDK

## Solution: Switch to Node 20

### Step 1: Switch to Node 20 (Windows)

Open a **NEW** Command Prompt or PowerShell **as Administrator** and run:

```cmd
nvm list
```

This shows all installed Node versions. Look for version 20.x.x.

#### If Node 20 is already installed:
```cmd
nvm use 20
```

#### If Node 20 is NOT installed:
```cmd
nvm install 20
nvm use 20
```

### Step 2: Verify Node Version
```cmd
node --version
```
Should show: `v20.x.x` (not v24.x.x)

```cmd
npm --version
```
Should show: `10.x.x`

### Step 3: Clean Up Failed Installation

Since the previous installation failed, clean up:

```cmd
npm uninstall -g @bigcommerce/stencil-cli
```

### Step 4: Install Stencil CLI with Node 20

Now with Node 20 active:

```cmd
npm install -g @bigcommerce/stencil-cli
```

This should work much better with Node 20!

## If You Still Get Errors...

### Alternative: Install Windows Build Tools

If you still get Visual Studio / Windows SDK errors, you need to install Windows build tools:

**Option A - Quick (Recommended):**
```cmd
npm install -g windows-build-tools
```

**Option B - Manual:**
1. Open Visual Studio Installer
2. Modify your Visual Studio 2022 installation
3. Under "Workloads" tab, check:
   - ✅ Desktop development with C++
4. Under "Individual components" tab, check:
   - ✅ Windows 10 SDK (or Windows 11 SDK)
   - ✅ MSVC v143 - VS 2022 C++ x64/x86 build tools
5. Click "Modify" and wait for installation

## Complete Setup Process

Once Node 20 is active and Stencil CLI is installed, continue with project setup:

### 1. Navigate to Project
```cmd
cd "C:\Nikola\ME\New BWM Store\theme code"
```

### 2. Install Project Dependencies
```cmd
npm install
```

### 3. Build Project
```cmd
npm run build
```

### 4. Run Grunt Tasks
```cmd
npm install -g grunt-cli
grunt
```

### 5. Configure Stencil
```cmd
stencil init
```

You'll need:
- Your BigCommerce store URL
- API Access Token (from store admin)

### 6. Start Development Server
```cmd
stencil start
```

## Quick Check: Are You Using the Right Node Version?

Always verify before working on this project:
```cmd
node --version
```

If it shows `v24.x.x` instead of `v20.x.x`, run:
```cmd
nvm use 20
```

## Setting Node 20 as Default (Optional)

To avoid switching every time, set Node 20 as default:

**For nvm-windows:**
1. Open Command Prompt as Administrator
2. Run: `nvm alias default 20`

Or simply make sure you run `nvm use 20` every time you open a new terminal for this project.

## Common Windows-Specific Issues

### Issue: "nvm use 20" doesn't persist
**Solution**: Run it in each new terminal window, OR set it as default (see above)

### Issue: Permission errors during npm install
**Solution**: Run Command Prompt or PowerShell as Administrator

### Issue: Port 3000 already in use
**Solution**:
```cmd
# Find what's using port 3000
netstat -ano | findstr :3000

# Kill the process (replace PID with actual process ID)
taskkill /PID <PID> /F

# OR use a different port
stencil start --port 3001
```

### Issue: Can't find module after npm install
**Solution**:
```cmd
rmdir /s /q node_modules
del package-lock.json
npm install
```

## Summary of Commands (Copy-Paste Ready)

```cmd
# 1. Switch to Node 20
nvm use 20

# 2. Verify version
node --version

# 3. Navigate to project
cd "C:\Nikola\ME\New BWM Store\theme code"

# 4. Install Stencil CLI globally
npm install -g @bigcommerce/stencil-cli

# 5. Install project dependencies
npm install

# 6. Build assets
npm run build

# 7. Initialize Stencil (one-time setup)
stencil init

# 8. Start development server
stencil start
```

## Still Having Issues?

Check the error message carefully:
- If it mentions **Python**: Make sure Python 3.x is installed
- If it mentions **Visual Studio**: Install Windows Build Tools (see above)
- If it mentions **node-sass**: Make sure you're on Node 20, not Node 24
- If it mentions **port in use**: Use `--port 3001` flag

## File to Reference
- See `STARTUP-MANUAL.md` for detailed project documentation
- See `CLAUDE.md` for architecture details
