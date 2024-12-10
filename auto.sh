
JS_DIRS=$(find "." -type f -name "*.js" | sort -u)
JS_CNT=$(find "." -type f -name "*.js" | sort -u | wc -l)

echo "" > README.md
echo "# Algorithm-study" >> README.md
echo "" >> README.md
echo "자바스크립트 알고리즘 공부" >> README.md
echo "" >> README.md
echo "누적 : $JS_CNT" >> README.md
echo "" >> README.md
echo "| 제목 | 레벨 | 파일 | 날짜 | 비고 |" >> README.md
echo "| --- | --- | -- | -- | --- |" >> README.md

entries=()

for JS_DIR in $JS_DIRS; do

    DATETIME=$(git log --diff-filter=A --format=%ad --date=short -- $JS_DIR)
    title=$(cat $JS_DIR | grep "//title:" | sed -n 's/.*\/\/title:\(.*\)/\1/p')
    level=$(cat $JS_DIR | grep "//level:" | sed -n 's/.*\/\/level:\(.*\)/\1/p')
    etc=$(grep "//etc:" "$JS_DIR" | sed -n 's/.*\/\/etc:\(.*\)/\1/p')
    JS_FILE=$(basename $JS_DIR)
    
    entries+=("$DATETIME|$title|$level|[$JS_FILE]($JS_DIR)|$etc")

done
sorted_entries=$(printf "%s\n" "${entries[@]}" | sort)

while IFS="|" read -r date file title level link etc; do
    echo "| $title | $level | $link | $date | $etc |" >> README.md
done <<< "$sorted_entries"

git add .
IS_GENERATED_MD=$(git status | grep -e README.md)
if [ -z "$IS_GENERATED_MD" ]; then
    echo "hi"
else
    git commit -m "add : README.md" --author "lyuna <hyunah0418@gmail.com>"
    git remote -v
    git push origin
fi
