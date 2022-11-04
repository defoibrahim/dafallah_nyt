# dafallah_nyt (NY Times )
## (New York Times Most Viewed Article)

A Flutter app showcasing a list of popular articles from [**New York Times**](https://www.nytimes.com/trending/).

So the application "Architect your Flutter project using BLoC pattern" is complete.

---

## Getting Started

### Requirement

Here are some things you need to prepare before this project setup:

1. Flutter SDK Stable (Latest Version) [Install](https://flutter.dev/docs/get-started/install)
2. Android Studio [Install](https://developer.android.com/studio)
3. Visual Studio Code (Optional) [Install](https://code.visualstudio.com/)
4. Extension **Dart** and **Flutter**:
   - **Intellij Platform** ([Dart](https://plugins.jetbrains.com/plugin/6351-dart), [Flutter](https://plugins.jetbrains.com/plugin/9212-flutter))
   - **Visual Studio Code** ([Dart](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code), [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter))

### Setup

Here are the steps for setting up this Project:

**Step 1:**

In this step you need to download(cloning) the files from this repository to your local computer:

```bash
git clone https://github.com/defoibrahim/dafallah_nyt.git
```

Or

```bash
git clone git@github.com:defoibrahim/dafallah_nyt.git
```

**Step 2:**

The next step is to open the folder that has been downloaded / cloned into a cli application such as `bash`, `cmd`, `terminal` .

And then run this command to console:

```bash
flutter pub get
```

**Step 3:**

To run this code use command:

```bash
flutter run
```

**Step 4:**

To test the app use command:

```bash
flutter test
```

---
## Installation

### 1. Depend on It
Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  # Bloc for state management
  flutter_bloc: ^8.1.1
  # Service locator
  get_it: ^7.2.0
  # Value equality
  equatable: ^2.0.5
  # Functional programming
  dartz: ^0.10.1
  # Remote API
  internet_connection_checker: ^0.0.1+4
  http: ^0.13.5
  # Local cache
  shared_preferences: ^2.0.15
  get: ^4.6.5
  # image
  cached_network_image: ^3.2.1
  # date time
  intl: ^0.17.0
```

### 2. Install it
You can install packages from the command line:

with Flutter:

```shell
$ flutter packages get
```

Alternatively, your editor might support `flutter packages get`. Check the docs for your editor to learn more.

## Flutter Clean Architecture Primer
### Introduction
It is architecture based on the book and blog by Uncle Bob. It is a combination of concepts taken from the Onion Architecture and other architectures. The main focus of the architecture is separation of concerns and scalability. It consists of Three main modules: `Domain`, `Data`, and `Presentation`.

## Work Flow
![alt text](/spec_img/clean.png?raw=true)
## Project Structure
```
|-- lib
|--------|-- main.dart
|        |-- injection 
|        |-- core
|        |   |-- common
|        |   |   |-- common_widgets.dart
|        |   |-- connection
|        |   |   |-- network_info.dart
|        |   |   |-- http_handler.dart
|        |   |   |-- dio_client.dart
|        |   |-- error
|        |   |   |-- exception.dart
|        |   |   |-- failure.dart
|        |   |-- theme
|        |   |   |-- app_colors.dart
|        |   |   |-- app_theme.dart
|        |   |-- usecases
|        |   |   |-- usecases.dart
|        |   |-- values
|        |   |   |-- constants.dart
|        |-- features
|        |   |-- models
|        |   |-- data
|        |   |      |-- datasources
|        |   |          |-- remote_data_source.dart
|        |   |          |-- local_data_source.dart
|        |   |      |-- repositories
|        |   |      |-- models
|        |   |-- domain
|        |   |      |-- entities
|        |   |      |-- repositories
|        |   |      |-- usecases
|        |   |-- pre|sentation
|        |   |      |-- bloc
|        |   |      |    |-- articles_bloc.dart
|        |   |      |    |-- article_event.dart
|        |   |      |    |-- article_state.dart
|        |   |      |-- pages
|        |   |      |-- widget
|-- pubsec.lock
└-- pubspec.yaml

```
## Feature

- [✓] Get most popular articles is specific section within specific period (7).
- [✓] Refresh list articles with pull to refresh style.
- [✓] Go to detail news website.

## Technology
```yaml
dependencies:
  # Bloc for state management
  flutter_bloc: ^8.1.1
  # Simple direct Service Locator
  get_it: ^7.2.0
  # Value equality
  equatable: ^2.0.5
  # Functional programming
  dartz: ^0.10.1
  # Remote API
  internet_connection_checker: ^0.0.1+4
  http: ^0.13.5
  # Local cache
  shared_preferences: ^2.0.15
  # Flutter library to load and cache network images. 
  cached_network_image: ^3.2.1
  # date time
  intl: ^0.17.0
  # A mock framework inspired by Mockito
  mockito: ^5.3.1
```