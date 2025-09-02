#!/bin/bash

# 1. Take first unique identifier (AMcGohan for example) and create a 5 digit RNG string and
# add it to the beginning of the identifier.
# 
# 2. Hash the identifier using `sha256sum` and store it as a new string variable.
#
# 3. Add the original 5 digit RNG string to the beginning of the hash and make it a new string variable.
#
# 4. Replace all instances of the unique identifier with the new RNG+hash ID

rngName=$(shuf -i 10000-99999 -n 1)

# cat quiz_data.csv | awk -F ',' '{ print $1}' | uniq
