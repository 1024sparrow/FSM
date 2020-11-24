#!/bin/bash

name="$1"
ok=false

if [[ "$1" =~ .*\.js$ ]]
then
	echo "#!/usr/bin/node

const fs = require('fs');
const filePath = process.argv[2];
const data = fs.readFileSync(filePath); // Buffer

// ...

var result = '';
fs.writeFileSync(filePath, result, 'utf-8');
" > "$name"
	ok=true
elif [[ "$1" =~ .*\.sh$ ]]
then
	echo "#!/bin/bash

# process file located at \"\$1\"
" > "$name"
	ok=true
elif [[ "$1" =~ .*\.py$ ]]
then
	echo "#!/usr/bin/env python
#-*- coding: utf-8 -*-

import sys, re

# process file located at sys.argv[2]
" > "$name"
	ok=true
fi

if $ok
then
	chmod +x "$1"
fi
