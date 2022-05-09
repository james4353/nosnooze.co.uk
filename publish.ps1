$sourceLocation = "${PWD}"
$ghPagesPath = "/Users/volkan/MyHome/Projects/Git/github-ulrich/nosnooze.co.uk"

Set-Location $sourceLocation
docker run --rm -v "${PWD}:/srv/jekyll" jekyll/jekyll /bin/bash -c "jekyll build"
Get-ChildItem -Path $ghPagesPath/* –Recurse -Exclude .git/* | Remove-Item -Recurse -Force
Copy-Item $sourceLocation/_site/* $ghPagesPath/ -Recurse -Force
Set-Location $ghPagesPath
git checkout -b master
git add .
git commit -m "Publish"
git push -u origin master
Set-Location $sourceLocation