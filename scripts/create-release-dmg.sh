#!/bin/bash
set -euo pipefail

APP="${1:-$RUNNER_TEMP/export/StandLock.app}"
STAGE=$(mktemp -d)

ditto "$APP" "$STAGE/StandLock.app"
ln -s /Applications "$STAGE/Applications"
hdiutil create -volname StandLock -srcfolder "$STAGE" -fs HFS+ -format UDZO -ov "StandLock-${VERSION}.dmg"
