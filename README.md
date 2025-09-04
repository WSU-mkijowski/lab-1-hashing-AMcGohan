[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SPs4PNWX)
# Lab 1 : CEG 3400 Intro to Cyber Security

## Name: Aidan McGohan

### Task 1: Hashing

**Reminder Deliverable:** Is your `salted-data.csv` in this repository?

Answer the following in this file:

* How many unique users are in the data?

42, I used `cat quiz_data.csv | awk -F "," '{print $1}' | uniq | wc -l` to print number of unique users, and subtract 1 for FLastName

* How many salts did you create?

There are 42 salts that I created, each randomly made for each unique user.

* How many possible combinations will I need to try to figure out the secret ID
  of all students (assume I know all potential secret IDs and have your 
  `salted-data.csv`)

`1.4809376465435122258790507146098e+68`
I got this answer by multiplying all possible combinations of a hash (64^35, where 64 = length of hash and 35 = 9 numbers + 26 letters) with the possible combinations that the salt could be (Between 10,000 - 99,999, so 89,999 possible salts).

* Instead of salts, if you were to use a nonce (unique number for each hashed
  field) how many possible combinations would I need to try?
  
  Same possible combinations as previous question.

* Given the above, if this quiz data were *actual* class data, say for example
  your final exam, how would you store this dataset?  Why?

  I would store the dataset in a database that only the instructor of the course and the faculty that are above the instructor can access with hashed values of the students names that each faculty would have to store locally to help prevent any potential leaks.

```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 1 here

while read LINE
do
    rngName=$(shuf -i 10000-99999 -n 1)
    hash_name=$(printf ${rngName}${LINE} | sha256sum)
    hash_array+=(${rngName}${hash_name})
    name_array+=(${LINE})
done < names

sed -i "s/${name_array[$i]}/${hash_array[$i]}/g" salted-data.csv
```

---

### Task 2: Crypto Mining

**Reminder Deliverable:** Is your "mining" code in this repository (`mining/`)?
**Reminder Deliverable:** Is your nonce + word combos in `coins.txt`?

Answer the following:

* Paste your ***nonce+word(s) and hash(s)*** below ( either 3x `000` hashes or 1x `0000`
hash)

```

```

* How many words were in your dictionary?
* How many nonces did your code iterate over?
* What was the maximum number of hashes your code *could* compute given the above?
* What did you think about Task 2?
* Is there a better way than brute force to attempt to get higher valued coins?
* Why or why not?


```bash
please put any cool bash one-liners or other piped commands you
learned/struggled with for task 2 here
```

