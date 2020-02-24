#!/bin/bash

wget -O livescores.xml  static.espncricinfo.com/rss/livescores.xml                                   #site

cat livescores.xml | grep title > title_buffer.txt                                #matches
 sed "s/<\\/title>//g ; s/<title>//g" title_buffer.txt > matches.txt

cat livescores.xml | grep link > buffer_link.txt                                  #link
sed "s/<link>//g ; s/<\\/link>//g" buffer_link.txt > link.txt

cat -b matches.txt 
read -p "Select the number you want to see:" i
sed "${i}q;d" link.txt > final_link.txt

while true ;
do
wget -o log -O site.html  -i final_link.txt 
cat site.html | grep "<title>"  > buffer_score.txt
 sed "s/<\\/title>//g ; s/<title>//g" buffer_score.txt > score.txt

 notify-send "$(cat score.txt)"
 cat score.txt
 sleep 10
 done