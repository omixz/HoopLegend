# Hoop Legends

A self-contained, single-file HTML5 basketball career & franchise RPG.
No build step, no external assets, no network calls — open `basketball-rpg.html`
in a browser and play.

## What's inside
- **Quick Play**: straight into a game against the CPU, no setup.
- **Tournament**: eight teams, single elimination, every round tougher.
- **1 v 1, 3 v 3 or 5 v 5** for Quick Play, Tournament and Versus.
- **Locker + coins**: earn coins in every mode and unlock star players (each
  with their own ratings), ball skins and shoes. No purchases, everything is
  earned by playing. Three **daily challenges** pay bonus coins.
- **3-Point Contest**: five racks in sixty seconds, money balls worth two,
  best score saved.
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
- Five courts to pick from the title screen: Pro Arena, Blacktop, Beach,
  Old Gym and Rooftop (or Random).
- Ball physics: true parabolic shots to an elevated rim, rim and backboard
  bounces, physical passes that lead the receiver, and out-of-bounds calls.
- Settings (quarter length, screen shake, coaching tips), first-game coaching
  tips, and gamepad support (two pads for Versus).
- Retro pixel-sprite rendering, an original synthesized 8-bit soundtrack/SFX
  (Web Audio API, no audio files), difficulty levels, and touch controls that
  auto-appear on phones/tablets.

## Publishing
Ready-to-upload files are in `release/` (Poki, CrazyGames and itch.io zips plus
store art). Live build: https://hoop-legends-nine.vercel.app

Run `web/make-portal-build.sh` to get upload-ready zips for itch.io, Poki and
CrazyGames (the right SDK script is added for each), plus store art in
`web/assets/`. See `web/README.md` for what the SDK integration does and how to
submit. A lightweight Tauri v2 wrapper for Steam/desktop lives in `desktop/`.

Everything (art, music, names, teams) is original and safe for commercial
distribution.
