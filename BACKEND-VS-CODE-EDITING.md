# Backend vs Code Editing - What You Need to Know

## The Big Question: Can I Edit This From BigCommerce?

**Short Answer**:
- ✅ **Text content** = YES (Backend)
- ❌ **Design/colors** = NO (Code only)

---

## 📊 Comparison Table

| What You Want to Change | Backend? | Code Required? | Difficulty |
|-------------------------|----------|----------------|------------|
| **CONTENT** | | | |
| Hero banner headline | ✅ Yes | No | Easy |
| Hero banner description | ✅ Yes | No | Easy |
| Button text/labels | ✅ Yes | No | Easy |
| Testimonial quotes | ✅ Yes | No | Easy |
| Customer names | ✅ Yes | No | Easy |
| Phone number | ✅ Yes | No | Easy |
| Email address | ✅ Yes | No | Easy |
| About Us text | ✅ Yes | No | Easy |
| Newsletter CTA text | ✅ Yes | No | Easy |
| | | | |
| **VISIBILITY** | | | |
| Show/hide hero banner | ✅ Yes | No | Easy |
| Show/hide features | ✅ Yes | No | Easy |
| Show/hide testimonials | ✅ Yes | No | Easy |
| Show/hide CTA section | ✅ Yes | No | Easy |
| | | | |
| **DESIGN** | | | |
| Colors | ❌ No | ✅ Yes | Medium |
| Gradients | ❌ No | ✅ Yes | Medium |
| Button colors | ❌ No | ✅ Yes | Medium |
| Background colors | ❌ No | ✅ Yes | Medium |
| Font sizes | ❌ No | ✅ Yes | Medium |
| Spacing/padding | ❌ No | ✅ Yes | Medium |
| Border radius | ❌ No | ✅ Yes | Medium |
| Shadows | ❌ No | ✅ Yes | Hard |
| | | | |
| **STRUCTURE** | | | |
| Navigation menu items | ❌ No | ✅ Yes | Medium |
| Feature card content | ❌ No | ✅ Yes | Medium |
| Footer links | ❌ No | ✅ Yes | Medium |
| Number of testimonials | ❌ No | ✅ Yes | Hard |
| Layout/grid columns | ❌ No | ✅ Yes | Hard |
| Add new sections | ❌ No | ✅ Yes | Hard |
| | | | |
| **MEDIA** | | | |
| Icons/Emojis | ❌ No | ✅ Yes | Easy |
| Images | ✅ Possible* | ✅ Yes | Medium |

*Images can be added via BigCommerce's built-in widgets/regions if configured

---

## 🎯 What IS Editable from Backend

### Current Implementation

After uploading your theme, you can edit these **without touching code**:

#### Homepage Hero Section
```
✅ Headline: "Welcome to Our Store"
✅ Subheading: "Discover amazing products..."
✅ Button text: "Shop Now"
✅ Show/Hide toggle
```

#### Features Section
```
✅ Heading: "Why Shop With Us?"
✅ Show/Hide toggle
❌ Individual feature cards (hardcoded)
```

#### Testimonials Section
```
✅ Section heading
✅ Testimonial 1 text + author
✅ Testimonial 2 text + author
✅ Testimonial 3 text + author
✅ Show/Hide toggle
❌ Number of testimonials (always 3)
❌ Star ratings (always 5 stars)
```

#### CTA Section
```
✅ Heading: "Ready to Start Shopping?"
✅ Subheading: "Join thousands..."
✅ Button 1 text: "Browse Products"
✅ Button 2 text: "Learn More"
✅ Show/Hide toggle
```

#### Footer
```
✅ Newsletter heading
✅ Newsletter description
✅ About Us text
✅ Phone number
✅ Email address
❌ Footer links (hardcoded)
❌ Column structure
```

---

## 🔧 What REQUIRES Code Editing

### Things You CANNOT Change from Backend

#### 1. Colors & Styling
**Examples:**
- Purple gradient → Pink gradient
- Green button → Blue button
- Dark footer → Light footer
- Font size changes

**Where to edit:**
- `templates/pages/home.html` (inline styles)
- `templates/components/common/footer.html` (inline styles)
- Create custom SCSS files (better approach)

#### 2. Feature Cards Content
**Current hardcoded:**
- 🚚 Free Shipping
- 🔒 Secure Payment
- 💎 Premium Quality
- 🎁 Gift Wrapping

**To make editable:**
1. Add 16 settings to `config.json` (title + description for each)
2. Update `templates/pages/home.html` to use variables
3. Re-bundle and upload

#### 3. Navigation Menu
**Current:**
- Collections (with 4 subtabs)
- Lifestyle (with 5 subtabs)
- Special Offers 🔥 (with 4 subtabs)
- Blog
- Contact Us

**To edit:**
- Edit `templates/components/common/navigation-menu.html`
- Or use BigCommerce's native navigation (remove custom code)

#### 4. Footer Links
**Current hardcoded sections:**
- Quick Links (5 items)
- Customer Service (5 items)
- Categories (dynamic, pulls from store)

**To edit:**
- Modify `templates/components/common/footer.html`
- Update each `<a href="#">` link

---

## 💡 How to Make MORE Things Backend Editable

### Example: Making Feature Cards Editable

**Step 1: Add Settings to config.json**
```json
{
  "demo_feature_1_icon": "🚚",
  "demo_feature_1_title": "Free Shipping",
  "demo_feature_1_description": "On orders over $50",
  "demo_feature_2_icon": "🔒",
  "demo_feature_2_title": "Secure Payment",
  "demo_feature_2_description": "100% secure transactions"
}
```

**Step 2: Update Template**
```handlebars
<div>
  <div>{{theme_settings.demo_feature_1_icon}}</div>
  <h3>{{theme_settings.demo_feature_1_title}}</h3>
  <p>{{theme_settings.demo_feature_1_description}}</p>
</div>
```

**Step 3: Bundle & Upload**
```bash
stencil bundle
# Upload to BigCommerce
```

---

## 📋 Decision Guide: Backend or Code?

### Use Backend Editing When:
- ✅ Changing text content
- ✅ Updating contact information
- ✅ Modifying CTAs and button labels
- ✅ Toggling sections on/off
- ✅ Quick changes needed
- ✅ Non-technical user making changes

### Use Code Editing When:
- ✅ Changing colors or design
- ✅ Modifying layout structure
- ✅ Adding new sections
- ✅ Changing navigation
- ✅ Custom functionality needed
- ✅ Performance optimization

---

## 🚀 Workflow Recommendations

### For Store Owners (Non-Technical)

**Editing Text:**
1. Go to Storefront → My Themes → Customize
2. Find the setting you want to change
3. Edit and click Publish
4. ✅ Done!

**Editing Design:**
1. Document what you want changed
2. Hire a developer OR
3. Learn basic HTML/CSS
4. Edit template files
5. Test locally with `stencil start`
6. Bundle and upload

### For Developers

**Quick Text Updates:**
- Use backend editing (faster for client)
- Train client on using Theme Editor

**Design/Layout Changes:**
- Always edit code directly
- Test locally first
- Version control (Git)
- Deploy via `stencil bundle`

**Making New Elements Editable:**
1. Add to `config.json`
2. Update templates with `{{theme_settings.*}}`
3. Test locally
4. Bundle and upload
5. Train client on new settings

---

## 🎨 Real-World Examples

### Example 1: Change "Shop Now" to "Start Shopping"
**Backend**: ✅ Easy
1. Theme Editor → Find "Demo Hero Button Text"
2. Change to "Start Shopping"
3. Publish
4. Done in 30 seconds

### Example 2: Change Button Color from Pink to Blue
**Code**: ✅ Required
1. Open `templates/pages/home.html`
2. Find: `color: #f5576c`
3. Change to: `color: #3b82f6`
4. Save, test locally
5. Bundle and upload
6. Done in 5 minutes (including testing)

### Example 3: Add a Fourth Testimonial
**Code**: ✅ Required (Complex)
1. Add to `config.json`:
   - `demo_testimonial_4_text`
   - `demo_testimonial_4_author`
2. Update `templates/pages/home.html`:
   - Copy testimonial div
   - Update with new variables
3. Test locally
4. Bundle and upload
5. Done in 15 minutes

### Example 4: Change Footer Background from Dark to Light
**Code**: ✅ Required
1. Open `templates/components/common/footer.html`
2. Find: `background: #2d3748; color: #e2e8f0;`
3. Change to: `background: #ffffff; color: #333333;`
4. Update all link colors for contrast
5. Test locally
6. Bundle and upload
7. Done in 10 minutes

---

## 🎓 Learning Path

### Level 1: Backend Editing Only
**Skills needed:** None
**Can change:** All text content, show/hide sections
**Training time:** 10 minutes

### Level 2: Basic Code Editing
**Skills needed:** HTML basics, inline CSS
**Can change:** Colors, basic styling, simple text
**Training time:** 2-4 hours

### Level 3: Template Customization
**Skills needed:** Handlebars, HTML, CSS
**Can change:** Layouts, sections, navigation
**Training time:** 1-2 days

### Level 4: Full Theme Development
**Skills needed:** Handlebars, JavaScript, SCSS, Webpack
**Can change:** Everything
**Training time:** 1-2 weeks

---

## 📝 Summary Table

| Aspect | Backend | Code |
|--------|---------|------|
| **Speed** | Fast (seconds) | Slower (minutes to hours) |
| **Ease** | Very easy | Medium to hard |
| **Skills** | None needed | HTML/CSS/Handlebars |
| **Scope** | Limited (text only) | Unlimited |
| **Who** | Anyone | Developers |
| **Mistakes** | Easy to undo | Risky if no backup |
| **Testing** | Live preview | Local dev server |

---

## ✅ Best Practices

### For Maximum Backend Editability:
1. Add more settings to `config.json` for common changes
2. Use `{{theme_settings.*}}` liberally in templates
3. Create toggle switches for optional sections
4. Document all settings clearly
5. Group related settings together

### For Performance:
1. Don't over-create settings (each adds processing time)
2. Use defaults wisely
3. Cache-friendly: avoid dynamic color calculations
4. Keep inline styles for demo, move to SCSS for production

### For Maintainability:
1. Comment your code
2. Use consistent naming (`demo_section_field_name`)
3. Document what's editable vs hardcoded
4. Version control everything
5. Keep documentation up to date

---

## 🆘 Common Questions

**Q: Can I add an image upload field for the hero banner?**
**A:** Not easily. BigCommerce doesn't support image uploads in theme settings. You'd need to use BigCommerce's Page Builder or Widgets API.

**Q: Why not make everything backend editable?**
**A:** Trade-offs:
- More settings = more complex Theme Editor
- Some things (colors) are better as design decisions
- Performance impact with too many settings
- Maintenance overhead

**Q: Can I change colors from the backend?**
**A:** Yes, but requires code changes first:
1. Add color picker to `schema.json` (Theme Editor configuration)
2. Reference in `config.json`
3. Use in templates: `style="color: {{theme_settings.my_color}}"`

**Q: What's the fastest way to customize?**
**A:**
1. Backend editing for text (instant)
2. Code editing for design (local test, then upload)
3. Hire developer for major changes

---

**Remember:** Backend editing = convenience, Code editing = power

Choose based on your needs, skills, and timeline!
