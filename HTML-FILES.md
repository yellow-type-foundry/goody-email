# HTML Files Structure

This project has exactly **2 HTML files**:

## 1. index.html
- **Purpose**: Gmail Mockup
- **Contains**: 
  - `gmail-container` (main Gmail interface)
  - `gmail-sidebar` (left navigation)
  - `gmail-email-area` (email viewing area)
  - `loadEmailContent()` function (loads email-design.html)
- **DO NOT** replace with email design content!

## 2. email-design.html
- **Purpose**: Email Design Template
- **Contains**:
  - `email-container` (the actual email HTML)
  - Email content, steps, footer, etc.
- **Loaded by**: index.html via `loadEmailContent()`

## Verification
Run this to verify structure:
```bash
# Check we have exactly 2 files
find . -maxdepth 1 -name "*.html" | wc -l  # Should be 2

# Verify index.html has Gmail structure
grep -q 'class="gmail-container"' index.html && echo "✓ Gmail mockup OK"

# Verify email-design.html has email structure  
grep -q 'email-container' email-design.html && echo "✓ Email design OK"
```
