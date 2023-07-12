# flaticon_downloader

[![pub package](https://img.shields.io/pub/v/flaticon_downloader.svg?logo=dart&logoColor=00b9fc)](https://pub.dev/packages/flaticon_downloader)
[![Last Commits](https://img.shields.io/github/last-commit/thitlwincoder/flaticon_downloader?logo=git&logoColor=white)](https://github.com/thitlwincoder/flaticon_downloader/commits/main)
[![GitHub repo size](https://img.shields.io/github/repo-size/thitlwincoder/flaticon_downloader)](https://github.com/thitlwincoder/flaticon_downloader)
[![License](https://img.shields.io/github/license/thitlwincoder/flaticon_downloader?logo=open-source-initiative&logoColor=green)](https://github.com/thitlwincoder/flaticon_downloader/blob/master/LICENSE)
<br>
[![Uploaded By](https://img.shields.io/badge/uploaded%20by-thitlwincoder-blue)](https://github.com/thitlwincoder)

Dart package for download Flaticon Image & Photo.

## Getting Started

In the `pubspec.yaml` of your flutter project, add the following dependency:

```yaml
dependencies:
  ...
  flaticon_downloader: ^0.0.1
```

Next we need to install this

```sh
# Dart
pub get

# Flutter
flutter packages get
```

In your library add the following import:

```dart
import 'package:flaticon_downloader/flaticon_downloader.dart';
```
## Usage


```dart

<!-- single quality -->
var result = await FlatIconDownloader.get('url'); // add your url

<!-- multiple quality -->
var multiResult = await FlatIconDownloader.getMulti('url'); // add your url
```

## Contribution

Feel free to file an [issue](https://github.com/thitlwincoder/flaticon_downloader/issues/new) if you find a problem or make pull requests.

All contributions are welcome :)
