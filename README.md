# Contacts Flutter App

A modern, responsive, and intuitive contact management application built with Flutter and Material UI. This app acts as a clone of Google Contacts, offering robust offline storage using SQLite.

## Features

- **View Contacts:** Browse through all your added contacts in a clean, alphabetical list.
- **Add Contact:** Add new contacts with Name, Phone, Email, and Favorite status.
- **Edit Contact:** Update existing contact details seamlessly.
- **Delete Contact:** Remove a contact safely with a confirmation prompt.
- **Contact Profile:** View detailed information for a specific contact.
- **Call Contact:** Call a contact directly from the app (using the native device dialer).
- **Favorites:** Mark contacts as favorites and access them quickly via the dedicated "Favorites" tab in the bottom navigation bar.

## Technologies Used

- **Flutter SDK:** Cross-platform UI framework.
- **Provider:** State management.
- **sqflite:** Offline SQLite database for robust data persistence.
- **url_launcher:** To launch the native phone dialer.

## Installation Steps

### Prerequisites
- Flutter SDK installed (version 3.x or higher)
- Android Studio / VS Code with Flutter extension
- An Android/iOS Emulator or a physical device connected

### Setup
1. Clone the repository:
   ```bash
   git clone <your-repository-url>
   ```
2. Navigate to the project directory:
   ```bash
   cd contacts_app
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Usage Instructions
- **Home Screen:** On launch, you will see your contacts. The bottom navigation bar allows switching between "Contacts" and "Favorites".
- **Adding a Contact:** Tap the floating action button (`+`) in the bottom right corner to add a new contact.
- **Editing/Deleting:** Tap on any contact to view their profile. Use the top-right app bar icons to edit or delete the contact.
- **Calling:** In the contact profile screen, tap the green phone icon to call the person.

## Demo & APK
- The generated APK is located in `build/app/outputs/flutter-apk/app-release.apk`.
- You can install this APK on any Android device to test the application.
