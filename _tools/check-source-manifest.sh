#!/usr/bin/env bash
# check-source-manifest.sh - Validate SOURCE-MANIFEST entries
# Usage: check-source-manifest.sh check|add|list-missing [vault-path]
# Exit 0: manifest valid or action completed
# Exit 1: errors found or usage error

set -uo pipefail

VAULT_PATH="${2:-.}"

cd "$VAULT_PATH" || { echo "Error: Cannot access $VAULT_PATH" >&2; exit 2; }

MANIFEST_FILE="SOURCE-MANIFEST.md"

check_manifest() {
    local errors=0
    
    # Check if manifest exists
    if [[ ! -f "$MANIFEST_FILE" ]]; then
        echo "✗ SOURCE-MANIFEST.md not found"
        echo "  Create it with: cp templates/SOURCE-MANIFEST.md ./SOURCE-MANIFEST.md"
        return 1
    fi
    
    echo "Checking SOURCE-MANIFEST.md..."
    
    # Extract paths from manifest (lines that start with - **Path:**)
    while IFS= read -r line; do
        # Extract path from "- **Path:** `path/to/file.md`"
        if [[ "$line" =~ -[[:space:]]+\*\*Path:\*\*[[:space:]]+\`([^\`]+)\` ]]; then
            manifest_path="${BASH_REMATCH[1]}"
            
            # Check if the file exists
            if [[ ! -f "$manifest_path" ]]; then
                echo "✗ Manifest entry references non-existent file: $manifest_path"
                errors=$((errors + 1))
            fi
        fi
    done < "$MANIFEST_FILE"
    
    # Check for common template entries that weren't customized
    if grep -q "## Note Name" "$MANIFEST_FILE" 2>/dev/null; then
        echo "✗ Manifest contains unfilled template placeholder '## Note Name'"
        errors=$((errors + 1))
    fi
    
    if [[ $errors -eq 0 ]]; then
        echo "✓ SOURCE-MANIFEST.md is valid"
        return 0
    else
        echo "✗ Found $errors error(s) in SOURCE-MANIFEST.md"
        return 1
    fi
}

add_entry() {
    local note_path="$1"
    
    if [[ ! -f "$note_path" ]]; then
        echo "Error: File not found: $note_path" >&2
        return 1
    fi
    
    # Extract frontmatter type
    local note_type
    note_type=$(grep -m1 "^type:" "$note_path" 2>/dev/null | sed 's/type:[[:space:]]*//' || echo "unknown")
    
    # Extract date from frontmatter or use today
    local note_date
    note_date=$(grep -m1 "^date:" "$note_path" 2>/dev/null | sed 's/date:[[:space:]]*//' || date +%Y-%m-%d)
    
    # Extract title from first H1 or filename
    local note_title
    note_title=$(grep -m1 "^# " "$note_path" 2>/dev/null | sed 's/^# //' || basename "$note_path" .md)
    
    # Ensure manifest exists
    if [[ ! -f "$MANIFEST_FILE" ]]; then
        echo "Creating $MANIFEST_FILE..."
        cat > "$MANIFEST_FILE" << 'EOF'
# SOURCE-MANIFEST

This file tracks all source-backed notes in the vault. Every entry here represents a note that has been validated and is auditable.

---
EOF
    fi
    
    # Check if entry already exists
    if grep -q "\`$note_path\`" "$MANIFEST_FILE" 2>/dev/null; then
        echo "Entry for '$note_path' already exists in SOURCE-MANIFEST.md"
        return 0
    fi
    
    # Add entry
    cat >> "$MANIFEST_FILE" << EOF

## $note_title

- **Path:** \`$note_path\`
- **Type:** $note_type
- **Source:** [Add source URL or citation]
- **Date:** $note_date
- **Confidence:** medium
- **Last Validated:** $(date +%Y-%m-%d)
EOF
    
    echo "Added entry for '$note_path' to SOURCE-MANIFEST.md"
}

list_missing() {
    # Find all markdown files that should be in manifest
    local all_notes
    all_notes=$(find . -name "*.md" -not -path "./.git/*" -not -path "./.claud/*" -not -path "././*" -not -path "./_*" 2>/dev/null || true)
    
    local missing_count=0
    
    for note in $all_notes; do
        # Skip the manifest itself
        [[ "$note" == "./${MANIFEST_FILE}" ]] && continue
        
        # Check if it's in the manifest
        if ! grep -q "\`$note\`" "$MANIFEST_FILE" 2>/dev/null; then
            # Check if it has frontmatter (is a structured note)
            if grep -q "^---" "$note" 2>/dev/null; then
                echo "Missing: $note"
                missing_count=$((missing_count + 1))
            fi
        fi
    done
    
    if [[ $missing_count -eq 0 ]]; then
        echo "✓ All structured notes are in SOURCE-MANIFEST.md"
        return 0
    else
        echo "Found $missing_count note(s) missing from SOURCE-MANIFEST.md"
        return 1
    fi
}

# Main
case "${1:-check}" in
    check)
        check_manifest
        ;;
    add)
        if [[ -z "${2:-}" ]]; then
            echo "Usage: $0 add <note-path>" >&2
            exit 2
        fi
        add_entry "$2"
        ;;
    list-missing)
        list_missing
        ;;
    *)
        echo "Usage: $0 check|add|list-missing [vault-path]" >&2
        exit 2
        ;;
esac
