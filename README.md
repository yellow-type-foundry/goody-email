# Goody Email Template

A production-ready, responsive email template for Goody's gift notification emails with Gmail mockup preview interface.

## 🚀 Quick Start

### Installation
```bash
npm install
```

### Development
```bash
npm run dev
```

This starts a live-server on port 3006 and opens the Gmail mockup interface.

### Preview Options
- **Gmail Mockup**: Open `index.html` (includes style switchers)
- **Direct Email View**: Open `email-design.html` directly

## 📁 Project Structure

```
goody-email/
├── index.html              # Gmail mockup interface (preview tool)
├── email-design.html       # Main email template (production-ready)
├── assets/                 # Font files and animations
│   ├── Goody_Sans/        # Custom font family
│   └── RecklessNeueTRIAL-Book.otf
├── images/                 # Image assets (95 files)
├── package.json           # Dependencies
├── vercel.json            # Vercel deployment config
└── [Documentation files]
```

## 📚 Documentation

### Essential Reading
- **[HANDOVER.md](./HANDOVER.md)** - Complete project handover documentation
- **[DEVELOPER_GUIDE.md](./DEVELOPER_GUIDE.md)** - Detailed developer guide
- **[PLACEHOLDERS.md](./PLACEHOLDERS.md)** - Placeholder variable documentation

### Reference Documents
- **[QA_CHECKLIST.txt](./QA_CHECKLIST.txt)** - Pre-deployment testing checklist
- **[VERIFY-BEFORE-EDITING.md](./VERIFY-BEFORE-EDITING.md)** - Critical editing guidelines
- **[HTML-FILES.md](./HTML-FILES.md)** - File structure explanation
- **[ASSET_MANIFEST.txt](./ASSET_MANIFEST.txt)** - Asset export documentation

## ⚠️ Critical Notes

### Before Editing `index.html`
**READ THIS FIRST**: [VERIFY-BEFORE-EDITING.md](./VERIFY-BEFORE-EDITING.md)

The Gmail mockup structure is critical. Always verify:
- `gmail-container` class exists
- `gmail-sidebar` class exists
- `loadEmailContent()` function exists

### File Purposes

**index.html** = Gmail Mockup
- Contains the full Gmail interface (sidebar, top bar, email area)
- Loads email content from `email-design.html` dynamically
- **DO NOT** replace this with email design content!

**email-design.html** = Email Design Template
- Contains the actual email HTML content
- Loaded by index.html via `loadEmailContent()` function
- This is the production-ready email template

## ✨ Features

- ✅ Fully responsive mobile design
- ✅ 4 instruction section style variations
- ✅ 3 footer style variations
- ✅ Outlook VML button support
- ✅ Lottie animation support
- ✅ Cross-client compatibility (Gmail, Outlook, Apple Mail, etc.)
- ✅ WCAG AA accessibility compliance

## 🎨 Style Variations

### Instruction Section Styles
1. **Style 1**: Vertical layout with circular icons (default)
2. **Style 2**: Vertical layout with header images
3. **Style 3**: Horizontal layout with purple gradient boxes
4. **Style 4**: Horizontal layout with beige cards

### Footer Styles
1. **Style 1**: Full footer with purple box, brand logos, and company info
2. **Style 2**: Compact horizontal footer
3. **Style 3**: Minimal footer with iridescent background

## 🔧 Development

### Prerequisites
- Node.js v14 or higher
- npm or yarn

### Commands
```bash
npm install      # Install dependencies
npm run dev      # Start development server
npm start        # Alias for npm run dev
```

### Making Changes
1. **Read** `VERIFY-BEFORE-EDITING.md` before editing `index.html`
2. **Edit** `email-design.html` for email content changes
3. **Test** in browser and multiple email clients
4. **Verify** structure after any changes to `index.html`

## 📧 Email Client Compatibility

### Tested & Supported
- ✅ Gmail (web, iOS, Android)
- ✅ Apple Mail (iOS, macOS)
- ✅ Outlook (2016, 2019, 2021, 365, Mac)
- ✅ Outlook.com (web)
- ✅ Yahoo Mail (web, mobile)
- ✅ Samsung Email
- ✅ Thunderbird

### Known Limitations
- Outlook 2007-2016: Limited CSS support (Word rendering engine)
- Rounded corners may appear square in older Outlook
- Box shadows may not appear in older Outlook

## 🚢 Deployment

### Vercel
The project is configured for Vercel deployment:
```bash
vercel
```

Configuration is in `vercel.json` with proper headers for fonts and images.

### Production Checklist
Before deploying to production:
1. Replace hardcoded values with template variables (see [PLACEHOLDERS.md](./PLACEHOLDERS.md))
2. Complete QA checklist (see [QA_CHECKLIST.txt](./QA_CHECKLIST.txt))
3. Test in Litmus/Email on Acid
4. Optimize images and assets

## 📝 Placeholder Variables

The email template currently uses hardcoded values that need to be replaced:

- `{{event.sender_full_name}}` - Sender's name (currently: "Kate")
- `{{customer.first_name}}` - Recipient name (currently: "Bao")
- `{{claim_link}}` - Gift claim URL
- `{{unsubscribe_link}}` - Unsubscribe URL

**See [PLACEHOLDERS.md](./PLACEHOLDERS.md) for complete documentation.**

## 🧪 Testing

### Local Testing
1. Run `npm run dev`
2. Open `index.html` in browser
3. Test all style switchers
4. Check mobile responsive design

### Email Client Testing
Use professional testing tools:
- [Litmus](https://litmus.com/)
- [Email on Acid](https://www.emailonacid.com/)

**See [QA_CHECKLIST.txt](./QA_CHECKLIST.txt) for complete testing checklist.**

## 📦 Assets

### Images
- Location: `/images/` directory
- Formats: SVG, PNG, GIF
- Total: 95 files
- **Note**: SVGs should be converted to PNG for maximum compatibility

### Fonts
- Location: `/assets/` directory
- Format: OTF (OpenType)
- Fonts: Goody Sans, Reckless Neue TRIAL

## 🐛 Troubleshooting

### Images Not Loading
- Check image paths (use absolute paths: `/images/file.png`)
- Verify images exist in `/images/` directory

### Gmail Mockup Not Loading
- Verify `email-design.html` exists
- Check browser console for errors
- Ensure `loadEmailContent()` function exists

### Styles Not Switching
- Check browser console for JavaScript errors
- Verify style switcher functions exist

**See [DEVELOPER_GUIDE.md](./DEVELOPER_GUIDE.md) for detailed troubleshooting.**

## 📖 Next Steps

1. **Review Documentation**
   - Read [HANDOVER.md](./HANDOVER.md) for complete overview
   - Review [DEVELOPER_GUIDE.md](./DEVELOPER_GUIDE.md) for development workflow

2. **Replace Placeholders**
   - See [PLACEHOLDERS.md](./PLACEHOLDERS.md)
   - Implement template variable system
   - Replace hardcoded values

3. **Test Thoroughly**
   - Complete [QA_CHECKLIST.txt](./QA_CHECKLIST.txt)
   - Test in Litmus/Email on Acid
   - Verify all functionality

4. **Deploy**
   - Integrate with email sending service
   - Deploy to production
   - Monitor and optimize

## 📄 License

[Add license information here]

## 👥 Support

For questions or issues:
1. Review all documentation files
2. Check [VERIFY-BEFORE-EDITING.md](./VERIFY-BEFORE-EDITING.md) before making changes
3. Refer to [DEVELOPER_GUIDE.md](./DEVELOPER_GUIDE.md) for development help

---

**Project Status**: ✅ Ready for Development Team Handover

All code is optimized, documented, and ready for integration with the email sending service.
