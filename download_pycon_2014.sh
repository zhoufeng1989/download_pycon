#!/bin/sh
url_prefix='http://pyvideo.org'
index_url='http://pyvideo.org/category/50/pycon-us-2014'
urls=$(
    curl $index_url | \
    sed -n 's/<strong><a href="\(\/video.*\)".*>/\1/p'
)

for url in $urls
do
    resource_url=$(curl $url_prefix$url | sed -n 's/video_url: "\(.\+\)"/\1/p')
    youtube-dl $resource_url
done
