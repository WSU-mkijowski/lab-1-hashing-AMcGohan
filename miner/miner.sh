#!/bin/bash

# Downloaded wamerican package and moved it into repo to pull from

#while loop for reading each line, then adds every possible number between 10-1000 before the word. 
#The number + word combo then gets hashed and checks if the hash contains 4 '0' at the start.
hash_word="null"
word="null"
number=0
while read LINE
do
  for i in $(seq 10 1000); do
    hash_word=$(printf ${i}${LINE} | sha256sum)

    if [[ $hash_word =~ ^[0]{5} ]]; then
      number=$i
      word=$LINE
    break 2
    fi
  done
done < american-english


# To print hash, the word, and the nonce
printf $hash_word
printf "\n"
printf $word
printf "\n"
printf $number
printf "\n"


# ## prints all numbers between 100 and 105
# for i in $(seq 10 105); do
#   printf $i
# done


