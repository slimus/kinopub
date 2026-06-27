#!/usr/bin/env bash
set -euo pipefail

file="components/screens/PlayerScreen.brs"

grep -q 'function handleMenuKey(key as String) as Boolean' "$file"
grep -q 'if key = "back" or key = "left"' "$file"
grep -q 'closeMenu()' "$file"

menu_check_line="$(awk '
  /function onKeyEvent\(key as String, press as Boolean\) as Boolean/ { in_fn=1 }
  in_fn && /if m.menuOpen then return handleMenuKey\(key\)/ { print NR; exit }
  in_fn && /end function/ { in_fn=0 }
' "$file")"

back_exit_line="$(awk '
  /function onKeyEvent\(key as String, press as Boolean\) as Boolean/ { in_fn=1 }
  in_fn && /if key = "back"/ { print NR; exit }
  in_fn && /end function/ { in_fn=0 }
' "$file")"

if [[ -z "$menu_check_line" || -z "$back_exit_line" ]]; then
  echo "Player key handling must include both menu and back handling." >&2
  exit 1
fi

if (( menu_check_line >= back_exit_line )); then
  echo "Open player menus must consume Back before the player exits." >&2
  exit 1
fi
