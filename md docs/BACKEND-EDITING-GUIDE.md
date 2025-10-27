# Backend Editing Guide - Custom Demo Sections

This guide explains how to edit the custom homepage and footer sections from the BigCommerce backend after uploading your theme.

## ✅ What Can Be Edited from Backend

After implementing the changes, you'll be able to edit the following from your BigCommerce admin panel:

### 🏠 Homepage Sections

#### Hero Banner Section
- **Show/Hide**: Toggle entire section on/off
- **Heading**: Main headline text
- **Subheading**: Description text under headline
- **Button Text**: CTA button label

#### Features Section
- **Show/Hide**: Toggle entire section on/off
- **Heading**: "Why Shop With Us?" heading text

#### Testimonials Section
- **Show/Hide**: Toggle entire section on/off
- **Heading**: Section title
- **Testimonial 1**: Text and author name
- **Testimonial 2**: Text and author name
- **Testimonial 3**: Text and author name

#### Call-to-Action Section
- **Show/Hide**: Toggle entire section on/off
- **Heading**: Main CTA headline
- **Subheading**: Supporting text
- **Button 1 Text**: Primary button label
- **Button 2 Text**: Secondary button label

### 📧 Footer Sections

#### Newsletter Section
- **Heading**: Newsletter CTA headline
- **Text**: Description/offer text

#### About Us Section
- **About Text**: Company description
- **Phone Number**: Contact phone
- **Email**: Contact email

---

## 🔧 How to Edit from BigCommerce Backend

### Step 1: Upload Your Theme

First, bundle and upload your theme to BigCommerce:

```bash
# In your theme directory
stencil bundle

# This creates a .zip file in your theme root
```

Then:
1. Go to **Storefront** → **Themes** in your BigCommerce admin
2. Click **Upload Theme**
3. Upload the `.zip` file created by `stencil bundle`
4. Click **Apply** to activate the theme

### Step 2: Access Theme Editor

1. In BigCommerce admin, go to **Storefront** → **My Themes**
2. Find your active theme
3. Click **Customize** button
4. The Theme Editor will open

### Step 3: Find Demo Settings

The custom settings will appear in the Theme Editor sidebar. Look for settings with "demo_" prefix:

#### Homepage Settings Location:
- Scroll through the left sidebar in Theme Editor
- Look for sections like:
  - **Homepage** settings
  - Custom fields with "demo" prefix

You'll see editable fields like:
```
Demo Hero Heading
Demo Hero Subheading
Demo Hero Button Text
Show Hero Section (checkbox)
```

### Step 4: Edit and Save

1. Click on any field to edit the text
2. Use checkboxes to show/hide entire sections
3. Click **Publish** (top right) to save changes
4. Changes appear immediately on your live store

---

## 📋 Complete List of Editable Settings

Here are all the settings added to `config.json`:

### Homepage Hero Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_show_hero_section` | `true` | Checkbox |
| `demo_hero_heading` | "Welcome to Our Store" | Text |
| `demo_hero_subheading` | "Discover amazing products..." | Text |
| `demo_hero_button_text` | "Shop Now" | Text |

### Homepage Features Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_show_features_section` | `true` | Checkbox |
| `demo_features_heading` | "Why Shop With Us?" | Text |

### Homepage Testimonials Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_show_testimonials_section` | `true` | Checkbox |
| `demo_testimonials_heading` | "What Our Customers Say" | Text |
| `demo_testimonial_1_text` | "Amazing quality and fast..." | Text |
| `demo_testimonial_1_author` | "Sarah Johnson" | Text |
| `demo_testimonial_2_text` | "Best customer service..." | Text |
| `demo_testimonial_2_author` | "Michael Chen" | Text |
| `demo_testimonial_3_text` | "Great products at..." | Text |
| `demo_testimonial_3_author` | "Emily Davis" | Text |

### Homepage CTA Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_show_cta_section` | `true` | Checkbox |
| `demo_cta_heading` | "Ready to Start Shopping?" | Text |
| `demo_cta_subheading` | "Join thousands of happy..." | Text |
| `demo_cta_button_1_text` | "Browse Products" | Text |
| `demo_cta_button_2_text` | "Learn More" | Text |

### Footer Newsletter Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_footer_newsletter_heading` | "Stay Connected With Us!" | Text |
| `demo_footer_newsletter_text` | "Subscribe to our newsletter..." | Text |

### Footer About Section
| Setting Name | Default Value | Type |
|--------------|---------------|------|
| `demo_footer_about_text` | "We are committed to..." | Text |
| `demo_footer_phone` | "1-800-123-4567" | Text |
| `demo_footer_email` | "support@store.com" | Text |

---

## 🎨 What CANNOT Be Edited from Backend

The following require code changes in template files:

### Static Content:
- **Colors**: Gradient colors, background colors
- **Layout**: Grid columns, spacing, padding
- **Icons**: Emoji icons (🚚, 🔒, 💎, 🎁)
- **Feature Cards**: The 4 feature boxes (Free Shipping, Secure Payment, etc.)
- **Navigation Items**: Header menu items, footer links
- **Styles**: Font sizes, border radius, shadows

### Why These Are Static:
These are defined in inline styles within the HTML templates. To change them, you need to:
1. Edit the template files directly
2. Modify `config.json` to add new settings
3. Update templates to use `{{theme_settings.your_new_setting}}`

---

## 🚀 Quick Example: Changing Hero Text

### Before (Hardcoded):
```html
<h1>Welcome to Our Store</h1>
```

### After (Backend Editable):
```html
<h1>{{theme_settings.demo_hero_heading}}</h1>
```

### In BigCommerce Admin:
1. Open Theme Editor
2. Find "Demo Hero Heading" field
3. Change to "Welcome to My Awesome Shop!"
4. Click Publish
5. Done! ✅

---

## 📝 Tips for Backend Editing

### 1. **Test on Staging First**
- Use BigCommerce's preview feature before publishing
- Check how text looks on mobile devices

### 2. **Keep Text Concise**
- Hero headings: 3-8 words
- Subheadings: 6-15 words
- Button text: 1-3 words

### 3. **Use Descriptive Text**
- Testimonials should sound authentic
- CTA text should be action-oriented
- Avoid all caps (looks like shouting)

### 4. **Maintain Consistency**
- Use similar tone across all sections
- Keep phone/email format consistent
- Match button text style (e.g., all "Browse X" or all "Shop X")

### 5. **Preview Changes**
- Always preview before publishing
- Check both desktop and mobile views
- Test with different text lengths

---

## 🔄 Reverting to Defaults

To reset any setting to its default value:

1. In Theme Editor, find the setting
2. Delete all text in the field
3. The template will use the default from `config.json`
4. Or manually enter the default values from the table above

---

## 🆘 Troubleshooting

### "I don't see the custom settings"

**Solution**:
1. Make sure you uploaded the theme with updated `config.json`
2. The theme must be **activated** (not just uploaded)
3. Clear your browser cache
4. Try opening Theme Editor in an incognito window

### "Changes aren't showing on my site"

**Solution**:
1. Click **Publish** (not just Save)
2. Clear BigCommerce cache: Storefront → Cache Manager → Clear Cache
3. Hard refresh your browser: Ctrl+Shift+R (Windows) or Cmd+Shift+R (Mac)
4. Wait 1-2 minutes for CDN propagation

### "Text is cut off or too long"

**Solution**:
1. Shorten your text
2. Check character limits (if any exist)
3. Preview on mobile to see how it wraps

### "Section disappeared completely"

**Solution**:
1. Check if the "Show [Section Name]" checkbox is enabled
2. Look for settings like `demo_show_hero_section`
3. Make sure it's set to `true` or checked

---

## 📖 Next Steps

### Want More Customization?

To add MORE backend-editable fields:

1. **Add to config.json**:
   ```json
   "demo_new_setting": "Default Value"
   ```

2. **Use in templates**:
   ```handlebars
   {{theme_settings.demo_new_setting}}
   ```

3. **Bundle and re-upload theme**

### Need Help?

- Check `DEMO-CHANGES.md` for all modifications
- Check `COLOR-GUIDE.md` for color references
- Refer to BigCommerce Theme Docs: https://developer.bigcommerce.com/stencil-docs

---

## ✨ Summary

**Can Edit from Backend** ✅
- All text content (headings, descriptions, button labels)
- Show/hide toggle for sections
- Contact information (phone, email)
- Testimonial content and authors

**Cannot Edit from Backend** ❌
- Colors and gradients
- Layout and spacing
- Icons and images
- Feature card content
- Navigation structure
- CSS styles

**To enable backend editing**: Settings must be defined in `config.json` and referenced in templates as `{{theme_settings.setting_name}}`
