# Goody Email Template - Developer Guide

## Table of Contents
1. [Quick Start](#quick-start)
2. [Project Structure](#project-structure)
3. [Development Workflow](#development-workflow)
4. [Making Changes](#making-changes)
5. [Testing](#testing)
6. [Deployment](#deployment)
7. [Troubleshooting](#troubleshooting)

## Quick Start

### Prerequisites
- Node.js v14 or higher
- npm or yarn
- A modern web browser

### Installation
```bash
# Clone the repository
git clone <repository-url>
cd goody-email

# Install dependencies
npm install
```

### Running the Development Server
```bash
npm run dev
```

This will:
- Start a live-server on port 3006
- Automatically open `index.html` in your browser
- Watch for file changes and reload automatically

### Accessing the Preview
- **Gmail Mockup**: http://localhost:3006/index.html
- **Direct Email View**: http://localhost:3006/email-design.html

## Project Structure

### Core Files

#### `index.html`
The Gmail mockup interface. **DO NOT** modify the structure without reading `VERIFY-BEFORE-EDITING.md` first.

**Key Components:**
- `gmail-container`: Main container div
- `gmail-sidebar`: Left navigation sidebar
- `gmail-email-area`: Email viewing area
- `loadEmailContent()`: Function that loads email-design.html

**Before Editing:**
```bash
# Verify structure exists
grep -q 'class="gmail-container"' index.html || echo "ERROR: Structure missing!"
```

#### `email-design.html`
The production email template. This is the file that will be sent to recipients.

**Key Features:**
- Table-based layout (email client compatible)
- Inline styles (no external CSS)
- 4 instruction section styles
- 3 footer styles
- Responsive mobile design
- Outlook VML button support

### Asset Directories

#### `/assets/`
- Font files (OTF format)
- Animation JSON files
- Custom fonts: Goody Sans, Reckless Neue TRIAL

#### `/images/`
- All image assets (95 files)
- Formats: SVG, PNG, GIF
- Organized by usage (logos, steps, footer, etc.)

## Development Workflow

### 1. Making Style Changes

#### Changing Email Content
Edit `email-design.html` directly. All styles are inline.

**Example: Changing a color:**
```html
<!-- Find the element -->
<p style="color: #000000;">Text</p>

<!-- Update inline style -->
<p style="color: #713df5;">Text</p>
```

#### Changing Gmail Mockup
Edit `index.html` carefully. Always verify structure after changes.

**Verification Script:**
```bash
# Check critical elements exist
grep -q 'class="gmail-container"' index.html && \
grep -q 'class="gmail-sidebar"' index.html && \
grep -q 'loadEmailContent' index.html && \
echo "✓ Structure OK" || echo "✗ Structure broken!"
```

### 2. Adding New Styles

#### Adding a New Instruction Style
1. Add the HTML structure in `email-design.html`
2. Add CSS to hide/show the style
3. Update `switchStyle()` function in JavaScript
4. Add navigation button if needed

#### Adding a New Footer Style
1. Add the HTML structure in `email-design.html`
2. Add CSS to hide/show the style
3. Update `switchFooterStyle()` function in JavaScript
4. Update navigation buttons

### 3. Working with Images

#### Adding New Images
1. Add image file to `/images/` directory
2. Reference with absolute path: `/images/filename.png`
3. Always include `alt` text for accessibility

#### Image Optimization
- Target file size: <200KB per image
- Use PNG for complex images
- Use SVG for simple graphics (but convert to PNG for email)
- Create 2x versions for retina displays

### 4. Working with Fonts

#### Custom Fonts
Fonts are loaded via `@font-face` in both HTML files.

**Font Files:**
- `/assets/Goody_Sans/` - Goody Sans family
- `/assets/RecklessNeueTRIAL-Book.otf` - Reckless Neue

**Fallback Fonts:**
Always specify fallbacks:
```css
font-family: 'Goody Sans', Helvetica, Arial, sans-serif;
```

**Note:** Custom fonts may not load in all email clients. Fallbacks are critical.

## Making Changes

### Before Making Any Changes

1. **Read `VERIFY-BEFORE-EDITING.md`** - Critical guidelines
2. **Check `HTML-FILES.md`** - Understand file purposes
3. **Backup your work** - Use version control

### Safe Editing Practices

#### ✅ DO:
- Use search-replace for targeted changes
- Test changes in browser immediately
- Verify structure after edits
- Keep inline styles for email compatibility
- Test in multiple email clients

#### ❌ DON'T:
- Replace entire files without checking structure
- Remove Gmail mockup structure from `index.html`
- Use external CSS files
- Use modern CSS (flexbox, grid) in email template
- Remove inline styles

### Editing Checklist

Before committing changes:
- [ ] Verified `gmail-container` exists (if editing index.html)
- [ ] Tested in browser
- [ ] Checked mobile responsiveness
- [ ] Verified no broken image paths
- [ ] Tested style switchers (if applicable)

## Testing

### Local Testing

#### Browser Testing
1. Open `index.html` in browser
2. Test all style switchers
3. Check mobile responsive design (browser dev tools)
4. Verify all images load
5. Test all links

#### Email Client Testing

**Recommended Tools:**
- **Litmus** (https://litmus.com/) - Comprehensive email testing
- **Email on Acid** (https://www.emailonacid.com/) - Email testing platform
- **MailHog** - Local email testing server

**Testing Process:**
1. Upload `email-design.html` to testing platform
2. Replace placeholders with test data
3. Test across all email clients
4. Review screenshots and notes
5. Fix issues and re-test

### Testing Checklist

See `QA_CHECKLIST.txt` for complete testing checklist. Key areas:

- [ ] Mobile devices (iOS, Android)
- [ ] Desktop email clients
- [ ] Outlook (all versions)
- [ ] Accessibility (WCAG AA)
- [ ] Image loading
- [ ] Link functionality
- [ ] Spam filter compatibility

## Deployment

### Pre-Deployment Checklist

1. **Replace Placeholders**
   - Replace hardcoded values with template variables
   - See `PLACEHOLDERS.md` for details

2. **Optimize Assets**
   - Compress images
   - Convert SVGs to PNG
   - Verify font files

3. **Test Thoroughly**
   - Complete QA checklist
   - Test in Litmus/Email on Acid
   - Verify all links work

4. **Update Documentation**
   - Update version numbers
   - Document any changes
   - Update placeholder documentation

### Vercel Deployment

The project is configured for Vercel deployment:

```bash
# Install Vercel CLI
npm i -g vercel

# Deploy
vercel
```

Configuration is in `vercel.json`:
- Font file headers (CORS, caching)
- Image caching headers
- Static site configuration

### Production Deployment

1. **Email Service Integration**
   - Integrate with email sending service (SendGrid, Mailgun, etc.)
   - Set up template variable replacement
   - Configure dynamic content

2. **CDN Setup** (if needed)
   - Upload images to CDN
   - Update image paths in HTML
   - Configure CORS headers

3. **Monitoring**
   - Set up email analytics
   - Monitor delivery rates
   - Track open/click rates

## Troubleshooting

### Common Issues

#### Images Not Loading
**Problem:** Images show as broken in email
**Solutions:**
- Check image paths (use absolute paths: `/images/file.png`)
- Verify images exist in `/images/` directory
- Check file permissions
- Ensure images are uploaded to CDN (if using)

#### Gmail Mockup Not Loading Email
**Problem:** `index.html` shows "Error loading email content"
**Solutions:**
- Verify `email-design.html` exists in same directory
- Check browser console for errors
- Ensure `loadEmailContent()` function exists
- Verify `.email-container` class exists in email-design.html

#### Styles Not Switching
**Problem:** Style switcher buttons don't work
**Solutions:**
- Check browser console for JavaScript errors
- Verify `switchStyle()` and `switchFooterStyle()` functions exist
- Check that style classes exist in HTML
- Ensure JavaScript is loaded

#### Outlook Rendering Issues
**Problem:** Email looks broken in Outlook
**Solutions:**
- Verify table-based layout (not flexbox/grid)
- Check VML button code exists
- Ensure inline styles are used
- Test in Litmus/Email on Acid

#### Fonts Not Loading
**Problem:** Custom fonts don't appear
**Solutions:**
- This is expected in many email clients
- Verify fallback fonts are specified
- Test in multiple clients
- Consider using web-safe fonts only

### Debugging Tips

1. **Browser Dev Tools**
   - Use to inspect HTML structure
   - Check for JavaScript errors
   - Test responsive design

2. **Email Testing Tools**
   - Use Litmus/Email on Acid for client testing
   - Check screenshots for rendering issues
   - Review code validation

3. **Validation**
   - Validate HTML: https://validator.w3.org/
   - Check CSS: https://jigsaw.w3.org/css-validator/
   - Test accessibility: https://wave.webaim.org/

## Best Practices

### Email Development
- Always use table-based layouts
- Keep styles inline
- Test in multiple clients
- Use fallback fonts
- Optimize images
- Include alt text on images

### Code Quality
- Comment complex sections
- Use semantic HTML
- Follow accessibility guidelines
- Keep code organized
- Document changes

### Version Control
- Commit frequently
- Write descriptive commit messages
- Test before committing
- Keep documentation updated

## Resources

### Documentation
- `README.md` - Project overview
- `HANDOVER.md` - Handover documentation
- `PLACEHOLDERS.md` - Placeholder variables
- `QA_CHECKLIST.txt` - Testing checklist

### External Resources
- [Litmus](https://litmus.com/) - Email testing
- [Email on Acid](https://www.emailonacid.com/) - Email testing
- [Can I Email](https://www.caniemail.com/) - Email client support
- [Email Design Guide](https://www.campaignmonitor.com/dev-resources/guides/coding/) - Best practices

---

**Need Help?** Review the documentation files or check the troubleshooting section above.

