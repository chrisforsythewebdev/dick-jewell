
#!/bin/bash

for file in \
  "Ubunye web3.mp4" \
  "inner999.mp4" \
  "squiddly mix 999.mp4" \
  "big wheel bigger.mp4" \
  "iso miso 999.mp4" \
  "sukka 999.mp4" \
  "black 9999.mp4" \
  "pirates512K_Stream.mp4"
do
  echo "Processing: $file"
  temp_file="${file%.*}_temp.mp4"

  ffmpeg -i "$file" \
    -vf "scale=-2:720" \
    -c:v libx264 -preset slow -crf 23 \
    -c:a aac -b:a 128k \
    -movflags +faststart \
    -y "$temp_file"

  # Replace original with temp
  mv "$temp_file" "$file"
done

