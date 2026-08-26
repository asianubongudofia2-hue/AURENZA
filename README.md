cd /Users/builder/clone

if [ ! -f pubspec.yaml ]; then
  echo "ERROR: pubspec.yaml not found"
  exit 1
fi

flutter create --platforms=ios --project-name=aurenza .
test -f ios/Runner.xcodeproj/project.pbxproj
echo "iOS Xcode project created successfully"
flutter pub get
flutter build ios --no-codesign
/Users/builder/clone
/Users/builder/clone/
├── pubspec.yaml
├── lib/
├── ios/
│   ├── Runner/
│   ├── Runner.xcodeproj/
│   └── Runner.xcworkspace/
├── android/
└── web/
ios/Runner.xcodeproj/project.pbxproj
cd /Users/builder/clone
flutter create --platforms=ios --project-name=aurenza .
test -f ios/Runner.xcodeproj/project.pbxproj
flutter pub get
flutter build ios --no-codesign
cd /Users/builder/clone
flutter create --platforms=android,ios,web --project-name=aurenza .
flutter pub get
flutter build apk --debug
flutter build web
flutter build ios --no-codesign
flutter build ios --no-codesign
cd "$CM_BUILD_DIR"
✓ Built ...app-debug.apk
flutter create --platforms=android,ios,web --project-name=aurenza .

echo "=== Checking generated platforms ==="
test -d android && echo "Android: OK"
test -f ios/Runner.xcodeproj/project.pbxproj && echo "iOS Xcode project: OK"
test -d web && echo "Web: OK"

flutter pub get
flutter build apk --debug
flutter build web
Android: OK
iOS Xcode project: OK
Web: OK
