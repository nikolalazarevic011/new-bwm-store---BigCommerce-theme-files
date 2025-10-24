# Quick Reference - Demo Theme Customization

## 📝 What Can You Edit?

### ✅ FROM BIGCOMMERCE BACKEND (No Code Required)

After uploading your theme to BigCommerce:

**Storefront → My Themes → Customize**

#### Text Content:
- Hero banner headline & description
- All button labels
- Testimonial quotes & author names
- CTA section headings
- Footer newsletter text
- Footer contact info (phone & email)
- About Us section text

#### Show/Hide Sections:
- Toggle hero banner on/off
- Toggle features section on/off
- Toggle testimonials on/off
- Toggle CTA section on/off

### ❌ REQUIRES CODE EDITING

These need template file changes:

#### Design Elements:
- Colors & gradients
- Button styles & colors
- Layout & spacing
- Font sizes
- Border radius

#### Static Content:
- Feature cards (🚚 🔒 💎 🎁)
- Navigation menu items
- Footer links
- Icons & emojis

---

## 🎨 Quick Color Reference

| Element | Color Code |
|---------|-----------|
| Purple Gradient | `#667eea → #764ba2` |
| Pink Gradient | `#f093fb → #f5576c` |
| Green CTA | `#48bb78` |
| Dark Footer | `#2d3748` |
| Light Background | `#f7fafc` |

---

## 🚀 Quick Commands

### Local Development:
```bash
# Start development server
stencil start

# Build JavaScript
npm run build

# Generate SVG sprite
grunt svgstore

# Bundle theme for upload
stencil bundle
```

### Testing Changes:
1. Edit files locally
2. Save (Stencil auto-reloads at http://localhost:3000)
3. Check browser

### Deploy to BigCommerce:
```bash
# 1. Bundle theme
stencil bundle

# 2. Upload .zip file via:
# BigCommerce Admin → Storefront → Themes → Upload Theme

# 3. Apply theme
```

---

## 📂 Key Files Modified

| File | What Changed |
|------|--------------|
| `config.json` | Added 24 backend-editable settings |
| `templates/pages/home.html` | Colorful sections + backend variables |
| `templates/components/common/header.html` | Promo banner |
| `templates/components/common/navigation.html` | New Arrivals link + promo banner |
| `templates/components/common/navigation-menu.html` | Custom nav tabs with subtabs |
| `templates/components/common/footer.html` | Modern footer + backend variables |

---

## 📚 Documentation Files

| File | Purpose |
|------|---------|
| `DEMO-CHANGES.md` | Complete changelog of all modifications |
| `BACKEND-EDITING-GUIDE.md` | How to edit from BigCommerce admin |
| `COLOR-GUIDE.md` | Color palette & usage reference |
| `QUICK-REFERENCE.md` | This file - quick lookup |
| `SETUP-CHECKLIST.txt` | Initial setup progress |
| `QUICK-START.md` | Getting started guide |
| `STARTUP-MANUAL.md` | Complete development guide |

---

## 🎯 Common Tasks

### Change Hero Banner Text:
**Backend**: Storefront → Themes → Customize → Find "Demo Hero Heading"
**Code**: `config.json` line 86

### Hide a Section:
**Backend**: Storefront → Themes → Customize → Uncheck "Show [Section]"
**Code**: Change `true` to `false` in `config.json`

### Change Colors:
**Code Only**: Edit inline styles in template files
- Header banner: `templates/components/common/navigation.html`
- Homepage sections: `templates/pages/home.html`
- Footer: `templates/components/common/footer.html`

### Update Navigation:
**Code Only**: `templates/components/common/navigation-menu.html`

### Change Footer Links:
**Code Only**: `templates/components/common/footer.html`

---

## 🔧 Troubleshooting

### Changes not showing locally?
```bash
# Stop server (Ctrl+C)
# Restart
stencil start
```

### Changes not showing after upload?
1. Clear BigCommerce cache: Storefront → Cache Manager
2. Hard refresh browser: Ctrl+Shift+R
3. Wait 1-2 minutes for CDN

### Settings missing in Theme Editor?
1. Re-bundle theme: `stencil bundle`
2. Re-upload to BigCommerce
3. Make sure theme is **activated**

---

## 💡 Pro Tips

1. **Always test locally first** with `stencil start`
2. **Use version control** (Git) before making changes
3. **Document custom changes** for future reference
4. **Test on mobile** - use browser dev tools
5. **Keep text concise** - shorter is better for mobile
6. **Backup before major changes** - download theme .zip

---

## 📊 Section Overview

### Homepage (Top to Bottom):
1. 🎉 Promo Banner (Purple gradient)
2. 🎨 Hero Banner (Pink gradient) - **Backend Editable**
3. ✨ Features Section (Light gray) - **Backend Editable heading**
4. 📦 Featured Products (Default Stencil)
5. 🔥 Top Sellers (Default Stencil)
6. 🆕 New Products (Default Stencil)
7. 💬 Testimonials (Purple gradient) - **Backend Editable**
8. 🚀 CTA Section (Green) - **Backend Editable**
9. 📧 Footer Newsletter (Purple gradient) - **Backend Editable**
10. 📄 Footer (Dark gray) - **Backend Editable contact info**

### Header:
- Promo banner
- Logo
- Navigation menu (with custom tabs)
- Search, Cart, Account

---

## 🎓 Learning Resources

**BigCommerce Docs:**
- Theme Development: https://developer.bigcommerce.com/stencil-docs
- Handlebars Reference: https://developer.bigcommerce.com/stencil-docs/reference-docs/handlebars-helpers-reference

**Local Files:**
- Architecture: `CLAUDE.md`
- Setup: `STARTUP-MANUAL.md`
- Windows Issues: `WINDOWS-SETUP-FIX.md`

---

## ⚡ Most Common Actions

### 1. Update Hero Text:
→ **Backend**: Theme Editor → "Demo Hero Heading"

### 2. Add Testimonial:
→ **Backend**: Theme Editor → "Demo Testimonial [X] Text"

### 3. Change Phone/Email:
→ **Backend**: Theme Editor → "Demo Footer Phone/Email"

### 4. Hide a Section:
→ **Backend**: Theme Editor → Uncheck "Show [Section Name]"

### 5. Change Colors:
→ **Code**: See `COLOR-GUIDE.md` for locations

---

## 🆘 Need Help?

1. Check `DEMO-CHANGES.md` for what changed
2. Check `BACKEND-EDITING-GUIDE.md` for backend editing
3. Check `COLOR-GUIDE.md` for color reference
4. Check BigCommerce docs
5. Review `CLAUDE.md` for architecture

---

**Last Updated**: 2025-10-22
**Theme Version**: Cornerstone 6.17.0 (Modified)
**Node Version Required**: 20.11.1
