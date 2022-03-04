#!/bin/bash

browser=/usr/lib/firefox/firefox
subreddit="$(echo $1 | sed 's/\///g' | cut -d':' -f2)"

$browser "https://www.reddit.com/r/$subreddit"
