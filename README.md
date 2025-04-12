# Vica Hotel App 🏨

A **Flutter-based hotel booking application** with secure Laravel authentication and offline-first room management using SQLite. Built to deliver a seamless user experience for browsing and reserving hotel rooms, even without internet connectivity.

[![Flutter](https://img.shields.io/badge/Flutter-3.13.8-blue.svg)](https://flutter.dev)

## Screenshots & Demo 📸🎬  

### App Screenshots

<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 50px;">
  <img src="assets/images/screenshots/login.png" alt="Login Screen" width="200" />
  <img src="assets/images/screenshots/main_page.png" alt="Main Page" width="200" />
  <img src="assets/images/screenshots/Single room.png" alt="Single Room" width="200" />
  <img src="assets/images/screenshots/Rooms.png" alt="Rooms List" width="200" />
  <img src="assets/images/screenshots/Past Bookings.png" alt="Past Bookings" width="200" />
  <img src="assets/images/screenshots/Account.png" alt="Account Screen" width="200" />
</div>


## Demo GIF 🎬  
<p align="center">
  <img src="assets/gifs/app-demo.gif" alt="App Demo" width="300" />
</p>

---

## Features ✨
- **Secure Authentication**: JWT-based login/registration via **Laravel API**.
- **Offline Room Management**: Browse and manage hotel rooms locally using **SQLite** (`sqflite`).
- **Responsive UI**: Interactive elements like image carousels, calendars, and filters.
- **User Profile**: Edit personal details and profile images (synced with Laravel backend).
- **State Management**: Efficient UI-state handling with **Provider/Bloc**.
- **Localization**: Support for multiple languages (English, Arabic).
- **Modular Codebase**: Clean separation of concerns (`models`, `providers`, `services`).

---

## Installation 🛠️
### Prerequisites
- Flutter SDK (>=3.13.8)
- Dart (>=3.1.0)
- Android Studio/Xcode (for emulator setup)

### Steps
1. **Clone the repository**:
   ```bash
   git clone https://github.com/abdalmjeedalshami/vica_hotel_app.git
   cd vica_hotel_app

2. **Install dependencies**:
   ```bash
   flutter pub get

3. **Run the app**:
   ```bash
   flutter run

## Technology Stack 🛠️

### Frontend
<p align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" alt="Flutter" />
  <img src="https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white" alt="Dart" />
  <img src="https://img.shields.io/badge/Provider-5C6BC0?logo=flutter&logoColor=white" alt="Provider" />
  <img src="https://img.shields.io/badge/SQLite-003B57?logo=sqlite&logoColor=white" alt="SQLite" />
</p>

### Backend
<p align="left">
  <img src="https://img.shields.io/badge/Laravel-FF2D20?logo=laravel&logoColor=white" alt="Laravel" />
  <img src="https://img.shields.io/badge/PHP-777BB4?logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/JWT-000000?logo=json-web-tokens&logoColor=white" alt="JWT" />
</p>

### Database
<p align="left">
  <img src="https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white" alt="MySQL" />
  <img src="https://img.shields.io/badge/SQLite-003B57?logo=sqlite&logoColor=white" alt="SQLite" />
</p>

### Tools & Infrastructure
<p align="left">
  <img src="https://img.shields.io/badge/Git-F05032?logo=git&logoColor=white" alt="Git" />
  <img src="https://img.shields.io/badge/GitHub-181717?logo=github&logoColor=white" alt="GitHub" />
  <img src="https://img.shields.io/badge/Postman-FF6C37?logo=postman&logoColor=white" alt="Postman" />
  <img src="https://img.shields.io/badge/Android_Studio-3DDC84?logo=android-studio&logoColor=white" alt="Android Studio" />
</p>

### Architecture & Practices
- Clean Architecture
- MVC Pattern
- Offline-First Design
- RESTful APIs
- State Management (Provider)
- Secure Authentication (JWT)

## 🤝 Contributing

Contributions are welcome and appreciated!  
If you'd like to improve this project:

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/my-feature`
3. Commit your changes: `git commit -m "Add my feature"`
4. Push to the branch: `git push origin feature/my-feature`
5. Open a pull request

Please make sure your code follows the existing style and includes proper documentation when necessary.
