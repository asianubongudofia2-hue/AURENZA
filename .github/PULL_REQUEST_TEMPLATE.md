# Pull request template

## What this PR does

Adds Flutter project scaffold (pubspec.yaml, lib/main.dart), generated platform helpers, and Codemagic CI workflows to build Android (APK/AAB), iOS (unsigned IPA), and Web artifacts.

## How to test

1. Checkout the branch: git checkout setup/codemagic-build
2. Run: ./scripts/regenerate-platforms.sh
3. Run: flutter pub get
4. Build locally: flutter build apk --release / flutter build web --release

## Codemagic setup

- Connect this repo to Codemagic and enable the `setup/codemagic-build` branch.
- Upload Android keystore (or set ANDROID_KEYSTORE_BASE64) and set KEYSTORE_PASSWORD, KEY_ALIAS, KEY_PASSWORD.
- Upload iOS distribution certificate and provisioning profile or configure App Store Connect API key.
- (Optional) Add GOOGLE_PLAY_SERVICE_ACCOUNT_JSON (base64) for Play Store publishing and FIREBASE_TOKEN for Firebase Hosting/App Distribution.

## Notes

This PR regenerates platform folders. If you have custom native changes, they were backed up to android.bak, ios.bak, web.bak in this branch.
