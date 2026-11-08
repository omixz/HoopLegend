# Hoop Legends — publishing to web portals

The whole game is one self-contained file, `../basketball-rpg.html`: no build
step, no assets to host, no network calls. Portals just need it as `index.html`.

## Build the upload packages

```
./make-portal-build.sh
```

Produces (in `release/` at the repo root, committed):

| Package | What's inside | Upload to |
|---|---|---|
| `hoop-legends-itch.zip` | plain `index.html` | itch.io ("played in the browser") |
| `hoop-legends-poki.zip` | `index.html` + Poki SDK v2 script tag | Poki for Developers |
| `hoop-legends-crazygames.zip` | `index.html` + CrazyGames SDK v3 script tag | CrazyGames Developer Portal |

Store art is in `web/assets/` (copied to `release/store-art/`): `cover-1280x720.png`, `thumb-512x512.png`,
`icon-256x256.png` and three 1280x720 screenshots (Pro Arena, Blacktop, Beach).

## What the game already does for portals

The `Platform` shim in the game detects whichever SDK is on the page and is a
no-op when none is, so one source file works everywhere.

- **Loading**: `PokiSDK.init()` → `gameLoadingFinished()`; on CrazyGames
  `SDK.init()` → `game.loadingStart()` / `loadingStop()`.
- **Gameplay events**: `gameplayStart()` when a game tips off or resumes from
  pause; `gameplayStop()` on pause, tab hidden, quit, ad break and game end.
  Calls are de-duplicated so the SDK never sees two starts in a row.
- **Ad breaks**: a `commercialBreak()` / `requestAd('midgame')` runs before every
  tip-off except the very first one of the session (natural break between games;
  the portals rate-limit on top of that).
- **Rewarded ads**: in My Journey the hub shows "Watch ad: +2 SP" (once per game)
  only when a portal SDK is present. The reward is only granted when the SDK
  reports the ad completed.
- **Audio**: all sound (music + effects) is muted while an ad plays, separately
  from the player's own mute setting.
- **Happy time** (CrazyGames): fired on a title, a Quick Play win and a new
  3-Point Contest best.
- **No `prompt()` / `alert()`**: saves use an in-page slot picker.
- **No page scrolling** from Space / arrow keys inside the iframe.
- **Mobile**: on-screen joystick + Shoot / Pass / Special appear on touch
  devices; in portrait the game pauses and asks the player to rotate.
- **Persistence**: `localStorage` only, wrapped in try/catch so blocked storage
  never breaks the game.

Tested with a mock Poki SDK: the call order is
`init → gameLoadingFinished → gameplayStart → … → gameplayStop → commercialBreak → gameplayStart`.

## Submitting

**Poki** (poki.com/developers): Poki reviews every game before release and
needs your developer account. Create a game in Poki for Developers, upload
`hoop-legends-poki.zip`, and use their QA tool (Poki Inspector) to check the SDK
events. Suggested listing:
- Title: *Hoop Legends*
- Category: Sports / Basketball
- Controls: WASD / arrows move, Shift sprint, Space shoot (hold and release),
  X pass / steal, C special, Esc pause. Touch and gamepad supported.
- Orientation: landscape. Embed size 960x540 (16:9; the canvas scales).

**CrazyGames** (developer.crazygames.com): upload `hoop-legends-crazygames.zip`
as an HTML5 game, 16:9. Their QA runs the SDK in "local" mode first. The
implementation follows their v3 requirements: no midgame ad before the first
game, gameplay start/stop, audio muted during ads.

**itch.io**: upload `hoop-legends-itch.zip`, kind of project *HTML*, tick
"This file will be played in the browser", embed size 1280x720, enable the
fullscreen button and "Mobile friendly" (landscape).

## Notes

- All art, music, team names and players are original, so the game is safe for
  commercial distribution.
- `?debug` in the URL exposes a read-only test hook (`window.__HL`) used by the
  automated tests. It is inert unless that query string is present.
