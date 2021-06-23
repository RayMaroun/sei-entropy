# W04D01 - Sieve of Eratosthenes

## The Sieve of Eratosthenes <a id="the-sieve-of-eratosthenes"></a>

#### The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given \#\# limit. It does so by iteratively marking as composite \(that is, not prime\) the multiples of each prime, \#\# starting with the first prime number, 2. <a id="the-sieve-of-eratosthenes-is-a-simple-ancient-algorithm-for-finding-all-prime-numbers-up-to-any-given--limit-it-does-so-by-iteratively-marking-as-composite-that-is-not-prime-the-multiples-of-each-prime--starting-with-the-first-prime-number-2"></a>

#### A prime number is a natural number that is only divisible by two numbers: 1 and itself. <a id="a-prime-number-is-a-natural-number-that-is-only-divisible-by-two-numbers-1-and-itself"></a>

#### Example: <a id="example"></a>

* Generate a list of integers, in this case 2 to 30

```text
2  3  4  5  6  7  8  9  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30
```

* The first number in the list is 2, so you get rid of every number in the list after 2 by counting up to 2 in increments of 2. \(2 is where you start in the Sieve of Erastothenes, and also a [prime number](https://en.wikipedia.org/wiki/Prime_number).\)

```text
2  3  5  7  9  11  13  15 17 19 21 23 25 27 29
```

* The next number in the list after 2 is 3, so now you would get rid of every third number in the list after three by counting up from 3 in increments of 3.
* You would do this for 5 as well, but after 5, the next number is 7, meaning you would get rid of every 7th number, but at this point, you will have gotten rid of them all. This leaves you with just a list or array of all prime numbers up to 30.

```text
2  3  5  7  11  13  17  19  23  29
```

#### Create your range, starting at two and ending at the given limit. <a id="create-your-range-starting-at-two-and-ending-at-the-given-limit"></a>

#### The algorithm consists of repeating the following over and over: <a id="the-algorithm-consists-of-repeating-the-following-over-and-over"></a>

* take the next available unmarked number in your list \(it is prime\)
* remove all the multiples of that number \(they are not prime\)

#### Repeat until you don't have any possible primes left in your range. <a id="repeat-until-you-dont-have-any-possible-primes-left-in-your-range"></a>

#### When the algorithm terminates, all the numbers in the list that have not been removed are prime. <a id="when-the-algorithm-terminates-all-the-numbers-in-the-list-that-have-not-been-removed-are-prime"></a>

#### The sieve in action: <a id="the-sieve-in-action"></a>

![Sieve of erasothenes in action](https://upload.wikimedia.org/wikipedia/commons/b/b9/Sieve_of_Eratosthenes_animation.gif)

