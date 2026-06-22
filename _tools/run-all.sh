#!/usr/bin/env bash
# run-all.sh - Run all validation checks
# Exit 0: all checks pass
# Exit 1: any check fails

set -uo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VAULT_PATH="${1:-.}"

cd "$VAULT_PATH" || { echo "Error: Cannot access $VAULT_PATH" >&2; exit 2; }

echo "=========================================="
echo "Hermes Vault Validation Suite"
echo "Vault: $(pwd)"
echo "Time: $(date)"
echo "=========================================="
echo ""

FAILED=0

# Run wikilinks check
echo ">>> Checking wikilinks..."
if "$SCRIPT_DIR/check-wikilinks.sh" "$VAULT_PATH"; then
    echo ""
else
    FAILED=1
    echo ""
fi

# Run source manifest check
echo ">>> Checking SOURCE-MANIFEST..."
if "$SCRIPT_DIR/check-source-manifest.sh" check "$VAULT_PATH"; then
    echo ""
else
    FAILED=1
    echo ""
fi

# Run secrets check
echo ">>> Checking for secrets..."
if "$SCRIPT_DIR/check-secrets.sh" "$VAULT_PATH"; then
    echo ""
else
    FAILED=1
    echo ""
fi

echo "=========================================="
if [[ $FAILED -eq 0 ]]; then
    echo "✓ All validation checks passed"
else
    echo "✗ Some validation checks failed — review output above"
fi
echo "=========================================="

exit $FAILED
