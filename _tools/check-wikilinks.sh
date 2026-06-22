#!/usr/bin/env bash
# check-wikilinks.sh - Find broken wikilinks in markdown files
# Exit 0: all links valid
# Exit 1: broken links found

set -uo pipefail

VAULT_PATH="${1:-.}"

cd "$VAULT_PATH" || { echo "Error: Cannot access $VAULT_PATH" >&2; exit 2; }

# Find all markdown files
mapfile -t MARKDOWN_FILES < <(find . -name "*.md" -not -path "./.git/*" -not -path "./.claud/*" 2>/dev/null)

# Track broken links - use associative array to deduplicate
declare -A BROKEN_LINKS=()

# Extract wikilinks and check if they resolve
for file in "${MARKDOWN_FILES[@]}"; do
    # Skip if file doesn't exist
    [[ -f "$file" ]] || continue
    
    # Extract all wikilinks from the file using grep -o
    # Wikilinks: [[link]] or [[link|display]] or [[link#heading]]
    WIKILINKS=$(grep -oE '\[\[[^\]]+\]\]' "$file" 2>/dev/null || true)
    
    # Process each wikilink
    for wlink in $WIKILINKS; do
        # Strip the [[ and ]] brackets
        link_content="${wlink:2:-2}"
        
        # Remove display text after pipe
        link_target="${link_content%%|*}"
        
        # Remove heading reference
        link_target="${link_target%%#*}"
        
        # Skip empty links, anchors, or external links
        [[ -z "$link_target" ]] && continue
        [[ "$link_target" == "#"* ]] && continue
        [[ "$link_target" == "http"* ]] && continue
        
        # Check if the file exists (with .md extension, without, case-insensitive)
        RESOLVED=false
        
        if [[ -f "${link_target}.md" ]] || [[ -f "$link_target" ]]; then
            RESOLVED=true
        else
            # Try case-insensitive search in subdirs
            MATCH=$(find . -maxdepth 3 -iname "${link_target}.md" 2>/dev/null | head -1)
            [[ -n "$MATCH" ]] && RESOLVED=true
        fi
        
        if [[ "$RESOLVED" == "false" ]]; then
            # Store with file:link as key for deduplication
            BROKEN_LINKS["${file}: ${link_target}"]=1
        fi
    done
done

# Report results
if [[ ${#BROKEN_LINKS[@]} -eq 0 ]]; then
    echo "✓ All wikilinks resolve correctly"
    exit 0
else
    echo "✗ Found ${#BROKEN_LINKS[@]} broken wikilinks:"
    for key in "${!BROKEN_LINKS[@]}"; do
        echo "  $key"
    done | sort
    exit 1
fi
