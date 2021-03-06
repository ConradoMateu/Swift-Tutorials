#!/bin/bash

rm ./Contents.swift

rm ./Closures.playground.zip

cat ./source/header.swift > ./Contents.swift

cat ./source/srp.swift >> ./Contents.swift
cat ./source/ocp.swift >> ./Contents.swift
cat ./source/lsp.swift >> ./Contents.swift
cat ./source/isp.swift >> ./Contents.swift
cat ./source/dip.swift >> ./Contents.swift

cat ./source/footer.swift >> ./Contents.swift

cp ./Contents.swift ./Closures.playground/Contents.swift

{ rm Contents.swift && awk '{gsub("\\*//\\*:", "", $0); print}' > Contents.swift; } < Contents.swift
{ rm Contents.swift && awk '{gsub("/\\*:", "```\n", $0); print}' > Contents.swift; } < Contents.swift
{ rm Contents.swift && awk '{gsub("\\*/", "\n```swift", $0); print}' > Contents.swift; } < Contents.swift

{ rm Contents.swift && awk 'NR>1{print buf}{buf = $0}' > Contents.swift; } < Contents.swift

echo "\`\`\`swift
$(cat ./Contents.swift)" > ./README.md

zip -r -X Closures.playground.zip ./Closures.playground

rm ./Contents.swift
