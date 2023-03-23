#/bin/sh

echo -e "This script changes word from 'A' to 'B'!!"
echo -e "please input 'from': \c "
read from
echo "'from' word is : $from"

echo -e "please input 'to': \c"
read to
echo "'to' word is : $to"

echo "changing $from => $to"
find . -type f -exec sed -i 's/'${from}'/'${to}'/g' {} \;
echo "complete!! git status"
git status
