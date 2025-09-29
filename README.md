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
- [Getting Started](#-getting-started)
- [Previous Version (Local Storage with SQLite)](#-previous-version-local-storage-with-sqLite)
- [Used Technologies](#-used-technologies)
- [License](#-license)
- [Need help](#-need-help)

## 🔍 Features
- Email / password authentication
- Register, Login, Email Verification, Forgot Password flows
- Notes stored in Firebase (Firestore)
- Share notes via system share sheet
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

## 🌐 Used Technologies

- Flutter & Dart (Cross-platform app development)  
- Firebase (Authentication, Firestore database, Analytics)  
- Sqflite (Local SQLite storage – old version)  
- Share Plus (Share notes via system sheet)  
- Path & Path Provider (File system access)  
- Flutter Launcher Icons (App icons for Android & iOS)  
- Cupertino Icons (iOS-style icons)  
- Flutter Lints & Test (Code quality and unit testing)

## 📚 License
This project is licensed under the **MIT License** - see the [LICENSE](https://github.com/Mali03/FlutterNoteApp/blob/main/LICENSE) file for details.

## ❓ Need Help
If you need any help contact me on [LinkedIn](https://www.linkedin.com/in/mali03/).

# Türkçe

Uygulama, kullanıcı kimlik doğrulamasını (Giriş yap, Kayıt ol), notların gerçek zamanlı olarak saklanmasını ve temel not yönetim özelliklerini (oluşturma, düzenleme, silme ve paylaşma) destekler.

## 🧾 İçerikler
- [Özellikler](#-özellikler)
- [Kurulum ve Çalıştırma](#-kurulum-ve-çalıştırma)
- [Önceki Sürüm (SQLite ile Yerel Depolama)](#-önceki-sürüm-sqlite-ile-yerel-depolama)
- [Kullanılan Teknolojiler](#-kullanılan-teknolojiler)
- [Lisans](#-lisans)
- [Yardım](#-yardım)

## 🔍 Özellikler
- Email / şifre ile kimlik doğrulama
- Kayıt olma, Giriş yapma, Email doğrulama ve Şifremi unuttum akışları
- Firebase (Firestore) üzerinde saklanan notlar
- Notları sistem paylaşım sayfası üzerinden paylaşma
- Çoklu platform desteği (Mobil, Web, Desktop)

## 🛠 Kurulum ve Çalıştırma
### Gereksinimler
- Flutter SDK
- Android Studio veya Xcode (cihaz/emülatör için)
- Bir Firebase projesi

### Kurulum
1. Repyu klonlayın:
```
git clone https://github.com/Mali03/FlutterNoteApp.git
cd FlutterNoteApp
```

2. Paketleri yükleyin:
```
flutter pub get
```

3. Firebase’i yapılandırın:

- https://console.firebase.google.com/ adresinde bir Firebase projesi oluşturun

- Authentication → Email/Password özelliğini etkinleştirin

- Firestore veritabanı oluşturun (geliştirme sırasında test modunda başlatabilirsiniz)

Android için:

- Firebase’e Android uygulamanızı paket adınız ile ekleyin

- `google-services.json` dosyasını indirip `android/app/` klasörüne yerleştirin

- FlutterFire dokümantasyonuna göre `android/build.gradle` ve `android/app/build.gradle` dosyalarını yapılandırın

iOS için:

- Firebase’e iOS uygulamanızı bundle identifier ile ekleyin

- `GoogleService-Info.plist` dosyasını indirip `ios/Runner/` klasörüne yerleştirin

- `ios/` klasöründe `pod install` komutunu çalıştırın

> Tam adımlar için resmi FlutterFire kurulum dokümantasyonunu takip edin: https://firebase.flutter.dev/ (önerilir)

4. Uygulamayı çalıştırın:
```
flutter run
```

## 💾 Önceki Sürüm (SQLite ile Yerel Depolama)

Bu uygulamanın mevcut sürümü, notları saklamak için **Firebase (bulut tabanlı)** kullanmaktadır.
Eğer **SQLite (sqflite) ile yerel depolama** kullanılan eski uygulamayı görmek isterseniz, [`f984f70`](https://github.com/Mali03/FlutterNoteApp/commit/f984f70) commit’ine göz atabilirsiniz.

Bu sürüm, Firebase’e geçmeden önce CRUD işlemlerinin `sqflite` paketi kullanılarak nasıl yapıldığını göstermektedir.

Not: Eski SQLite ile ilgili dosyalar hâlâ projede `lib/services/crud/` klasörü altında bulunmaktadır, ancak mevcut Firebase tabanlı sürümde artık kullanılmamaktadır.

## 🌐 Kullanılan Teknolojiler

- Flutter & Dart (Çapraz platform uygulama geliştirme)  
- Firebase (Kimlik doğrulama, Firestore veritabanı, Analitik)  
- Sqflite (Yerel SQLite depolama – eski sürüm)  
- Share Plus (Notları sistem paylaşım sayfası ile paylaşma)  
- Path & Path Provider (Dosya sistemi erişimi)  
- Flutter Launcher Icons (Android ve iOS için uygulama ikonları)  
- Cupertino Icons (iOS tarzı ikonlar)  
- Flutter Lints & Test (Kod kalitesi ve testler)

## 📚 Lisans
Bu proje **MIT Lisans** altında lisanslanmıştır - detaylar için [LICENSE](https://github.com/Mali03/UAV-interface/blob/main/LICENSE) dosyasını incele.

## ❓ Yardım
Eğer bir yardıma ihtiyacın varsa bana [LinkedIn](https://www.linkedin.com/in/mali03/) üzerinden ulaş.
