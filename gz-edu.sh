#!/bin/bash

heading="👋 *gz-edu*:"
greetings=""

if [ `date +%P` = "am" ]; then 
greetings="Good Morning!"; 
else 
greetings="Good Evening!"; fi

random_wiki_title=$( curl -s "https://en.wikipedia.org/w/api.php?action=query&format=json&list=random&rnnamespace=0&rnlimit=1" | jq '.query.random[0].title')

random_wiki=`echo "$random_wiki_title" | tr -d '"'`
random_wiki=`echo ${random_wiki//" "/"_"}`

wiki_url="[${random_wiki_title}](https://en.wikipedia.org/wiki/${random_wiki})"

./gz-notifications/gz-notifications.sh $1 "${heading} ${greetings} 

Here you are an interesting article I found in the internet: ${wiki_url}"
