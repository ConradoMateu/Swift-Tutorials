#!/bin/bash

rm ./contents.swift

rm ./Closures.playground.zip

cat ./source/header.swift > ./contents.swift

cat ./source/srp.swift >> ./contents.swift
cat ./source/ocp.swift >> ./contents.swift
cat ./source/lsp.swift >> ./contents.swift
cat ./source/isp.swift >> ./contents.swift
cat ./source/dip.swift >> ./contents.swift

cat ./source/footer.swift >> ./contents.swift

cp ./contents.swift ./Closures.playground/contents.swift

{ rm contents.swift && awk '{gsub("\\*//\\*:", "", $0); print}' > contents.swift; } < contents.swift
{ rm contents.swift && awk '{gsub("/\\*:", "```\n", $0); print}' > contents.swift; } < contents.swift
{ rm contents.swift && awk '{gsub("\\*/", "\n```swift", $0); print}' > contents.swift; } < contents.swift

{ rm contents.swift && awk 'NR>1{print buf}{buf = $0}' > contents.swift; } < contents.swift

echo "\`\`\`swift
$(cat ./contents.swift)" > ./README.md

zip -r -X Closures.playground.zip ./Closures.playground

rm ./contents.swift
