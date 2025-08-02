#!/bin/bash

# Boyut ve klasör eşleştirmesi
declare -A size_to_folder=(
    [36]="ldpi"
    [48]="mdpi" 
    [72]="hdpi"
    [96]="xhdpi"
    [144]="xxhdpi"
    [192]="xxxhdpi"
)

echo "🚀 Iona icon'ları Android mipmap klasörlerine kopyalanıyor..."

# Status icon'larını backup
echo "💾 Mevcut Status icon'larını backup'lıyorum..."
mkdir -p backup_status_icons
cp android/app/src/main/res/mipmap-*/ic_launcher*.png backup_status_icons/

# Her boyut için kopyalama
for size in 36 48 72 96 144 192; do
    folder=${size_to_folder[$size]}
    echo "📱 ${size}x${size} → mipmap-${folder}/"
    
    # ic_launcher.png kopyala
    cp ic_launcher_${size}.png android/app/src/main/res/mipmap-${folder}/ic_launcher.png
    
    # ic_launcher_round.png kopyala
    cp ic_launcher_round_${size}.png android/app/src/main/res/mipmap-${folder}/ic_launcher_round.png
done

echo "✅ Iona icon'ları başarıyla yüklendi!"
echo "🔄 Yeni APK build için: make run-android"
