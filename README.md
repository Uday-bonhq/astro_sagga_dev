# astro_sagga

Astro Sagga – Live Astrology, Kundali & Horoscope App  
A complete Flutter app for astrology-based services with GetX state management, responsive UI, and modular architecture.

---

## ✨ Features

### 🧠 Core Functionality:
- View astrology services: Match Making, Horoscope, Kundali, Subh Muhurat
- Expert listing with ratings and experience
- Dynamic banners, gifts, reviews, and followers
- Detailed expert profiles
- Follow/Unfollow astrologers with state persistence
- Share expert profiles via native sharing
- Fully responsive UI for mobile and tablet

### 🛠️ Technical Highlights:
- GetX for state management, routing, and reactive updates
- Reusable widgets and centralized theme/colors/assets
- Hive-ready structure for future caching implementation
- Toast-based feedback system
- Clean and modular architecture
- Scroll animations, shimmer loaders, and real-time interactivity

### 🎨 UI/UX Features:
- Responsive layout for various screen sizes
- Custom service tiles with icon + color
- Reviews with timeago support
- App-wide text utility widget with style control
- Text shadows and theme-based design
- Smooth navigation transitions

---


### SETUP & RUN

## Requirements:
- Flutter 3.x (null safety)
- Dart >= 2.17

## Steps:
1. git clone https://github.com/Uday-bonhq/astro_sagga_dev
2. cd product_catalog_app
3. flutter pub get
4. flutter run

## Run Tests:
flutter test

## 📁 Project Structure

lib/
├── controller/ # GetX controllers
├── core/ # AppColors, AppAssets, Constants
├── data/ # Models (BannerModel, ReviewModel, etc.)
├── screen/ # UI screens (Home, Details, etc.)
├── widgets/ # Reusable UI components
└── main.dart

## 📦 Dependencies
| Package                        | Purpose                       |
|--------------------------------|-------------------------------|
| get                            | State management, DI, routing |
| dio                            | API requests                  |
| connectivity\_plus             | Network monitoring            |
| pull\_to\_refresh              | Pull-to-refresh UI            |
| skeletonizer                   | Shimmer loading               |
| carousel\_slider               | Banners/carousels             |
| timeago                        | Human-readable timestamps     |
| cached\_network\_image         | Optimized image loading       |
| flutter\_staggered\_animations | Smooth list animations        |
| toast                          | Feedback messages             |
| flutter\_svg                   | SVG icon rendering            |
| share\_plus                    | Native sharing                |



## 📜 License
MIT License – free for personal & commercial use.


## 👤 Author

Uday Singh
GitHub: udaysingh7737