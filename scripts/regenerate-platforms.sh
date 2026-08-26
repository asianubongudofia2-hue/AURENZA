// Helper script to (re)generate Flutter platform folders safely.
// Run from the repository root: ./scripts/regenerate-platforms.sh

set -e

if ! command -v flutter >/dev/null 2>&1; then
  echo "Error: flutter command not found. Install Flutter SDK and ensure it's on PATH."
  exit 1
fi

echo "Using Flutter:" 
flutter --version

echo "Running flutter pub get"
flutter pub get

# Regenerate platform folders in-place. This will NOT overwrite existing native files
# unless Flutter decides to. Back up native folders first.
for d in android ios web; do
  if [ -d "$d" ]; then
    echo "Backing up existing $d to ${d}.bak"
    rm -rf "${d}.bak"
    cp -R "$d" "${d}.bak"
  fi
done

# Create project files and platform directories
flutter create .

echo "Done. Platform folders regenerated. If you had custom native changes, review the ${d}.bak folders."

regenerate-platforms.sh
        ↓
android/ + ios/ + web/
        ↓
flutter pub get
        ↓
flutter build apk
        ↓
iOS/Web builds

bash scripts/regenerate-platforms.sh
test -d android
test -f ios/Runner.xcodeproj/project.pbxproj
test -d web
flutter pub get
flutter build apk --debug