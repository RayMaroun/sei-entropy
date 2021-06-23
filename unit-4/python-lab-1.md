# Python Lab 2

## Requirements

Complete each challenge in a separate file.

### Challenge 1 - Calculator

Create a simple calculator that first asks the user what method they would like to use \(addition, subtraction, multiplication, division\) and then asks the user for two numbers, returning the result of the method with the two numbers. Here is a sample prompt:

```text
What calculation would you like to do? (add, sub, mult, div)
add
What is number 1?
3
What is number 2?
6
Your result is 9
```

### Challenge 2 - Reverse a string

Reverse a string manually. Don't use s\[::-1\] \(even though that's awesome\). Create a new variable storing an empty string and add the letters from the first string one by one. The for loop should iterate over the length of the string and you should access letters individually.

Below is some sample output.

```text
Enter a string:
reverse_me
em_esrever
```

### Challenge 3 - Bank Transactions

Create a prompt that asks the user if they would like to display their balance, withdraw or deposit. Write three methods to perform these calculations and output the result to the user.

Gather user input using the `input` function. Note that input always returns user input as a string. You have to manually convert it to an int or a float to make it behave like number. Also, end the input prompt with a \n newline character if you want the user to type in on the next line.

```text
age = input("How old are you?\n")
age = int(age)
```

Here is a sample output:

```text
Your current balance is
4000
What would you like to do? (deposit, withdraw, check_balance)
deposit
How much would you like to deposit?
1000
Your current balance is 5000
Are you done?
yes
Thank you!
```

### Challenge 4 - Sort a String

Create a function that takes a string and returns the string with the letters in alphabetical order \(ie. `hello` becomes `ehllo`\), Assume numbers and punctuation symbols will not be included in the string.

```text
Give me a string to alphabetize
supercalifragilisticexpialidocious
Alphabetized: aaacccdeefgiiiiiiillloopprrssstuux
```

