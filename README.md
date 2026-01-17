# Sillicon Power Inc.  - Flutter Technical Test

## Overview

Sillicon Power Inc. is a Flutter-based mobile application that displays popular TV series using the TMDB (The Movie Database) API. 
This project was developed as a technical test for a job application process.

---

## Features

- Paginated list of popular TV series
- Detailed TV show information view
- Real-time data fetching from TMDB API
- Clean Architecture implementation
- BLoC state management
- Dependency injection with GetIt
- Dark and light mode support
- Offline mode with local database (Isar)
- Multi-language support (English and Spanish)
- Responsive design for portrait and landscape orientations

---

## Installation
### Prerequisites
- Flutter SDK 3.3.0+ (Run `flutter doctor` to verify your Flutter environment setup)
- TMDB API Key (from https://www.themoviedb.org/settings/api)

### Setup Steps

1. Clone the repository: 
```bash
git clone https://github.com/Raptor200111/sillicon_power. git
cd sillicon_power
```

2. Create `.env` file in root directory (file is required for API access and must not be committed to version control):
```bash
touch .env
```

3. Add your TMDB API key to `.env`:
```
TMDB_API_KEY='YOUR_API_KEY_HERE'
```

4. Install dependencies:
```bash
flutter pub get
```

5. Generate code (or everytime after adding or modifying Isar models):
```bash
dart run build_runner build --delete-conflicting-outputs
```

6. Generate localization files (or everytime after modifying localization `.arb` files):
```bash
flutter gen-l10n
```

7. Run the app:
```bash
flutter run
```

---

## Technologies

- **Flutter/Dart** - Mobile development framework
- **flutter_bloc** (v9.1.1) - State management
- **http** (v1.2.2) - API requests
- **isar** (v3.1.0) - Local database
- **flutter_gen** - Localization code generation
- **get_it** (v9.2.0) - Dependency injection
- **intl** (v0.18.1) - Internationalization
- **palette_generator** (v0.3.3+5) - Dynamic colors
- **flutter_dotenv** (v6.0.0) - Environment variables

---

## Project Structure

```
lib/
├── main.dart              # App entry point
├── presentation/          # UI Layer
│   ├── bloc/             # BLoC implementations
│   ├── pages/            # App screens
│   ├── widgets/          # Reusable components
│   └── theme/            # Theme configuration
├── domain/               # Business Logic
│   ├── entities/         # Core models
│   ├── repositories/     # Abstract interfaces
│   └── usecases/         # Business operations
├── data/                 # Data Layer
│   ├── datasources/      # API and database access
│   ├── models/           # Data models and schemas
│   └── repositories/     # Repository implementations
├── core/                 # Utilities
│   └── di/              # Dependency injection
└── l10n/                # Localization files
```
---

## References

- TMDB API:  https://developers.themoviedb.org/
- BLoC Documentation: https://bloclibrary.dev/
- Isar Database:  https://isar.dev/
- Flutter Localization:  https://flutter.dev/docs/development/accessibility-and-localization/internationalization
