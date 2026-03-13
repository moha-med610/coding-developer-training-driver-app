# 🚚 Delivery Driver App

تطبيق موبايل لمندوبي التوصيل يساعدهم على إدارة الطلبات واستلامها وتتبع حالة التوصيل بسهولة.  
تم تطوير التطبيق باستخدام **Flutter** مع تطبيق مفهوم **Clean Architecture** لضمان تنظيم الكود وسهولة التوسع في المستقبل.

---

# 📱 Overview

يتيح التطبيق لمندوب التوصيل:

- تسجيل الدخول إلى النظام
- استلام الطلبات الجديدة
- عرض تفاصيل الطلب
- تحديث حالة التوصيل
- متابعة الطلبات الجارية

التطبيق جزء من نظام توصيل متكامل يربط بين **العميل – المندوب – لوحة التحكم**.

---

# ✨ Features

## 🔐 Authentication

- تسجيل دخول المندوب
- التحقق باستخدام JWT
- حفظ التوكن محليًا
- تسجيل خروج آمن

---

## 📦 Orders Management

- عرض قائمة الطلبات
- قبول الطلب
- رفض الطلب
- عرض تفاصيل الطلب

---

## 📄 Order Details

عرض جميع بيانات الطلب مثل:

- اسم العميل
- رقم الهاتف
- عنوان التوصيل
- المنتجات داخل الطلب
- السعر الإجمالي
- حالة الطلب

---

## 🚀 Delivery Status

يمكن للمندوب تغيير حالة الطلب إلى:

- Pending
- Accepted
- On The Way
- Delivered

---

## 🔔 Notifications

- إشعار عند وصول طلب جديد
- تحديثات حالة الطلب

---

# 🛠 Tech Stack

## Mobile

- Flutter
- Dart

## Architecture

- Clean Architecture

## State Management

- Bloc / Cubit

## Networking

- Dio
- REST API

## Local Storage

- SharedPreferences
- Secure Storage

---

# 📂 Project Structure

lib
│
├── core
│ ├── constants
│ ├── network
│ ├── services
│ └── utils
│
├── features
│
│ ├── auth
│ │ ├── data
│ │ ├── domain
│ │ └── presentation
│
│ ├── orders
│ │ ├── data
│ │ ├── domain
│ │ └── presentation
│
│ └── profile
│
├── shared
│
└── main.dart


---

# 📱 App Screens

-splash screen
- language selection screen
- Login Screen
- driver registration
- pendening approval screen
- home screen
- the danger zone & cash limit card
- earnings card
- active tasks
- active trips
- proof of dlivery
- return to office

---

# 🔄 Application Flow

1. يقوم المندوب بتسجيل الدخول.
2. تظهر قائمة الطلبات المتاحة.
3. يختار المندوب طلبًا ويقوم بقبوله.
4. يبدأ توصيل الطلب للعميل.
5. عند التسليم يتم تغيير حالة الطلب إلى **Delivered**.

---

# 🔗 API Integration

التطبيق يتصل مع Backend عبر REST API.

---

# 📌 Future Improvements

- إضافة تتبع المندوب باستخدام GPS
- عرض المسار على الخريطة باستخدام Google Maps
- دعم Push Notifications باستخدام Firebase
- دعم العمل بدون إنترنت (Offline Mode)
- إضافة نظام تقييم للمندوب

---

# 👨‍💻 Author

**Mohamed Khaled**

Flutter & Backend Developer




