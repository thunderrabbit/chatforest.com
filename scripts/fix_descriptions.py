#!/usr/bin/env python3
"""Fix bloated meta descriptions across the site.

Google truncates meta descriptions at ~155-160 chars. Many of our review pages
have 2000-5000 char descriptions that get badly truncated in search results,
hurting CTR. This script shortens them to ~160 chars max.

Strategy:
- If description <= 200 chars: leave it alone
- If description > 200 chars: extract a concise version from the first
  sentence or two, targeting ~155 chars
"""

import os
import re
import glob


def extract_frontmatter(content):
    """Extract frontmatter and body from markdown content."""
    match = re.match(r'^---\n(.*?)\n---\n?(.*)', content, re.DOTALL)
    if not match:
        return None, content
    return match.group(1), match.group(2)


def get_field(frontmatter, field):
    """Get a field value from frontmatter text."""
    # Match field: "value" or field: 'value' (possibly multi-line quoted)
    pattern = rf'^{field}:\s*"((?:[^"\\]|\\.)*)"\s*$'
    match = re.search(pattern, frontmatter, re.MULTILINE)
    if match:
        return match.group(1)
    # Try single quotes
    pattern = rf"^{field}:\s*'((?:[^'\\]|\\.)*)'\s*$"
    match = re.search(pattern, frontmatter, re.MULTILINE)
    if match:
        return match.group(1)
    return None


def set_field(frontmatter, field, new_value):
    """Replace a field value in frontmatter text."""
    # Escape for YAML double-quoted string
    escaped = new_value.replace('\\', '\\\\').replace('"', '\\"')
    # Match the full line(s) for the field
    pattern = rf'^{field}:\s*"(?:[^"\\]|\\.)*"\s*$'
    replacement = f'{field}: "{escaped}"'
    result = re.sub(pattern, replacement, frontmatter, count=1, flags=re.MULTILINE)
    if result == frontmatter:
        # Try single quotes
        pattern = rf"^{field}:\s*'(?:[^'\\]|\\.)*'\s*$"
        result = re.sub(pattern, replacement, frontmatter, count=1, flags=re.MULTILINE)
    return result


def make_short_description(title, description):
    """Create a concise ~155 char description from a bloated one."""
    # Strategy: use first sentence(s) up to ~160 chars
    # First, try to extract meaningful opening sentences
    sentences = re.split(r'(?<=[.!?])\s+', description)

    # Build up from sentences
    result = ""
    for sent in sentences:
        if not result:
            result = sent
        elif len(result) + 1 + len(sent) <= 180:
            result = result + " " + sent
        else:
            break

    # If first sentence alone is too long, truncate at a word boundary
    if len(result) > 200:
        # Find a good break point
        truncated = result[:180]
        # Break at last space
        last_space = truncated.rfind(' ')
        if last_space > 100:
            result = truncated[:last_space]
        else:
            result = truncated
        # Clean up trailing punctuation fragments
        result = result.rstrip(' ,;:—-')
        # Don't end with an opening paren or quote
        result = result.rstrip('(["\'')
        result = result.rstrip(' ')

    # Clean up: remove "We reviewed" / server listing patterns that are too detailed
    # Keep it readable
    return result


def process_file(filepath):
    """Process a single markdown file. Returns (changed, old_len, new_len) or None."""
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()

    frontmatter, body = extract_frontmatter(content)
    if frontmatter is None:
        return None

    description = get_field(frontmatter, 'description')
    if description is None:
        return None

    if len(description) <= 200:
        return None

    title = get_field(frontmatter, 'title') or ""
    old_len = len(description)

    new_desc = make_short_description(title, description)
    new_len = len(new_desc)

    if new_len >= old_len:
        return None

    new_frontmatter = set_field(frontmatter, 'description', new_desc)
    if new_frontmatter == frontmatter:
        return None

    new_content = f"---\n{new_frontmatter}\n---\n{body}"
    with open(filepath, 'w', encoding='utf-8') as f:
        f.write(new_content)

    return (True, old_len, new_len, new_desc)


def main():
    base = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    content_dir = os.path.join(base, 'content')

    files = glob.glob(os.path.join(content_dir, '**', '*.md'), recursive=True)
    files.sort()

    changed = 0
    skipped = 0
    errors = 0

    for filepath in files:
        rel = os.path.relpath(filepath, base)
        try:
            result = process_file(filepath)
            if result is None:
                skipped += 1
                continue
            _, old_len, new_len, new_desc = result
            changed += 1
            print(f"  FIXED {rel}: {old_len} -> {new_len} chars")
            if changed <= 5:
                print(f"    NEW: {new_desc[:100]}...")
        except Exception as e:
            errors += 1
            print(f"  ERROR {rel}: {e}")

    print(f"\nDone: {changed} fixed, {skipped} skipped, {errors} errors")


if __name__ == '__main__':
    main()
