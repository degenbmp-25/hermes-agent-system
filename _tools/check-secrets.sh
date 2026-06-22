#!/usr/bin/env bash
# check-secrets.sh - Detect potential secret leaks in vault
# Exit 0: no secrets found
# Exit 1: potential secrets detected

set -uo pipefail

VAULT_PATH="${1:-.}"

cd "$VAULT_PATH" || { echo "Error: Cannot access $VAULT_PATH" >&2; exit 2; }

# Initialize associative array for found secrets
declare -A FOUND_SECRETS=()

# Patterns that indicate potential secrets
# These are intentionally broad to catch variations
declare -a SECRET_PATTERNS=(
    # API keys and tokens
    'api[_-]?key["\x27]?[[:space:]]*[:=][[:space:]]*["\x27]?[a-zA-Z0-9_-]{20,}'
    'api[_-]?key["\x27]?[[:space:]]*[:=][[:space:]]*[^[:space:]]{20,}'
    'apikey[[:space:]]*[:=][[:space:]]*[^[:space:]]{20,}'
    'api[_-]?secret'
    'bearer[[:space:]]+[a-zA-Z0-9_-]{20,}'
    'token["\x27]?[[:space:]]*[:=][[:space:]]*["\x27]?[a-zA-Z0-9_-]{20,}'
    'access[_-]?token'
    'auth[_-]?token'
    'secret[_-]?key'
    'private[_-]?key'
    
    # Passwords
    'password["\x27]?[[:space:]]*[:=][[:space:]]*["\x27]?[^[:space:]"'\'']{8,}'
    'passwd'
    'pwd["\x27]?[[:space:]]*[:=]'
    
    # Connection strings
    'connection[_-]?string'
    'mongodb[+]?srv'
    'postgres[://]'
    'mysql[://]'
    'redis[://]'
    'amqp[://]'
    
    # AWS
    'aws[_-]?access[_-]?key[_-]?id'
    'aws[_-]?secret[_-]?access[_-]?key'
    'aws[_-]?session[_-]?token'
    
    # SSH/PGP
    '-----BEGIN[ ](RSA|EC|DSA|OPENSSH)?[ ]?PRIVATE KEY-----'
    '-----BEGIN PGP PRIVATE KEY BLOCK-----'
    
    # Generic high-entropy patterns that look like keys
    '[a-zA-Z0-9_.-]{32,}=+'
    
    # Webhook URLs with tokens
    'https://[^/]*\.com/[^?]*\?[^"\x27]*=[a-zA-Z0-9_-]{20,}'
    'https://[^/]*\.io/[^?]*\?[^"\x27]*=[a-zA-Z0-9_-]{20,}'
    
    # Slack/Discord tokens
    'xox[baprs]-[0-9]{10,}-[0-9]{10,}-[0-9a-zA-Z]{10,}'
    'SK[0-9A-Za-z]{32,}'
)

# Files to skip (binary files, generated content, etc.)
declare -a SKIP_PATTERNS=(
    ".git/"
    ".claud/"
    "_tools/"
    "node_modules/"
    ".png" ".jpg" ".jpeg" ".gif" ".ico"
    ".pdf"
    ".zip" ".tar" ".gz"
)

# Find all markdown and config files
mapfile -t MARKDOWN_FILES < <(find . -type f \( -name "*.md" -o -name "*.yaml" -o -name "*.yml" -o -name "*.json" \) 2>/dev/null)

for file in "${MARKDOWN_FILES[@]}"; do
    # Check if file should be skipped
    skip=false
    for pattern in "${SKIP_PATTERNS[@]}"; do
        if [[ "$file" == *"$pattern"* ]]; then
            skip=true
            break
        fi
    done
    [[ "$skip" == "true" ]] && continue
    
    # Skip if file doesn't exist
    [[ -f "$file" ]] || continue
    
    # Search for secret patterns
    for pattern in "${SECRET_PATTERNS[@]}"; do
        # Use grep to find lines matching the pattern
        matches=$(grep -nE "$pattern" "$file" 2>/dev/null || true)
        
        if [[ -n "$matches" ]]; then
            while IFS= read -r line; do
                [[ -z "$line" ]] && continue
                
                # Extract line number and content
                line_num="${line%%:*}"
                content="${line#*:}"
                
                # Skip if it's a false positive (common false positives)
                # Skip if the line is just describing what a secret looks like
                if [[ "$content" =~ (example|sample|placeholder|replace|your_|fill|inject|set[[:space:]]+your) ]]; then
                    continue
                fi
                
                # Skip comments that are explaining secrets
                if [[ "$content" =~ ^[[:space:]]*# ]]; then
                    continue
                fi
                
                # Redact the actual secret value for display
                redacted=$(echo "$content" | sed -E 's/([a-zA-Z0-9_.-]{20,}=*)/***REDACTED***/g' | sed -E 's/(\*\*\*REDACTED\*\*\*)+/*REDACTED*/g')
                
                key="${file}:${line_num}"
                FOUND_SECRETS["$key"]="$redacted"
            done <<< "$matches"
        fi
    done
done

# Report results
count=0
for _ in "${FOUND_SECRETS[@]+"${FOUND_SECRETS[@]}"}"; do
    ((count++)) || true
done

if [[ $count -eq 0 ]]; then
    echo "✓ No potential secrets detected"
    exit 0
else
    echo "✗ Found $count potential secret(s) — review and redact if needed:"
    for key in "${!FOUND_SECRETS[@]}"; do
        file="${key%%:*}"
        line="${key#*:}"
        echo "  $file:$line"
        echo "    ${FOUND_SECRETS[$key]}"
    done | sort | head -50
    
    if [[ $count -gt 50 ]]; then
        echo "  ... and $((count - 50)) more"
    fi
    
    echo ""
    echo "If these are legitimate values (e.g., placeholders), add them to skip patterns"
    echo "in check-secrets.sh or move them to environment variables."
    exit 1
fi
