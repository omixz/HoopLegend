# Hoop Legends

A self-contained, single-file HTML5 basketball career & franchise RPG.
No build step, no external assets, no network calls — open `basketball-rpg.html`
in a browser and play.

## What's inside
- **My Journey**: create a player (position, height, attributes, skin tone,
  hair, jersey number), get drafted by a fictional franchise, and chase a
  championship across a 3-round playoff bracket.
- **Franchise HQ**: run a full season for any of 7 fictional teams —
  standings, sim or play games, trades (including tradeable future draft
  picks), an end-of-season rookie draft, and player development/retirement.
- **Local 2-player versus** on one keyboard.
- Save/load with 3 manual slots plus an autosave after every game ("Continue"
  on the main menu). No `prompt()`/`alert()` dialogs, so it works inside
  portal iframes.
- Retro pixel-sprite rendering, an original synthesized 8-bit soundtrack/SFX
  (Web Audio API, no audio files), difficulty levels, and touch controls that
  auto-appear on phones/tablets.

## Publishing
- **itch.io**: run `web/make-itch-build.sh`, upload the resulting
  `web/hoop-legends-web.zip`, mark it "played in the browser". See
  `web/README.md`.
- **Poki / CrazyGames**: SDK hooks are already wired via a no-op-safe
  `Platform` shim; see `web/README.md` for the script tag to add.
- **Steam / desktop**: a lightweight Tauri v2 wrapper lives in `desktop/`;
  see `desktop/README.md`.

Everything (art, music, names, teams) is original and safe for commercial
distribution.
