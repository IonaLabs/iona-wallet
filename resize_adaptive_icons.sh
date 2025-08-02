#!/bin/bash

sizes=(72 96 144 192)
folders=(hdpi xhdpi xxhdpi xxxhdpi)

echo "🎨 Adaptive icon resize başlıyor..."

for i in {0..3}; do
    size=${sizes[$i]}
    folder=${folders[$i]}
    
    echo "📱 ${size}x${size} (${folder}) oluşturuluyor..."
    
    # Background
    convert ic_background_512.png -resize ${size}x${size} ic_background_${size}.png
    
    # Foreground  
    convert sticker.png -resize ${size}x${size} ic_foreground_${size}.png
    
    # Monochrome
    convert ic_monochrome_512.png -resize ${size}x${size} ic_monochrome_${size}.png
done

echo "✅ Adaptive icon boyutları hazır!"
