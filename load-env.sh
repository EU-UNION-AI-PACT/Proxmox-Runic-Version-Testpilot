#!/usr/bin/env bash

# ═══════════════════════════════════════════════════════════════════════════
# Environment Loader - Proxmox Runic Scripts
# ═══════════════════════════════════════════════════════════════════════════

# Lade .env Datei
if [ -f .env ]; then
    set -a
    source .env
    set +a
    echo "✅ Environment geladen aus .env"
else
    echo "❌ .env Datei nicht gefunden!"
    exit 1
fi

# Zeige geladene Variablen (ohne Secrets)
echo ""
echo "📋 Geladene Environment-Variablen:"
echo "────────────────────────────────────────────────────────────────"
echo "GitHub User:     $GITHUB_USER"
echo "Repository:      $GITHUB_REPO"
echo "Email:           $GITHUB_EMAIL"
echo "Branch:          $GIT_BRANCH"
echo ""
echo "🌐 URLs:"
echo "Repository:      $REPO_URL"
echo "Pages:           $PAGES_URL"
echo "Runic Viewer:    $RUNIC_VIEWER_URL"
echo ""
echo "🕊️ Mission:       $MISSION_DE"
echo "────────────────────────────────────────────────────────────────"
