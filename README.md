# AURENZA
Yes. This error is different, and it tells us the previous workaround was placed at the wrong stage.

Failed to install dependencies for pubspec file in /Users/builder/clone.
Directory was not found

Codemagic is trying to run flutter pub get before our script has created the Flutter project/platform files.

Fix the workflow order

In Codemagic, turn off the automatic dependency-install step if the Workflow Editor allows it, and make the first custom script:

cd "$CM_BUILD_DIR"

if [ ! -f pubspec.yaml ]; then
  echo "ERROR: pubspec.yaml not found"
  exit 1
fi

if [ ! -d android ] || [ ! -d ios ] || [ ! -d web ]; then
  flutter create --platforms=android,ios,web --project-name=aurenza .
fi

flutter pub get

Then the build scripts:

flutter build apk --debug

For web:

flutter build web

For iOS, the first validation can be:

flutter build ios --no-codesign

Critical point

The repository must be checked out at:

/Users/builder/clone

and pubspec.yaml must be directly inside it.

We should not run flutter create "$CM_BUILD_DIR" because that can create/overwrite project configuration incorrectly. Running:

cd "$CM_BUILD_DIR"
flutter create --platforms=android,ios,web --project-name=aurenza .

is the safer approach because it generates the missing platform folders inside the existing Flutter project.

After changing the workflow, start a fresh Codemagic build. The first important output should be:

flutter create --platforms=android,ios,web --project-name=aurenza .

followed by:

flutter pub get

and then:

flutter build apk --debug

Don't trigger the webhook again until this workflow is corrected.
Atlas-Funded/
├── lib/
├── pubspec.yaml
└── android/
    ├── app/
    ├── gradle/
    ├── build.gradle / settings.gradle
    └── gradle.propertiesbuild/app/outputs/flutter-apk/app-debug.apk== Build Android APK ==
> flutter build apk --debug
...
✓ Built build/app/outputs/flutter-apk/app-debug.apkhttps://github.com/asianubongudofia2-hue/Atlas-Funded/tmp/build_script_7_1_v8u90blv: line 3: workflows:: command not found
/tmp/build_script_7_1_v8u90blv: line 4: android-apk:: command not found
/tmp/build_script_7_1_v8u90blv: line 5: name:: command not found
/tmp/build_script_7_1_v8u90blv: line 6: environment:: command not found
/tmp/build_script_7_1_v8u90blv: line 7: flutter:: command not found
/tmp/build_script_7_1_v8u90blv: line 8: scripts:: command not found
/tmp/build_script_7_1_v8u90blv: line 9: -: command not found
/tmp/build_script_7_1_v8u90blv: line 10: script:: command not found
/tmp/build_script_7_1_v8u90blv: line 11: -: command not found
/tmp/build_script_7_1_v8u90blv: line 12: script:: command not found
/tmp/build_script_7_1_v8u90blv: line 13: artifacts:: command not found
/tmp/build_script_7_1_v8u90blv: line 14: -: command not foundhe build steps for details.
Preparing build machine
13s
Fetching app sources
1s
Installing SDKs
1m 6s
Installing dependencies
10s



== Install Flutter dependencies ==
> flutter pub get
Resolving dependencies...
Downloading packages...
+ async 2.13.1
+ boolean_selector 2.1.2
+ characters 1.4.1
+ clock 1.1.2
+ collection 1.19.1
+ cupertino_icons 1.0.9
+ fake_async 1.3.3
+ flutter 0.0.0 from sdk flutter
+ flutter_test 0.0.0 from sdk flutter
+ leak_tracker 11.0.2
+ leak_tracker_flutter_testing 3.0.10
+ leak_tracker_testing 3.0.2
+ matcher 0.12.20
+ material_color_utilities 0.13.0 (0.13.1 available)
+ meta 1.19.0
+ path 1.9.1
+ sky_engine 0.0.0 from sdk flutter
+ source_span 1.10.2
+ stack_trace 1.12.1
+ stream_channel 2.1.4
+ string_scanner 1.4.1
+ term_glyph 1.2.2
+ test_api 0.7.12 (0.7.13 available)
+ vector_math 2.4.2
+ vm_service 15.3.0
Changed 25 dependencies!
2 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.


Build failed :|
The "android" directory does not exist or is not a directory.workflows:
  android-apk:
    name: AURENZA Android APK
    environment:
      flutter: stable
    scripts:
      - name: Install dependencies
        script: flutter pub get
      - name: Build Android APK
        script: flutter build apk --debug
    artifacts:
      - build/app/outputs/flutter-apk/*.apk# Autolinked references and URLs

References to URLs, issues, pull requests, and commits are automatically shortened and converted into links.

## URLs

GitHub automatically creates links from standard URLs.

`Visit https://github.com`

![Screenshot of rendered GitHub Markdown showing how a URL is displayed as a blue clickable link, "Visit https://github.com."](/assets/images/help/writing/url-autolink-rendered.png)

For more information on creating links, see [Basic writing and formatting syntax](/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax#links).

## Issues and pull requests

Within conversations on GitHub, references to issues and pull requests are automatically converted to shortened links.

> \[!NOTE]
> Autolinked references are not created in wikis or files in a repository.

| Reference type                                                   | Raw reference                                    | Short link                                                                             |
| ---------------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------------------------------- |
| Issue or pull request URL                                        | <https://github.com/jlord/sheetsee.js/issues/26> | [#26](https://github.com/jlord/sheetsee.js/issues/26)                                  |
| `#` and issue or pull request number                             | #26                                              | [#26](https://github.com/jlord/sheetsee.js/issues/26)                                  |
| `GH-` and issue or pull request number                           | GH-26                                            | [GH-26](https://github.com/jlord/sheetsee.js/issues/26)                                |
| `Username/Repository#` and issue or pull request number          | jlord/sheetsee.js#26                             | [jlord/sheetsee.js#26](https://github.com/jlord/sheetsee.js/issues/26)                 |
| `Organization_name/Repository#` and issue or pull request number | github-linguist/linguist#4039                    | [github-linguist/linguist#4039](https://github.com/github-linguist/linguist/pull/4039) |

If you reference an issue, pull request, or discussion in a list, the reference will unfurl to show the title and state instead. For more information about task lists, see [About tasklists](/en/get-started/writing-on-github/working-with-advanced-formatting/about-tasklists).

## Labels

When referencing the URL of a label in Markdown, the label is automatically rendered. Only labels of the same repository are rendered, URLs pointing to a label from a different repository are rendered as any [URL](/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls#urls).

The URL of a label can be found by navigating to the labels page and clicking on a label. For example, the URL of the label "enhancement" in our public [docs repository](https://github.com/github/docs/) is

```markdown
https://github.com/github/docs/labels/enhancement
```

> \[!NOTE]
> If the label name contains a period (`.`), the label will not automatically render from the label URL.

## Commit SHAs

References to a commit's SHA hash are automatically converted into shortened links to the commit on GitHub.

| Reference type            | Raw reference                                                                                                                                                                  | Short link                                                                                                          |
| ------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------- |
| Commit URL                | [`https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e`](https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e) | [a5c3785](https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e)                     |
| SHA                       | a5c3785ed8d6a35868bc169f07e40e889087fd2e                                                                                                                                       | [a5c3785](https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e)                     |
| User\@SHA                 | jlord\@a5c3785ed8d6a35868bc169f07e40e889087fd2e                                                                                                                                | [jlord@a5c3785](https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e)               |
| `Username/Repository@SHA` | `jlord/sheetsee.js@a5c3785ed8d6a35868bc169f07e40e889087fd2e`                                                                                                                   | [`jlord/sheetsee.js@a5c3785`](https://github.com/jlord/sheetsee.js/commit/a5c3785ed8d6a35868bc169f07e40e889087fd2e) |

### Troubleshooting referencing commit SHAs

When referencing a commit from a private repository inside of a commit message, the commit SHA will only be shortlinked if at least one of the authors or committers of the commit have at least read access to the referenced commit.

## Custom autolinks to external resources

If custom autolink references are configured for a repository, then references to external resources, like a JIRA issue or Zendesk ticket, convert into shortened links. To know which autolinks are available in your repository, contact someone with admin permissions to the repository. For more information, see [Configuring autolinks to reference external resources](/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/configuring-autolinks-to-reference-external-resources).

## Avoiding backlinks to linked references

By default, references generate a backlink. For example, manually linking to an issue in a pull request will automatically generate another link from the issue *back* to the pull request.
To avoid this behavior, you can use `redirect.github.com` instead of `github.com` when constructing the URL in your reference. If you do use a `redirect.github.com` URL in your reference link, no pop-up window will appear when hovering over it.

> \[!NOTE]
> This method is not supported in GitHub Enterprise Cloud with Data Residency (`ghe.com`).

## Further reading

* [Basic writing and formatting syntax](/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)https://github.com/features/ai/github-app?utm_source=mobile-copilot-app&utm_medium=product&utm_campaign=github-app-cli-Q1-push[![Codemagic build status](https://api.codemagic.io/apps/6a8e6a6e08922203dcd7b75f/6a8e6a6e08922203dcd7b75e/status_badge.svg)](https://codemagic.io/app/6a8e6a6e08922203dcd7b75f/6a8e6a6e08922203dcd7b75e/latest_build)
