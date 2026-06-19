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
