# ⚠️ CRITICAL: READ THIS BEFORE EDITING index.html

## The Problem
The Gmail mockup keeps getting removed from index.html because:
1. **I restore from wrong commits** - I grab email-design.html content instead of Gmail mockup
2. **I overwrite instead of edit** - Using `git show > file` or `sed` commands that replace entire sections
3. **I don't verify before committing** - I don't check if gmail-container exists after changes

## The Real Solution

### Before ANY edit to index.html:
```bash
# 1. ALWAYS verify gmail-container exists FIRST
grep -q 'class="gmail-container"' index.html || { echo "ERROR: No gmail-container!"; exit 1; }

# 2. Make targeted edits, not wholesale replacements
# BAD: git show commit:index.html > index.html
# GOOD: sed -i 's/old/new/g' index.html (targeted)

# 3. Verify again AFTER edit
grep -q 'class="gmail-container"' index.html || { echo "ERROR: Removed gmail-container!"; exit 1; }
```

### What index.html MUST contain:
- `class="gmail-container"` (the main container div)
- `class="gmail-sidebar"` (the sidebar)
- `class="gmail-email-area"` (the email area)
- `function loadEmailContent()` (loads email-design.html)

### What index.html MUST NOT contain:
- `class="email-container"` as the main structure (that's email-design.html)
- Direct email content (that goes in email-design.html)

## Pre-commit Hook
A git pre-commit hook is now installed that will:
- Block commits if gmail-container is missing
- Verify the structure before allowing commit

## If You See This File
STOP. Check what you're about to do. Verify gmail-container exists first.


