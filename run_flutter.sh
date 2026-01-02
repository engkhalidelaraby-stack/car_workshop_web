#!/bin/bash

echo "🔹 بدء إعداد المشروع لتشغيل Flutter على الموبايل"

# 1️⃣ تثبيت Java 17 (لو مش موجود)
if [ ! -d "/usr/lib/jvm/java-17-openjdk-amd64" ]; then
    echo "Java 17 غير موجود، جاري التثبيت..."
    sudo apt update
    sudo apt install -y openjdk-17-jdk
else
    echo "Java 17 موجود بالفعل"
fi

# 2️⃣ ضبط JAVA_HOME
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
echo "JAVA_HOME تم ضبطه على $JAVA_HOME"
java -version

# 3️⃣ حذف كاش Gradle
echo "🗑️ حذف كاش Gradle القديم..."
rm -rf ~/.gradle

# 4️⃣ تنظيف Flutter
echo "🧹 تنظيف مشروع Flutter..."
flutter clean
flutter pub get

# 5️⃣ تشغيل التطبيق على الموبايل
echo "🚀 تشغيل التطبيق على الموبايل..."
flutter run

echo "✅ تم تشغيل المشروع"
