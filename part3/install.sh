#!/bin/bash 
wget http://www.cl.ecei.tohoku.ac.jp/nlp100/data/jawiki-country.json.gz
gzip -dc jawiki-country.json.gz > wiki.json

