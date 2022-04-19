#!/bin/bash

awk 'NF > 0' quotes.txt > intermediate.txt
awk '!seen[$0]++' intermediate.txt

rm intermediate.txt
