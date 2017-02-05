#!/bin/bash

if [ "$#" -ne 2 ]; then
    my_scriptname=$(basename "$0");
    echo "Usage : $my_scriptname <Title>";
    exit 1;
fi

post_title="$1"
title_text="$2"
date_string=`date +%F`
format_string="$date_string""-""$post_title"
category=`dirname $PWD`
category=`basename $category`


echo "Creating $format_string".md

echo "---
layout: post
title: $title_text
category: $category
date: $date_string
---

" >> "$format_string".md ;

vim + "$format_string".md
