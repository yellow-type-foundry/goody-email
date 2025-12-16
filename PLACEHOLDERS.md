# Placeholder Variables Documentation

## Overview

The email template currently uses hardcoded values that need to be replaced with dynamic template variables before production deployment.

## Current Hardcoded Values

The following values are currently hardcoded in `email-design.html`:

| Location | Current Value | Should Be |
|----------|--------------|-----------|
| Hero heading | "Kate sent you a gift" | `{{event.sender_full_name}} sent you a gift` |
| Hero text | "Hi Bao" | `Hi {{customer.first_name}}` or `Hi {{customer.name}}` |
| Message card sender | "From Kate" | `From {{event.sender_full_name}}` |
| Message text | "Bao - We wanted to take a moment..." | `{{event.message_text}}` or `{{message}}` |
| Footer email | "kate@ongoody.com" | `{{event.sender_email}}` or `{{sender.email}}` |
| Claim button URL | `https://goody.com/claim?token=abc123xyz` | `{{claim_link}}` |
| Unsubscribe URL | `https://goody.com/unsubscribe?token=xyz789abc` | `{{unsubscribe_link}}` |

## Required Placeholder Variables

### 1. Sender Information

#### `{{event.sender_full_name}}`
- **Current Value**: "Kate"
- **Usage**: 
  - Hero heading: "{{event.sender_full_name}} sent you a gift"
  - Message card: "From {{event.sender_full_name}}"
- **Type**: String
- **Required**: Yes
- **Example**: "Kate", "John Smith", "Sarah Johnson"

#### `{{event.sender_email}}`
- **Current Value**: "kate@ongoody.com"
- **Usage**: Footer text: "{{event.sender_email}} is using Goody to send you a gift."
- **Type**: Email address
- **Required**: Yes
- **Example**: "kate@ongoody.com"

### 2. Recipient Information

#### `{{customer.first_name}}` or `{{customer.name}}`
- **Current Value**: "Bao"
- **Usage**: Hero text: "Hi {{customer.first_name}}"
- **Type**: String
- **Required**: Yes
- **Example**: "Bao", "John", "Sarah"

#### `{{customer.email}}`
- **Current Value**: Not used (but documented in QA checklist)
- **Usage**: May be needed for personalization or tracking
- **Type**: Email address
- **Required**: Optional
- **Example**: "customer@example.com"

### 3. Message Content

#### `{{event.message_text}}` or `{{message}}`
- **Current Value**: "Bao - We wanted to take a moment to thank you for your continued support. We truly appreciate your partnership and dedication."
- **Usage**: Message card content
- **Type**: String (may contain HTML)
- **Required**: Yes
- **Example**: "Thank you for everything you do!"

**Note**: If message can contain HTML, ensure proper sanitization.

### 4. Links

#### `{{claim_link}}`
- **Current Value**: `https://goody.com/claim?token=abc123xyz`
- **Usage**: 
  - Hero CTA button
  - Instructions CTA button (all styles)
  - Footer CTA button (Style 3)
- **Type**: URL
- **Required**: Yes
- **Example**: `https://goody.com/claim?token=abc123xyz&email=customer@example.com`

**Security Note**: Ensure token is properly validated server-side.

#### `{{unsubscribe_link}}`
- **Current Value**: `https://goody.com/unsubscribe?token=xyz789abc`
- **Usage**: Footer unsubscribe link (all styles)
- **Type**: URL
- **Required**: Yes
- **Example**: `https://goody.com/unsubscribe?token=xyz789abc&email=customer@example.com`

**Legal Note**: Unsubscribe link is required by law (CAN-SPAM, GDPR).

## Implementation Guide

### Step 1: Identify All Hardcoded Values

Search for these strings in `email-design.html`:
- "Kate"
- "Bao"
- "kate@ongoody.com"
- `https://goody.com/claim?token=abc123xyz`
- `https://goody.com/unsubscribe?token=xyz789abc`

### Step 2: Replace with Placeholders

#### Example: Hero Heading
```html
<!-- Before -->
<h1>Kate sent you a gift</h1>

<!-- After -->
<h1>{{event.sender_full_name}} sent you a gift</h1>
```

#### Example: Hero Text
```html
<!-- Before -->
<p>Hi Bao, Goody is a gifting service...</p>

<!-- After -->
<p>Hi {{customer.first_name}}, Goody is a gifting service...</p>
```

#### Example: Claim Link
```html
<!-- Before -->
<a href="https://goody.com/claim?token=abc123xyz">Accept my gift</a>

<!-- After -->
<a href="{{claim_link}}">Accept my gift</a>
```

### Step 3: Template Engine Integration

The placeholder format depends on your template engine:

#### Handlebars/Mustache
```html
{{event.sender_full_name}}
{{customer.first_name}}
{{claim_link}}
```

#### Jinja2 (Python)
```html
{{ event.sender_full_name }}
{{ customer.first_name }}
{{ claim_link }}
```

#### Liquid (Ruby)
```html
{{ event.sender_full_name }}
{{ customer.first_name }}
{{ claim_link }}
```

#### PHP
```php
<?php echo $event['sender_full_name']; ?>
<?php echo $customer['first_name']; ?>
<?php echo $claim_link; ?>
```

### Step 4: Testing

After implementing placeholders:

1. **Test with Sample Data**
   ```json
   {
     "event": {
       "sender_full_name": "Kate",
       "sender_email": "kate@ongoody.com",
       "message_text": "Thank you for everything!"
     },
     "customer": {
       "first_name": "Bao",
       "email": "bao@example.com"
     },
     "claim_link": "https://goody.com/claim?token=test123",
     "unsubscribe_link": "https://goody.com/unsubscribe?token=test456"
   }
   ```

2. **Test Edge Cases**
   - Long names: "Kate Elizabeth Smith-Johnson"
   - Short names: "Kate"
   - Special characters: "Kate O'Brien"
   - International characters: "Kate Müller"
   - Empty message text
   - Very long message text

3. **Validate URLs**
   - Ensure claim_link is valid
   - Ensure unsubscribe_link is valid
   - Test URL encoding if needed

## Placeholder Naming Convention

### Recommended Format
- Use snake_case: `sender_full_name` not `senderFullName`
- Use descriptive names: `claim_link` not `link1`
- Group related variables: `event.*`, `customer.*`

### Variable Groups

#### Event Variables (`event.*`)
- `event.sender_full_name`
- `event.sender_email`
- `event.message_text`
- `event.gift_id` (if needed)
- `event.gift_options` (if needed)

#### Customer Variables (`customer.*`)
- `customer.first_name`
- `customer.last_name`
- `customer.name` (full name)
- `customer.email`

#### System Variables
- `claim_link`
- `unsubscribe_link`
- `company_name` (if needed)
- `company_address` (if needed)

## Security Considerations

### URL Parameters
- **Never** include sensitive data in URLs
- Use secure tokens (not sequential IDs)
- Validate tokens server-side
- Use HTTPS for all links

### XSS Prevention
- Sanitize all user-generated content (message text)
- Escape HTML in message text if needed
- Validate email addresses
- Use proper encoding

### Privacy
- Don't include sensitive customer data
- Follow GDPR/CAN-SPAM requirements
- Include unsubscribe link (required by law)

## Testing Checklist

Before deploying with placeholders:

- [ ] All placeholders replaced
- [ ] Template engine configured
- [ ] Sample data tested
- [ ] Edge cases tested
- [ ] URLs validated
- [ ] Security reviewed
- [ ] Email client testing completed

## Example Implementation

### Sample Template Data
```json
{
  "event": {
    "sender_full_name": "Kate",
    "sender_email": "kate@ongoody.com",
    "message_text": "Thank you for your continued support!"
  },
  "customer": {
    "first_name": "Bao",
    "email": "bao@example.com"
  },
  "claim_link": "https://goody.com/claim?token=abc123xyz&email=bao@example.com",
  "unsubscribe_link": "https://goody.com/unsubscribe?token=xyz789abc&email=bao@example.com"
}
```

### Rendered Output
- Hero: "Kate sent you a gift"
- Greeting: "Hi Bao, Goody is a gifting service..."
- Message: "Thank you for your continued support!"
- Footer: "kate@ongoody.com is using Goody to send you a gift."

---

**Next Steps**: 
1. Review this document with your development team
2. Choose a template engine
3. Implement placeholder replacement
4. Test thoroughly before production deployment

