#!/bin/bash
# Homebrew maintenance for this machine. Nothing to do with the project.
#
# Split out of `pnpm dev -u`, where upgrading system packages was a side effect
# of starting a dev server — and could swap ImageMagick out from under
# src/management/uploader/handleImage.mjs mid-session.
#
# Project dependencies are NOT touched here; those arrive as Dependabot PRs.
#
#   ./scripts/update-mac.sh          # show what would change
#   ./scripts/update-mac.sh --apply  # actually upgrade

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

if ! command -v brew &> /dev/null; then
  echo -e "${YELLOW}Homebrew not installed — nothing to do.${NC}"
  exit 0
fi

echo -e "${GREEN}🔄 Refreshing Homebrew...${NC}"
brew update

if [[ "$1" != "--apply" ]]; then
  echo
  echo -e "${GREEN}📋 Outdated formulae:${NC}"
  brew outdated || true
  echo
  echo -e "${YELLOW}Dry run. Re-run with --apply to upgrade.${NC}"
  echo -e "${YELLOW}Note: imagemagick is required by the media uploader —${NC}"
  echo -e "${YELLOW}verify 'magick -version' afterwards if it upgrades.${NC}"
  exit 0
fi

echo -e "${GREEN}⬆️  Upgrading...${NC}"
brew upgrade
brew cleanup
brew autoremove

# The uploader shells out to `magick`; a bad upgrade should be loud, not
# discovered later mid-ingest.
if command -v magick &> /dev/null; then
  echo -e "${GREEN}✅ $(magick -version | head -1)${NC}"
else
  echo -e "${YELLOW}⚠️  'magick' is gone — 'pnpm manage handle-media' will fail.${NC}"
  echo -e "${YELLOW}   Reinstall with: brew install imagemagick${NC}"
fi
