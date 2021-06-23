# W02D01 - Scrabble

Write a program that will replicate the scoring system in Scrabble. The function should take a single argument \(the word, comprised of letters/tiles\) and return a score.

## Letter Values

You'll need these:

```text
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10
```

So now that you've got those letter values, consider what data structure is good for mapping keys to values?

## Examples

1. "cabbage" should be scored as worth 14 points:
2. 3 points for C
3. 1 point for A 
4. 3 points for B 
5. 3 points for B
6. 1 point for A  
7. 2 points for G
8. 1 point for E

And to total:

* `3 + 1 + 3 + 3 + 1 + 2 + 1`
* = 14
* "test" should be scored as worth 4 points:
* 1 points for T
* 1 point for E 
* 1 points for S 
* 1 points for T

And to total:

* `1 + 1 + 1 + 1`
* = 4

## Double Check

[http://www.dvorkin.com/scrabscor.php](http://www.dvorkin.com/scrabscor.php)

