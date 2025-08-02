#!/bin/bash

# Boyut ve klasör mapping
declare -A size_to_folder=(
    [48]="mdpi"
    [72]="hdpi"
    [96]="xhdpi"
    [144]="xxhdpi"
    [192]="xxxhdpi"
)

echo "🚀 Adaptive icon components Android'e yükleniyor..."

# Backup existing adaptive icons
echo "💾 Mevcut adaptive icon'ları backup'lıyorum..."
mkdir -p backup_adaptive_icons
cp android/app/src/main/res/mipmap-*/ic_background.png backup_adaptive_icons/ 2>/dev/null || echo "Background backup yok"
cp android/app/src/main/res/mipmap-*/ic_foreground.png backup_adaptive_icons/ 2>/dev/null || echo "Foreground backup yok"  
cp android/app/src/main/res/mipmap-*/ic_launcher_monochrome.png backup_adaptive_icons/ 2>/dev/null || echo "Monochrome backup yok"

# Install adaptive components
for size in 48 72 96 144 192; do
    folder=${size_to_folder[$size]}
    echo "📱 ${size}x${size} → mipmap-${folder}/"
    
    # Background
    cp ic_background_${size}.png android/app/src/main/res/mipmap-${folder}/ic_background.png
    
    # Foreground
    cp ic_foreground_${size}.png android/app/src/main/res/mipmap-${folder}/ic_foreground.png
    
    # Monochrome
    cp ic_monochrome_${size}.png android/app/src/main/res/mipmap-${folder}/ic_launcher_monochrome.png
done

echo "✅ Adaptive icon components yüklendi!"
echo "🔄 Complete Iona icon system ready!"
