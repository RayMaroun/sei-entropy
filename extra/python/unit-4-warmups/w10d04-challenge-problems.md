# W10D04 - Challenge Problems

Solve the following challenge problems using Python:

## **1- Hell's Kitchen**

![Gordon Ramsay](../../.gitbook/assets/image%20%288%29.png)

#### Description

Gordon Ramsay shouts and swears. There might be something wrong with him.  
You will be given a string of words. Your job is to turn them in to Gordon's language.  
Here are the rules:

* The words should be capitalized.
* Every word should end with '!!!!'.
* The letters 'a' or 'A' should turn into '@'.
* Any other vowel should become '\*'.

#### **Example**

Input: `'i am a chef'`

Output: `'*!!!! @M!!!! @!!!! CH*F!!!!'`

#### Starter Code

```python
def gordon(string):
    return ""
```

## 2- **Job Matching**

#### **Description**

Let's build a matchmaking system that helps discover jobs for developers based on a number of factors.

One of the simplest, yet most important factors is compensation. As developers we know how much money we need to support our lifestyle, so we generally have a rough idea of the minimum salary we would be satisfied with.

Let's give this a try. We'll create a function `match` which takes a `candidate` and a `job`, which will return a boolean indicating whether the job is a valid match for the candidate.

A candidate will have a minimum salary, so it will look like this:

```python
candidate = {
  'min_salary': 120000
}
```

A job will have a maximum salary, so it will look like this:

```python
job = {
  'max_salary': 140000
}
```

If either the candidate's minimum salary or the job's maximum salary is not present, throw an error.

For a valid match, the candidate's minimum salary must be less than or equal to the job's maximum salary. However, let's also include 10% wiggle room \(deducted from the candidate's minimum salary\) in case the candidate is a rock star who enjoys programming in their spare time. The company offering the job may be able to work something out.

#### **Example**

```python
candidate1 = { 'min_salary': 120000 }
candidate2 = { 'min_salary': 190000 }
job1 = { 'max_salary': 130000 }
job2 = { 'max_salary': 80000 }
job3 = { 'max_salary': 171000 }

match(candidate1, job1) # True
match(candidate2, job3) # True
match(candidate2, job3) # True
match(candidate2, job1) # False
match(candidate2, job2) # False
```

#### Starter Code

```python
def match(candidate, job):
    #your code here
```

## 3- **Sum of odd numbers**

#### **Description**

Given the triangle of consecutive odd numbers:

```text
             1
          3     5
       7     9    11
   13    15    17    19
21    23    25    27    29
...
```

Calculate the row sums of this triangle from the row index \(starting at index 1\) e.g.:

```python
row_sum_odd_numbers(1); # 1
row_sum_odd_numbers(2); # 3 + 5 = 8
row_sum_odd_numbers(3); # 7 + 9 + 11 = 27
```

#### Starter Code

```python
def row_sum_odd_numbers(n):
    #your code here
```

