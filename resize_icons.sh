#!/bin/bash

# Icon boyutları
sizes=(36 48 72 96 144 192)
folders=(ldpi mdpi hdpi xhdpi xxhdpi xxxhdpi)

echo "🎨 Iona icon resize başlıyor..."

# Her boyut için resize
for i in {0..5}; do
    size=${sizes[$i]}
    folder=${folders[$i]}
    
    echo "📐 ${size}x${size} (${folder}) oluşturuluyor..."
    
    # ic_launcher.png resize
    convert ic_launcher.png -resize ${size}x${size} ic_launcher_${size}.png
    
    # ic_launcher_round.png resize  
    convert ic_launcher_round.png -resize ${size}x${size} ic_launcher_round_${size}.png
done

echo "✅ Tüm boyutlar hazır!"
ls -la ic_launcher_*.png
