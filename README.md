
![SSTORE Screenshot](https://github.com/AbdellrahmanAhmed/SSTORE/blob/main/screens0096.png?raw=true)

# 🛍️ SSTORE Flutter eCommerce App

A **training project** built with **Flutter**, integrated with **Firebase** and **Supabase**, to simulate a modern eCommerce application.  
The goal of this project is to practice building a complete app that supports multiple languages, dark/light themes, user authentication, and product management.

---

## ✨ Features
- 🌗 **Dark & Light Mode** support.  
- 🌍 **Arabic & English** language support.  
- 📧 **Email account creation** with activation, login, profile editing, and password reset using **Firebase**.  
- 🔑 "Remember Me" option for direct login.  
- ⏳ **Shimmer effect** while loading data.  
- 📡 **Internet connectivity check**.  
- 🛒 Product listing in **Grid view with dynamic cards** + shimmer placeholders while loading.  

---

## 🖥️ Screens
- Splash Screen  
- Onboarding  
- Sign Up (Create Account)
- Login  
- Forgot Password  
- Verify Account  
- Edit Profile  
- Loading Screen  
- Home Screen  
- Store Screen  
- Wishlist (Favorite Products)  
- Settings Screen  
- Account Screen  
- Product Detail Screen
- Product Reviews Screen  

---

## 🛠️ Tools & Technologies
- **Flutter**: Core framework for building the app.  
- **Firebase (Auth + Firestore)**: User authentication, account creation, activation, profile editing, password reset.  
- **Supabase**: Product data and image storage.  
- **Illustrator**: Logo design.  
- **Photoshop**: Image background removal and editing for Promo video.  
- **Blender**: 3D modeling for Promo video.  
- **DaVinci Resolve**: Promo video editing.  

---

## 📚 Libraries Used
- **flutter_native_splash**: Splash screen setup.  
- **smooth_page_indicator**: Page indicators for onboarding.  
- **connectivity_plus**: Internet connectivity monitoring.  
- **lottie**: Animated illustrations.  
- **shimmer**: Loading placeholders.  
- **get / get_storage**: State management and local storage.  
- **firebase_core / firebase_auth / cloud_firestore**: Firebase integration.  
- **google_sign_in**: Google account login.  
- **supabase_flutter**: Supabase database integration.  

---

## 📂 Project Structure
```
├───bindings
├───common
│   └───widgets
│       ├───appbar
│       ├───brands
│       ├───chips
│       ├───containers
│       ├───curved_edges
│       ├───icons
│       ├───image
│       ├───image_text_widgets
│       ├───layouts
│       ├───list_tiles
│       ├───loaders
│       ├───products
│       │   ├───cart
│       │   └───product_cards
│       └───texts
├───data
│   ├───repositories
│   │   ├───authentication
│   │   ├───data
│   │   │   ├───banners
│   │   │   ├───category
│   │   │   └───products
│   │   └───user
│   └───services
├───features
│   ├───authentication
│   │   ├───controllers
│   │   │   ├───forget_password
│   │   │   ├───login
│   │   │   ├───onboarding
│   │   │   └───signup
│   │   ├───models
│   │   └───screens
│   │       ├───login
│   │       │   └───widgets
│   │       ├───onboarding
│   │       │   └───widgets
│   │       ├───password_configuration
│   │       └───signup
│   │           └───widgets
│   ├───personalization
│   │   ├───controllers
│   │   ├───models
│   │   └───screens
│   │       ├───address
│   │       ├───profile
│   │       │   └───widget
│   │       └───settings
│   └───shop
│       ├───controllers
│       ├───models
│       └───screens
│           ├───home
│           │   └───widgets
│           ├───product_details
│           │   └───widgets
│           ├───product_reviews
│           │   └───widgets
│           ├───store
│           │   └───widgets
│           └───wishlist
├───services
└───utils
    ├───constants
    ├───device
    ├───dev_tools
    ├───exceptions
    ├───formatters
    ├───helpers
    ├───http
    ├───local_stroge
    ├───logging
    ├───popups
    ├───shimmer
    ├───theme
    │   └───custom_themes
    └───validators
```


---

## ⚡ Note
This project is a **training project** for learning and practicing Flutter, Firebase, and Supabase integration.  
