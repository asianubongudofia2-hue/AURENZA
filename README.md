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