cd AURENZA
bash scripts/regenerate-platforms.sh

test -d android
test -f ios/Runner.xcodeproj/project.pbxproj
test -d web
git add android ios web
git commit -m "chore: add Flutter platform projects"
git push origin main
flutter pub get