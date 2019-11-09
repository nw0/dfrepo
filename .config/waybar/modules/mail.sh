#!/usr/bin/env sh

unread=$(mailcheck -bcs | grep unread | awk '{ print $5 }')
echo -e '{"text": "'$(mailcheck -bcs | grep unread | awk '{ print $5 }')'"}'
