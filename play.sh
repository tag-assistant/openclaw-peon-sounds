#!/bin/bash
# Play a peon sound by category
# Usage: play.sh <greeting|complete|permission|error|warcry>

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOUND_DIR="$SCRIPT_DIR/sounds"

if [ ! -d "$SOUND_DIR" ]; then
  echo "Sounds not installed. Run: bash $SCRIPT_DIR/install.sh" >&2
  exit 1
fi

case "$1" in
  greeting|ready)
    afplay "$SOUND_DIR/ready.ogg" &
    ;;
  complete|done|acknowledge)
    files=("$SOUND_DIR"/acknowledge*.ogg)
    afplay "${files[RANDOM % ${#files[@]}]}" &
    ;;
  permission|input|waiting)
    files=("$SOUND_DIR"/permission*.ogg)
    afplay "${files[RANDOM % ${#files[@]}]}" &
    ;;
  error|fail)
    files=("$SOUND_DIR"/error*.ogg)
    afplay "${files[RANDOM % ${#files[@]}]}" &
    ;;
  warcry|hype)
    afplay "$SOUND_DIR/warcry.ogg" &
    ;;
  *)
    echo "Usage: play.sh {greeting|complete|permission|error|warcry}" >&2
    exit 1
    ;;
esac
