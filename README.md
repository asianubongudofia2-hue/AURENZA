# AURENZA

A modern, multi-platform application built with Flutter for mobile and web, with Next.js web components.

## 📋 Overview

AURENZA is a cross-platform application designed to provide a seamless experience across Android, iOS, and Web platforms. The project utilizes Flutter for native app development and Next.js for web-based interfaces.

## 🎯 Features

- **Multi-platform Support**: Android, iOS, and Web
- **Modern UI/UX**: Built with Flutter Material Design
- **Responsive Design**: Web interface using Next.js and React
- **CI/CD Pipeline**: Automated builds with Codemagic
- **Code Signing**: Support for Android and iOS signing
- **Publishing Ready**: Configured for Google Play, App Store, and Firebase

## 🛠️ Tech Stack

- **Mobile**: Flutter (Dart)
- **Web**: Next.js, React, TypeScript
- **CI/CD**: Codemagic
- **Build Tools**: Gradle (Android), Xcode (iOS)
- **Package Manager**: npm, pub

## 📁 Project Structure

```
AURENZA/
├── lib/                    # Flutter app source code
├── android/               # Android native configuration
├── ios/                   # iOS native configuration
├── web/                   # Web platform files
├── pubspec.yaml          # Flutter dependencies
├── codemagic.yaml        # CI/CD configuration
├── README.md             # This file
├── SECURITY.md           # Security policy
└── scripts/              # Build and utility scripts
```

## ⚡ Quick Start

### Prerequisites
- Flutter SDK (stable channel)
- Dart SDK
- Android Studio / Xcode (for native development)
- Node.js (for web development)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/asianubongudofia2-hue/AURENZA.git
cd AURENZA
```

2. **Install Flutter dependencies**
```bash
flutter pub get
```

3. **Generate platform files (if missing)**
```bash
flutter create --platforms=android,ios,web .
```

### Building

#### Android
```bash
# Debug APK
flutter build apk --debug

# Release APK
flutter build apk --release

# App Bundle (AAB) for Google Play
flutter build appbundle --release
```

#### iOS
```bash
# Unsigned build (for development)
flutter build ios --no-codesign

# Release build (requires signing)
flutter build ios --release
```

#### Web
```bash
flutter build web --release
```

### Running

```bash
# Run on connected device/emulator
flutter run

# Run on web
flutter run -d chrome
```

## 🔧 Configuration

### Codemagic CI/CD

The project includes a comprehensive `codemagic.yaml` configuration for automated builds. 

**Workflows:**
- **Android**: Builds APK and AAB with optional signing and Google Play publishing
- **iOS**: Builds unsigned IPA (requires Codemagic code signing setup)
- **Web**: Builds web assets with optional Firebase Hosting deployment

**To configure in Codemagic UI, set these variables:**

**Android Signing:**
- `KEYSTORE_PASSWORD` - Keystore password
- `KEY_ALIAS` - Key alias name
- `KEY_PASSWORD` - Key password
- `ANDROID_KEYSTORE_BASE64` - Base64-encoded keystore (alternative)

**Publishing (Optional):**
- `GOOGLE_PLAY_SERVICE_ACCOUNT_JSON` - Base64-encoded Google Play service account
- `FIREBASE_TOKEN` - Firebase CLI token for web hosting

**iOS Signing:**
- Upload distribution certificate and provisioning profile in Codemagic UI
- Or configure App Store Connect API credentials

## 📚 Documentation

- **[SECURITY.md](./SECURITY.md)** - Security policy and vulnerability reporting
- **[ARCHITECTURE.md](./ARCHITECTURE.md)** - System architecture and design decisions
- **[DEPLOYMENT.md](./DEPLOYMENT.md)** - Deployment procedures

## 🚀 Deployment

### Google Play Store
Publishing is configured in `codemagic.yaml` via fastlane. Requires:
- Google Play service account JSON
- Keystore file with signing credentials

### App Store
iOS deployment requires:
- Apple Developer account
- Distribution certificate
- App Store provisioning profile

### Firebase Hosting (Web)
Web assets can be automatically deployed to Firebase Hosting using:
- Firebase token in environment variables
- Firebase CLI configuration

## 🤝 Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines on:
- Code style and standards
- Pull request process
- Development workflow

## 🔐 Security

Please refer to [SECURITY.md](./SECURITY.md) for:
- Supported versions
- Security vulnerability reporting
- Responsible disclosure

## 📄 License

[Add your license here]

## 📞 Contact & Support

For issues, feature requests, or questions:
- Open an issue on GitHub
- See [SECURITY.md](./SECURITY.md) for security concerns

## 🗺️ Roadmap

- [ ] Complete Flutter app implementation
- [ ] Integrate Next.js web components
- [ ] Setup Android signing and publishing
- [ ] Setup iOS signing and publishing
- [ ] Configure Firebase Hosting deployment
- [ ] Add comprehensive test suite
- [ ] Documentation completion

---

**Last Updated**: August 26, 2026
