#!/bin/sh

echo -e "Find the text pattern in PDF"
echo -e "please input text: \c"
read pattern

find . -name '*.pdf' -exec sh -c 'pdftotext "{}" - | grep --with-filename --label="{}" --color '${pattern}'' \;
