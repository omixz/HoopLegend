# Hoop Legends: release files

Everything needed to publish the game. Rebuild with `web/make-portal-build.sh`
after changing `basketball-rpg.html`.

| File | Upload to | Notes |
|---|---|---|
| `hoop-legends-poki.zip` | [Poki for Developers](https://developers.poki.com) | Includes the Poki SDK v2 script tag |
| `hoop-legends-crazygames.zip` | [CrazyGames Developer Portal](https://developer.crazygames.com) | Includes the CrazyGames SDK v3 script tag |
| `hoop-legends-itch.zip` | [itch.io](https://itch.io/game/new) | Plain build, no SDK. Tick "played in the browser" |
| `store-art/cover-1280x720.png` | listing cover / banner | 16:9 |
| `store-art/thumb-512x512.png` | square thumbnail | |
| `store-art/icon-256x256.png` | icon | |
| `store-art/screenshot-*.png` | screenshots | 1280x720 |

The unzipped `index.html` for each portal is next to its zip (`poki/`,
`crazygames/`, `itch/`) if a portal wants the HTML file directly.

Listing basics: title **Hoop Legends**, category Sports / Basketball, landscape,
16:9 (960x540 or larger), keyboard + touch + gamepad. Full submission notes are
in `web/README.md`.

Live build: https://hoop-legends-nine.vercel.app
