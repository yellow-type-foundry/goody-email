# Goody Email Project

## File Structure

### ⚠️ CRITICAL: File Purposes

**index.html** = Gmail Mockup
- Contains the full Gmail interface (sidebar, top bar, email area)
- Loads email content from `email-design.html` dynamically
- MUST contain: `gmail-container`, `gmail-sidebar`, `gmail-email-area`
- DO NOT replace this with email design content!

**email-design.html** = Email Design Template
- Contains the actual email HTML content
- Loaded by index.html via `loadEmailContent()` function
- Contains: `email-container` with email content

## Before Making Changes

1. Verify `index.html` contains `gmail-container` class
2. Verify `index.html` contains `gmail-sidebar` class  
3. Verify `index.html` has `loadEmailContent()` function
4. If making path changes, use search-replace, don't replace entire file
5. Test that Gmail mockup structure remains intact

## Asset Paths

- Fonts: `/assets/...` (absolute paths)
- Images: `/images/...` (absolute paths)



<!-- Test commit for Vercel auto-deploy -->

<!-- Test auto-deployment 1765549806 -->

<!-- Auto-deploy test Fri Dec 12 21:33:28 +07 2025 -->

<!-- Test 1765550096 -->
