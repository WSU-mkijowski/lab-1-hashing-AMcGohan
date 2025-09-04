#!/bin/bash

# 1. Take first unique identifier (AMcGohan for example) and create a 5 digit RNG string and
# add it to the beginning of the identifier.
# 
# 2. Hash the identifier using `sha256sum` and store it as a new string variable.
#
# 3. Add the original 5 digit RNG string to the beginning of the hash and make it a new string variable.
#
# 4. Replace all instances of the unique identifier with the new RNG+hash ID

# Grab all unique ID and make a file containing them
cat quiz_data.csv | awk -F ',' '{ print $1}' | uniq > names

#Take LINE and add the RNG number before it, hash it, then add the same number before the new hash and add it to `hash_array`
name_array=()
hash_array=()
while read LINE
do
    rngName=$(shuf -i 10000-99999 -n 1)
    hash_name=$(printf ${rngName}${LINE} | sha256sum)
    hash_array+=(${rngName}${hash_name})
    name_array+=(${LINE})
done < names

# remove file 'names'
rm names

# printf "%s\n" "${hash_array[@]}"

# Remove '-' from each hash
for i in "${!hash_array[@]}"
do
    hash_array[$i]="${hash_array[$i]//-/}"
done

# Copy quiz_data.csv to salted-data.csv
cp quiz_data.csv salted-data.csv

# Replace all instance of identifier with its hash
for i in "${!name_array[@]}"
do
    sed -i "s/${name_array[$i]}/${hash_array[$i]}/g" salted-data.csv
done

