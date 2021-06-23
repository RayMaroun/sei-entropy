# Python Lab 3 - Dictionary Problems

## Problem 1 - \(15 Minutes\) 

#### You're running an online business and a big part of your day is fulfilling orders. As your volume picks up that's been taking more of your time, and unfortunately lately you've been running into situations where you take an order but can't fulfill it.

#### You've decided to write a function fillable\(\) that takes three arguments: a dictionary stock representing all the merchandise you have in stock, a string merch representing the thing your customer wants to buy, and an integer n representing the number of units of merch they would like to buy. Your function should return `True` if you have the merchandise in stock to complete the sale, otherwise it should return `False`.

### Be sure to check for edge cases, and make sure that the merch is in the stock dictionary, as well as there is enough stock to fill the order.

### Assume valid data will always be passed in and n will always be &gt;= 1.

```python
stock = { 'football': 4, 'boardgame': 10, 'leggos': 1, 'doll': 5, }

def fillable(stock, merch, n):
# Your code goes here.
```

## Problem 2 - \(30 Minutes\)

```python
names = [["Grae Drake", 98110], ["Bethany Kok"], ["Alex Nussbacher", 94101], ["Darrell Silver", 11201]]
```

## Notice that one of the users above has a name but doesn't have a zip code.

### Write a function `user_contacts()` that takes a two-dimensional list like the one above and returns a dictionary with an item for each user where the key is the user's name and the value is the user's zip code. If your data doesn't include a zip code then the value should be None.

```python
def user_contacts(data):
    # Write your code here
```

## For example, using the input above, user\_contacts\(\) would return this dictionary:

```python
{
"Grae Drake": 98110,
"Bethany Kok": None,
"Alex Nussbacher": 94101,
"Darrell Silver": 11201,
}
```

## Solution - \(15  Minutes\)



