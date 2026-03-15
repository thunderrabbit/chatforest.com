#!/usr/bin/env python3
"""Add standardized LLM attribution byline to all review files.

Appends the approved line:
  *This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*

Skips files that already contain this line.
"""

import os
import glob

REVIEWS_DIR = "/home/grove/chatforest.com/content/reviews"
BYLINE = "*This review was last edited on 2026-03-16 using Claude Opus 4.6 (Anthropic).*"
BYLINE_MARKER = "last edited on"  # detect if already present

def process_file(filepath):
    with open(filepath, "r") as f:
        content = f.read()

    # Skip if byline already present
    if BYLINE_MARKER in content:
        return "skipped"

    # Strip trailing whitespace/newlines, then append byline
    content = content.rstrip("\n")
    content += "\n\n" + BYLINE + "\n"

    with open(filepath, "w") as f:
        f.write(content)

    return "updated"

def main():
    files = sorted(glob.glob(os.path.join(REVIEWS_DIR, "*.md")))
    updated = 0
    skipped = 0

    for f in files:
        result = process_file(f)
        if result == "updated":
            updated += 1
        else:
            skipped += 1

    print(f"Total files: {len(files)}")
    print(f"Updated: {updated}")
    print(f"Skipped (already had byline): {skipped}")

if __name__ == "__main__":
    main()
