# Flutter Note App | Flutter Not Uygulaması 📝

![Flutter](https://img.shields.io/badge/Flutter-3.29.3-blue?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.7.2-blue?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-orange?logo=firebase)

EN - A simple note-taking application built with Flutter and Firebase. 

TR - Flutter ve Firebase ile geliştirilmiş basit bir not alma uygulaması.

<p float="left">
  <img src="https://i.imgur.com/eiQrKXd.png" width="250" />
  <img src="https://i.imgur.com/PAfsoMg.png" width="250" />
  <img src="https://i.imgur.com/FBHwMc2.png" width="250" />
</p>

# 🌍 Languages
You can select your preferred languages below:

- [English](#English)
- [Türkçe](#Türkçe)

# English

The app supports user authentication (Login, Register), real-time storage of notes, and basic note management features (create, edit, delete and share note).

## 🧾 Contents
- [Features](#-features)
- [Previous Version (Local Storage with SQLite)](#-previous-version-local-storage-with-sqLite)
- [License](#-license)
- [Need help](#-need-help)

## 🔍 Features
- Email / password authentication
- Register, Login, Email Verification, Forgot Password flows
- Share notes via system share sheet
- Notes stored in Firebase (Firestore)
- Multi-platform compatibility (Mobile, Web, Desktop)

## 🛠 Getting Started
### Prerequisites
- Flutter SDK
- Android Studio or Xcode (for device/emulator)
- A Firebase project

### Installation
1. Clone the repo:
```
git clone https://github.com/Mali03/FlutterNoteApp.git
cd FlutterNoteApp
```

2. Get packages:
```
flutter pub get
```

3. Configure Firebase:

- Create a Firebase project at https://console.firebase.google.com/

- Enable Authentication → Email/Password

- Create a Firestore database (start in test mode during development)

For Android:

- Add an Android app in Firebase with your package name

- Download `google-services.json` and place it in `android/app/`

- Add Firebase config in `android/build.gradle` and `android/app/build.gradle` as per FlutterFire docs

For iOS:

- Add an iOS app in Firebase with your bundle identifier

- Download `GoogleService-Info.plist` and place it in `ios/Runner/`

- Run `pod install` in `ios/`

> Follow official FlutterFire setup docs for exact steps: https://firebase.flutter.dev/ (recommended)

4. Run the app:
```
flutter run
```

## 💾 Previous Version (Local Storage with SQLite)

The current version of this app uses **Firebase (cloud-based)** for note storage.  
If you would like to see the earlier implementation that used **local storage with SQLite (sqflite)**, you can check out commit [`f984f70`](https://github.com/Mali03/FlutterNoteApp/commit/f984f70).  

That version demonstrates how CRUD operations were handled locally using the `sqflite` package before migrating to Firebase.

Note: the old SQLite-related files are still present in the project under `lib/services/crud/`, but they are no longer used in the current Firebase-based implementation.

## 📚 License
This project is licensed under the **MIT License** - see the [LICENSE](https://github.com/Mali03/FlutterNoteApp/blob/main/LICENSE) file for details.

## ❓ Need Help
If you need any help contact me on [LinkedIn](https://www.linkedin.com/in/mali03/).

# Türkçe

Uygulama, kullanıcı kimlik doğrulamasını (Giriş yap, Kayıt ol), notların gerçek zamanlı olarak saklanmasını ve temel not yönetim özelliklerini (oluşturma, düzenleme, silme ve paylaşma) destekler.
