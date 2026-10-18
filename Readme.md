# KinoPub Roku Channel

KinoPub Roku Channel is a small SceneGraph app for browsing and watching KinoPub content on Roku. It includes authentication, home/search views, video details, playback progress, subtitles, audio track selection, and a custom player UI.

This is a developer build meant to be packaged and sideloaded on a Roku device.

## Installation

### 1. Prepare KinoAPI credentials

Copy the example config:

```bash
cp config/kinoapi.example.json config/kinoapi.local.json
```

Edit `config/kinoapi.local.json` and replace the placeholder values:

```json
{
  "client_id": "your-client-id",
  "client_secret": "your-client-secret"
}
```

### 2. Build the Roku package

Run:

```bash
./scripts/package.sh
```

The script generates `source/config/KinoConfig.brs` from your local config and creates:

```text
dist/kinopub.zip
```

The package embeds a display version in the form `0.0.1-abcdef0`. Override the
local defaults with `APP_VERSION`, `APP_SHA`, and `PACKAGE_NAME`.

### 3. Sideload on Roku

1. Enable Developer Mode on your Roku device.
2. Open the Roku developer installer in a browser:

```text
http://<roku-ip-address>
```

3. Upload `dist/kinopub.zip`.
4. Install and launch the channel.

## Useful Commands

During playback, select **Info** in the player controls and press **OK** to toggle
the playback information panel. It shows resolution, video/audio formats, video-segment bitrate, last-segment
download speed, and playback state. Missing statistics appear as `—`; segment
statistics depend on the stream format and device. **Back** closes the panel first.
Playback continues normally, and the panel starts hidden each time the player opens.

Run the static verification checks:

```bash
./scripts/verify-static.sh
```

Generate only the local BrightScript config:

```bash
./scripts/generate-config.sh
```

Create a fresh package:

```bash
./scripts/package.sh
```

## Notes

The app is built with Roku SceneGraph and BrightScript. There is no dependency install step; the only local requirements are a shell, `python3`, and `zip`.

## Current device settings

Open **Account** to see compact profile and subscription details above the current
device settings. Use the arrows to move between the two columns and **OK** to
toggle SSL, HEVC, HDR, 4K, or mixed AVC/HEVC playlists. For server region and
streaming type, press **OK**, choose with Left/Right, then **OK** to save or
**Back** to cancel. Available settings and list options come from KinoAPI.
Changes save immediately to the current device; failed saves keep the previous
value. **Back** returns to the sidebar. Device settings affect subsequent playback.

## Appearance

Open **Settings** in the sidebar and press **OK** on **Light theme** to switch
between dark and light appearance. The light palette uses warm backgrounds and
teal accents across every screen, including player controls and dialogs.
The change applies immediately and is saved on this device. Dark is the default;
automatic theme selection is not enabled.

## Next episode settings

Open **Settings** in the sidebar to change when the next-episode button appears.
The defaults are 90 seconds and 4% remaining; both enabled limits must be met.
Set a limit to 0 to disable it, or both to 0 to show the button only after playback ends.
Press OK to edit, Left/Right to adjust by 1, or Rewind/Fast forward to adjust by 10.
The **Start a 15-second auto-play timer** checkbox is off by default. Enable it
to play the next episode 15 seconds after the card appears. Keep watching cancels
the timer. With the checkbox off, the card waits for your choice even after the
video ends. Press OK on the checkbox to toggle it.
Values save automatically on this device; previously saved thresholds are preserved.
