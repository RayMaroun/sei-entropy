# Python Lists

## ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Lists in Python

### Learning Objectives

_After this lesson, you will be able to:_

* Create lists in Python.
* Print out specific elements in a list.
* Perform common list operations.

## Lists

### What is a list?

A list is Python's name for an array. They function very similarly to Javascript arrays.

```python
# Declaring lists
colors = ["red", "yellow", "green"]
my_class = ["James", "Zoe", "Steve", "Nhu", "Paulo"]

# Strings
colors = ["red", "yellow", "green"]

# Numbers
my_nums = [4, 7, 9, 1, 4]

# Both!
loosy_goosy = ["red", 7, "yellow", 1, 4]
```

If you want to access a specific element, you access it with bracket notations in the same way as Javascript. For example, to print 'Steve', we would write: `print(my_class[2])`.

## List Operations

### Basic List Operations

#### `len()`

To get the length of a list, use `len(list_name)`. For example:

```python
my_class = ["James", "Zoe", "Steve", "Nhu", "Paulo"]

num_students = len(my_class)
print("There are", num_students, "students in the class")
# => 5
```

#### `append()`

To add something on the end of a list, use `list_name.append(item)`. For example:

```python
my_class = ["James", "Zoe", "Steve", "Nhu", "Paulo"]

my_class.append("Sonyl")
print(my_class)
# => ["James", "Zoe", "Steve", "Nhu", "Paulo", "Sonyl"]
```

#### `insert()`

To add an element in a list at a specific index, use `list_name.insert(index, item)`. For example:

```python
my_class = ["James", "Zoe", "Steve", "Nhu", "Paulo", "Sonyl"]

my_class.insert(1, "Kelly")
print(my_class)
# => ["James", "Kelly", "Zoe", "Steve", "Nhu", "Paulo", "Sonyl"]
```

#### `pop()`

There are two ways to use `pop()`; with no parameters or with an index. **If no parameter is set, `pop()` will remove the last item from a list and return it**, otherwise it will remove the item at that specific index. For example:

```python
my_class = ["James", "Kelly", "Zoe", "Steve", "Nhu", "Paulo", "Sonyl"]

student_that_left = my_class.pop()
print(student_that_left, "has left the class.")
# => "Sonyl has left the class"
print(my_class)
# => ["James", "Kelly", "Zoe", "Steve", "Nhu", "Paulo"]

second_student_to_leave = my_class.pop(1)
print(student_that_left, "has left the class.")
# => "Kelly has left the class"
print(my_class)
# => ["James", "Zoe", "Steve", "Nhu", "Paulo"]
```

### Test it out! - 15 Minutes

1. Declare a list with the names of your classmates
2. Print out the length of that list
3. Add a new classmate
4. Print the 3rd name on the list
5. Delete the first name on the list
6. Move the last name on the list to be the second name

### Numerical List Operations

These actions can only be used with lists of numbers.

#### `sum()`

This is used when you want to add all the numeric items in your list. For example:

```python
# sum(numeric_list)

batting_avgs = [.328, .299, .208, .301, .275, .226, .253, .232, .287]
sum_avgs = sum(batting_avgs)
print("The total of all the batting averages is", sum_avgs)
# => 2.409
```

#### `min()` and `max()`

These will find the smallest and largest number in your list. For example:

```python
# max(numeric_list)
# min(numeric_list)

batting_avgs = [.328, .299, .208, .301, .275, .226, .253, .232, .287]
print("The highest batting average is", max(batting_avgs))
# => 0.328
print("The lowest batting average is", min(batting_avgs))
# => 0.208
```

### Test it out! - 15 Minutes

1. Declare a list of numbers
2. Print out the largest difference between numbers
3. Print the mean of all the numbers

#### `map() and lambda`

The map function iterates over whatever you pass it, and returns an object of the results after you apply a given function or `lambda` to it. You can then pass that object to say list or set, to have a useable data type.

```python
# Lets look at it for the 5th problem from lab 2
# Declare our array(list, but list is a function so we can't use it)
my_array = [1, 2, 3]
# Create our function that takes an array and number
def multiply_by(array, num):
# Now we're going to return a mapped object converted to a list, lambda actually eliminates the need for the function but for readability we will keep it.
#  x is the argument inside our array, and we are taking it and multiplying it by the num 
    return list(map(lambda x: x * num, array))
print(multiply_by(my_array, 2))
```

```python
# Here is how we could do it without the function
my_array = [1, 2, 3]
num = 3
new_array = list(map(lambda x: x * num, my_array))
print(new_array)
```

```python
# Here once again we're creating our function to pass into map, map will take the function and run it while iterating over the numbers tuple
def addition(n): 
    return n + n 
  
# This will return an object which we can then turn into a list, set or even tuple again 
numbers = (1, 2, 3, 4) 
result = map(addition, numbers) 
print(result)

# Here is how we can do that without writing a helper function, and just using lambda instead
numbers = (1, 2, 3, 4) 
result = map(lambda x: x + x, numbers) 
print(list(result)) 
```

## Additional Resources

* [Python Lists - Khan Academy Video](https://www.youtube.com/watch?v=zEyEC34MY1A)
* [Google For Education: Python Lists](https://developers.google.com/edu/python/lists)
* [Python-Lists](https://www.tutorialspoint.com/python/python_lists.htm)

