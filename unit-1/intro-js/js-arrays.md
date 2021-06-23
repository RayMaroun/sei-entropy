# JS Arrays

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

## JavaScript Arrays

### Objectives

By the end of this, developers should be able to:

* Define an array
* Store, access, and update data values in arrays
* Iterate over items in an array

### Preparation

1. Fork and clone this repository
2. Create a new branch, `training`, for your work and change into it.

![images/arrays1](../../.gitbook/assets/arrays1.png)

![images/arrays2](../../.gitbook/assets/arrays2.png)

![images/arrays3](../../.gitbook/assets/arrays3.png)

![images/arrays4](../../.gitbook/assets/arrays4.png)

![images/arrays5](../../.gitbook/assets/arrays5.png)

![images/arrays6](../../.gitbook/assets/arrays6.png)

![images/arrays7](../../.gitbook/assets/arrays7.png)

![images/arrays8](../../.gitbook/assets/arrays8.png)

#### Code Along: Arrays

In JavaScript to represent a list we can use an [Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array). Elements in an `Array` or items in our list are ordered. JavaScript arrays are zero-indexed: the first element of an array is at index 0, and the last element is at the index equal to the value of the array's length property minus 1. Using an invalid index number returns `undefined`.

```javascript
// Create an empty array literal
const list = [];

// Create an array literal with values
const anotherList = ['Ahmed', 100, false, 2];

// Read value from an Array, use index
anotherList[0]; // 'Ahmed'
anotherList[2]; // false

// Update value in an Array, use index
anotherList[2] = true;
anotherList; // ['Ahmed', 100, true, 2]

// Add value to an Array, use index
anotherList[5] = 'Add Me';
anotherList; // ['Ahmed', 100, true, 2, undefined, 'Add Me']
```

### Array Methods

![images/arrays9](../../.gitbook/assets/arrays9.png)

![images/arrays10](../../.gitbook/assets/arrays10.png)

![images/arrays12](../../.gitbook/assets/arrays12.png)

![images/arrays11](../../.gitbook/assets/arrays11.png)

![images/arrays13](../../.gitbook/assets/arrays13.png)

![images/arrays14](../../.gitbook/assets/arrays14.png)

![images/arrays15](../../.gitbook/assets/arrays15.png)

### Iterating through Arrays

**Code Along: Iterate through an Array**

```javascript
const developers = ['Hazim', 'Reem', 'Mansour']

// Individually print message for each item in array
console.log('Hello ' + developers[0])
console.log('Hello ' + developers[1])
console.log('Hello ' + developers[2])
```

### Array Practice

1. Using `push` and `unshift`, make this array contain the numbers from zero through seven:

```javascript
const arr = [2, 3, 4];

// Your code 

arr; // => [0, 1, 2, 3, 4, 5, 6, 7]
```

1. What is _returned_ by `push`? Before throwing this into the console, form a hypothesis about what you think the return value will be:

```javascript
const arr = [5, 7, 9];
arr.push(6); // returns ???
```

1. Write a JavaScript console.log to get the last element of an array: Make this dynamic!

   \`\`\`js const arr1 = \[10, 9, 6, 5\]

   // Your code

\`\`\`

1. Starting with an empty array called `rainbowColors`:
   * Add "orange" to the end of the array
   * Add "red" to the start of the array
   * Add "yellow" to the end
   * Add "green", "blue", "indigo", and "violet" to the end of the array
     * Try and do this using _one_ method
   * Print the length of the array
   * Print the second item
   * Print the last item \(make this flexible/dynamic!\)
   * Print the index of the string "blue"
2. Find out the difference between `.slice` and `.splice`
   * Create an array called `twoColors` using one method - don't change the `rainbowColors` array! Essentially pull two colors out of the array \(say, between the index of 1 and 3\)
   * Starting with this array `const nums = [0, 1, 2, 2, 2, 3, 3, 4, 5];`, remove the duplicates _destructively_ using _slice_ or _splice_ \(whichever one is appropriate\)
3. Work with arrays of arrays
   * Starting with this array `const arrOfArrs = [["inner array first item", "inner array second item"], ["first", "second", "third"]];`
   * Access "inner array first item" and print it out"
   * Print "third" by using a dynamic index

### Array Methods Resources

* [https://www.w3schools.com/js/js\_array\_methods.asp](https://www.w3schools.com/js/js_array_methods.asp)
* [https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global\_Objects/Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)

  **Array Resources**

* [https://javascript.info/array](https://javascript.info/array)
* [https://javascript.info/array-methods](https://javascript.info/array-methods)
* [https://medium.freecodecamp.org/javascript-arrays-and-objects-are-just-like-books-and-newspapers-6e1cbd8a1746](https://medium.freecodecamp.org/javascript-arrays-and-objects-are-just-like-books-and-newspapers-6e1cbd8a1746)
* [https://www.codeanalogies.com/objects-arrays-practice/](https://www.codeanalogies.com/objects-arrays-practice/)

