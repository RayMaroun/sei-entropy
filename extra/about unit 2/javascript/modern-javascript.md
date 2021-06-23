# Modern JavaScript

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/software-engineering-immersive/)

## Modern JavaScript

### Agenda

1. Strict mode
2. Arrow functions
3. forEach
4. Map
5. Filter
6. Reduce
7. Keep Going
8. Practice

## Strict mode

It's time to take the training wheels off JavaScript and start using its strict mode to eliminate some of JavaScripts silent errors by changing them to throw errors. And, as a nice side effect, we end up helping JavaScript engines to perform optimizations on our code to run it faster.

```javascript
'use strict';
```

Examples of strict mode in action:

```javascript
'use strict';
                       // Assuming a global variable mistypedVariable exists
mistypeVariable = 17;  // this line throws a ReferenceError due to the 
                       // misspelling of variable
```

```javascript
'use strict';

// Assignment to a non-writable global
var undefined = 5; // throws a TypeError
var Infinity = 5; // throws a TypeError
var NaN = 5; // throws a TypeError
```

**Resources:**

1. [MDN: Strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode)
2. [MDN: Transitioning to strict mode](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode/Transitioning_to_strict_mode)
3. [CanIUse: ECMAScript 5 Strict Mode](https://caniuse.com/#feat=use-strict)

## Arrow functions

ES6 introduces a new syntax for writing anonymous functions in JavaScript. It has a much more concise syntax and should be easier to pick up after using function expressions. Arrow functions gets its name from its syntax `=>`, which in other languages, is knows as: the fat arrow, the rocket or the Lambda operator.

**Example 1:**

```javascript
// Function Declaration
function sayHello() {
  console.log('Hello World!');  // Block of statements
}

// Function Expression
const sayHello = function() {
  console.log('Hello World!');  // Block of statements
}

// Arrow function expression
const sayHello = () => {
  console.log('Hello World!');  // Block of statements
}

// Arrow function expression (compact)
const sayHello = () => console.log('Hello World!');  // Expression

// Arrow function expression (compact) with single param
const greetWorld = greeting => console.log(`${greeting} World!`); // Expression

// Arrow function expression (compact) with single param & return value
const greetWorld = greeting => `${greeting} World!`;  // Expression
```

**Example 2:**

```javascript
// Function Declaration
function add(x, y) {
  return x + y;
}

// Function Expression
const add = function(x, y) {
  return x + y;
}

// Arrow function expression
const add = (x, y) => {
  return x + y;
}

// Arrow function expression with implicit return
const add = (x, y) => x + y;
```

### **Lab: \(15 mins\)**

**Convert the following functions to arrow functions.**

```javascript
function addFive(num) {
  return 5 + num;
}

function divide(num1, num2) {
  return num1 / num2;
}

function whoIsTheBestStudent() {
  const studentName = 'Haya';
  console.log(studentName);
}
```

**Create a function called fullName**

`fullName` receives two parameters, `first` and `last` and returns the full name.

**Steps:**

1. Use the function keyword to write a function expression
2. Rewrite using an arrow function
3. Rewrite and use implicit return

**Turn sayHello into an arrow function**

```javascript
function sayHello(name = "World") {
  console.log("Hello " + name);
}

sayHello();
```

**Resources:**

1. [MDN: Arrow functions](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions)
2. [ES6 In Depth: Arrow functions" on hacks.mozilla.org](https://hacks.mozilla.org/2015/06/es6-in-depth-arrow-functions/)

## forEach

JavaScript has a lot of different types of loops available for you to use. But when dealing with Arrays or iterable objects, the `forEach` method is one of the more easier and cleaner ones to use.

It executes a function callback for each array item it is iterating on. The function callback provides you the value and index for the current item being iterated on.

Though, one downside of using the `forEach` method is that there is no way to break the loop other then by throwing an exception. If you need such behavior, the `forEach()` method is the wrong tool for the job.

Lastly, the `forEach` method always returns the value `undefined`.

**Example 1: Using forEach**

```javascript
const instructors = ['Usman', 'Mohammad', 'Hisham', 'Sager'];

// Print each instructor
instructors.forEach(function(element) {
  console.log(element);
});


// Print each instructor along with their Array index
instructors.forEach(function(element, index) {
  console.log(element, index);
});
```

**Example 2: Converting a for-loop to forEach**

```javascript
const instructors = ['Usman', 'Mohammad', 'Hisham', 'Sager'];
const instructorsCopy = [];

// For Loop
for (let i = 0; i < instructors.length; i++) {
  instructorsCopy.push(instructors[i]);
}

// forEach Loop
instructors.forEach(function(item){
  instructorsCopy.push(item);
});
```

### **Lab: \(25 mins\)**

1. Say Hi

   ```javascript
    const friends = ["Abdulhamid", "Amirah", "Roba"];

    // For each friend in friends, print "Hi friendName!"
    // Write your solution here
   ```

2. Crazy Numbers

   ```javascript
    // That's an array with crazy numbers we cant read 😯
    const nums = [103440, 3799.2663, 3.14159265359, 859494, 59439];
    let total = 0;

    // Sum all the numbers in nums and save the result in total
    // Write your solution here
   ```

3. Crazy number again!!

   ```javascript
    // These crazy numbers now are strings 😯 😯  !!  
    const stringNumbers = ["103440", "3799.2663", "3.14159265359", "859494", "59439"];
    let totalNumbersUnder4000 = 0;

    // Convert numbers from strings to numbers and 
    // sum all numbers under 4000 and store them 
    // in totalNumbersUnder4000
    //
    // Write your solution here
   ```

**Resources:**

1. [MDN: forEach\(\)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)

## map

#### What:

Use the values from an array to build a new array. In other words: Map the values from one array into another new array and return that new array.

#### How:

Like `forEach`, map will one-by-one pass the values from the array into your callback function. You must return a value in your callback function, and this will be the value that appears in the new array.

#### Examples:

**Create a new array where all the values from the old array are capitalized.**

```javascript
var names = ["tim thompson", "ilias iliad", "elie ellison", "markus mourning"];

// old way with for loop
var cased = [];
for (var i = 0; i < names.length; i++) {
  cased.push(names[i].toUpperCase());
}
console.log(cased);

// new way with `map`
var cased = names.map(function (person) {
  return person.toUpperCase();
});
console.log(cased);

// Should output
// > ['TIM THOMPSON', 'ILIAS ILIAD', 'ELIE ELLISON', 'MARKUS MOURNING']
// > ['TIM THOMPSON', 'ILIAS ILIAD', 'ELIE ELLISON', 'MARKUS MOURNING']
```

**Use `map` to create an array of objects with a `firstName` property and a `lastName` property**

```javascript
var names = ["tim thompson", "ilias iliad", "elie ellison", "markus mourning"];

function splitName(fullName) {
  return {
    firstName: fullName.split(" ")[0], 
    lastName: fullName.split(" ")[1]
  }
}

var objNames = names.map(splitName);

console.log(objNames);

// Should output
// > [ { firstName: 'tim', lastName: 'thompson' },
  { firstName: 'ilias', lastName: 'iliad' },
  { firstName: 'elie', lastName: 'ellison' },
  { firstName: 'markus', lastName: 'mourning' } ]
```

**Challenge: Modify `splitName` to account for the possibility of a middle name that will store as a `middleName` property.**

```javascript
var names = ["tim toby thompson", "ilias iliad", "elie ellison", "markus mary mourning"];

function splitName(fullName) {
  var nameArr = fullName.split(" ")
  var nameObj = {firstName: nameArr[0]};
  if(nameArr.length===3) {
    nameObj.middleName = nameArr[1];
    nameObj.lastName = nameArr[2];
  } else {
    nameObj.lastName= nameArr[1];
  }
  return nameObj;
}

var objNames = names.map(splitName);

// Should output
// > [ { firstName: 'tim', middleName: 'toby', lastName: 'thompson' },
  { firstName: 'ilias', lastName: 'iliad' },
  { firstName: 'elie', lastName: 'ellison' },
  { firstName: 'markus', middleName: 'mary', lastName: 'mourning' } ]
```

**Use `map` to create a new array `strNums` that holds the same values as `intNums` but as strings instead of integers**

```javascript
var intNums = [0, 1, 2, 3, 4, 5]

var strNums = intNums.map(function(elem){
  return elem.toString();
  });

console.log(strNums);
```

**Resources:**

1. [Learn & Understand JavaScript’s Map Function](https://codeburst.io/learn-understand-javascripts-map-function-ffc059264783)
2. [MDN: .map\(\)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map)
3. [Video: Map](https://youtu.be/bCqtb-Z5YGQ)

### **Lab: \(20 mins\)**

1. Multiply by 100

   ```javascript
    const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let times100 = [];

    // Write your solution here
   ```

2. Capitalize Capitalize all the strings in the IA's array and store them in the array capitalizedIA.

   ```javascript
    const iAS = ['sager', 'hisham'];
    let capitalizedIAs = [];

    // Write your solution here
   ```

3. Abbreviations

   ```javascript
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    let dayAbbreviations = [];

    // Find the abbreviation of all days and add them to dayAbbreviations Array
    // Write your solution here
   ```

#### 

## filter

#### What:

Returns a subset of the original array by iterating through the original array and filtering out values.

#### How:

Your callback must return a boolean. `filter` will one-by-one pass the values from the array into your callback. If the callback returns `true`, that element is included in the returned new array, otherwise it is excluded.

#### Examples:

**Use `filter` to get 2 new arrays - one that contains names of even length only and one that contains names of odd length only**

```javascript
var names = ["tim", "ilias", "elie", "markus"];

var isEven = function (name) {
  return name.length % 2 === 0;
};
var isOdd = function (name) {
  return name.length % 2 !== 0;
};

var evenLengthNames = names.filter(isEven);
var oddLengthNames = names.filter(isOdd);

console.log(evenLengthNames);
console.log(oddLengthNames);

// Should output
// > ["elie", "markus"]
// > ["tim", "ilias"]
```

**Use `filter` to return an array of dogs.**

```javascript
var pets = [ {name: "fluffy", age: 2, type: "cat"}, {name: "fido", age: 1, type: "dog"}, {name: "nelly", age: 64, type: "parrot"}, {name: "benedict", age: 1, type: "sea cucumber"}, {name: "spot", age: 10, type: "dog"}, {name: "magic", age: 9, type: "cat"}]

var dogs = pets.filter(function(pet){
    return pet.type==="dog";
})

console.log(dogs);
```

**Resources:**

1. [Learn & Understand JavaScript’s Filter Function](https://codeburst.io/learn-understand-javascripts-filter-function-bde87bce206)
2. [MDN: .filter\(\)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)

### **Lab: \(15 mins\)**

1. Only get the numbers that are divisible by 3

   ```javascript
    const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    // Write your solution here
    console.log(result);
   ```

2. Create an array of names \(maybe use 3 of your friends\)

   Requirements:

   1. Use filter to return the names with the letter "a" in them
   2. Use Arrow function
   3. Use implicit return

      ```javascript
      const names = ['Bader', 'Ali', 'Afnan'];
      // Write your solution here
      console.log(result);
      ```

3. century20

   ```javascript
    const years = [1989, 2015, 2000, 1999, 2013, 1973, 2012];
    let century20 = []; 

    // century20 should be: [1989, 2000, 1999, 1973]
    // Write your solution here
   ```

#### 

## reduce

#### What:

Iterates over an array and turns it into one, accumulated value. In other words, you _reduce_ a collection of values into one value. _\(In some other languages it is called `fold`.\)_

#### How:

Your callback must take _two_ arguments: \(1\) accumulated value/total \(2\) new/original array value. The value that your callback returns will be the new `total`.

By default, `total` will start out as the 0th element in the array and `new` will be the element at index 1.

#### **Example**

```javascript
var nums = [1,2,3,4];
var add = function (total, new) {
  return total + new;
};

var sum = nums.reduce(add);
console.log(sum);

// Should output:
// > 10
// which is, 1 + 2 + 3 + 4
```

**Alternative Initial Value**

If you want to start with a different `total` than 0th element, you can pass a second argument into `filter`, and it will start by passing _this_ value in as `total`, and the 0th element as `new`.

```javascript
var nums = [1,2,3,4];
var add = function (total, item) {
  return total + item;
};

var sum = nums.reduce(add, 10);
console.log(sum);

// Should output:
// > 20
// which is, 10 + 1 + 2 + 3 + 4
```

**Resources:**

1. [Learn & Understand JavaScript’s Reduce Function](https://codeburst.io/learn-understand-javascripts-reduce-function-b2b0406efbdc)
2. [MDN .reduce\(\)](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce)
3. [Video: Reduce](https://youtu.be/Wl98eZpkp-c)

### **Lab: \(15 mins\)**

1. Sum

   ```javascript
    const nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    let sum;

    // Write your solution here

    console.log(sum);
   ```

2. Crazy Numbers

   ```javascript
    // Thats an array with crazy numbers we cant read 😯
    const nums = [103440, 3799.2663, 3.14159265359, 859494, 59439];
    let total = 0;

    // Sum all the numbers in nums and save the result in total
    // Write your solution here
   ```

3. Crazy number again!!

   ```javascript
    // These crazy numbers now are strings 😯 😯  !!  
    const stringNumbers = ["103440", "3799.2663", "3.14159265359", "859494", "59439"];
    let totalNumbersUnder4000 = 0;

    // Convert numbers from strings to numbers and 
    // sum all numbers under 4000 and store them 
    // in totalNumbersUnder4000
    //
    // Write your solution here
   ```

#### Keep Going

There are a lot of features in ES6 that we have not covered:

* [Destructuring](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring_assignment)
* [Rest parameters](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters)
* [Spread operator](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)

## Practice

### **Map**

There's a sale going on! Create a variable called `discountProducts` that takes all the objects in products and cuts the price by 50%.

```javascript
const products = [
  {name: 'flower vase', price: 75},
  {name: 'lamp', price: 85},
  {name: 'jar of honey', price: 95},
  {name: 'coil', price: 65},
  {name: 'lumber', price: 55}
];

// Write your solution here

console.log(discountProducts);
```

### **Filter**

Create a variable called `cheapProducts` that contains an array of objects for all products that cost less than 70.

```javascript
const products = [
  { name: 'flower vase',   price: 75 },
  { name: 'lamp',  price: 85 },
  { name: 'jar of honey',   price: 95 },
  { name: 'seashell frame', price: 65 },
  { name: 'lumber',  price: 55 }
];

// Write your solution here

console.log(cheapProducts);
```

### **Reduce**

Create a variable called `totalPrice`, and use `.reduce` to get the sum of all prices.

```javascript
const products = [
  {name: 'flower vase', price: 75},
  {name: 'lamp', price: 85},
  {name: 'jar of honey', price: 95},
  {name: 'coil', price: 65},
  {name: 'lumber', price: 55}
];

// Write your solution here

console.log(totalPrice);
```

**Given the following arrays:**

```javascript
const smallNums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 0]

const nums = [ 37, 826, 209, 419, 309, 48, 738, 709,728, 607, 9, 863, 976, 588, 611, 164, 383, 261, 14, 525, 479, 169, 755, 574, 330, 736, 541, 838, 577, 957, 179, 436, 333, 206, 295, 744, 926, 799, 691, 259, 401, 104, 630, 645, 722, 607, 587, 714, 446, 356, 18, 16, 14, 5, 13, 13, 17, 5, 5, 18, 12, 5, 18, 11, 2, 2, 9, 8, 4, 5, 18, 15, 18, 0, 6, 11, 18, 14, 2, 19, -14, 5, 18, 12, 3, 12, 7, 15, 5, 3, 12, 7, 6, 10, 3, 3, 3, 18, 12, 14 ]

const panagram = ['The', 'quick','brown','fox', 'jumps', 'over', 'the', 'lazy', 'dog']

const panagrams = [ 'The','job', 'requires', 'extra', 'pluck', 'and', 'zeal', 'from', 'every', 'young', 'wage', 'earner',  'Quick', 'zephyrs', 'blow,', 'vexing', 'daft', 'Jim', 'Two', 'driven', 'jocks', 'help', 'fax', 'my', 'big', 'quiz', 'Five', 'quacking', 'zephyrs', 'jolt', 'my', 'wax', 'bed', 'The', 'five', 'boxing', 'wizards', 'jump', 'quickly', 'Pack', 'my', 'box', 'with', 'five', 'dozen', 'liquor', 'jugs', 'We', 'promptly', 'judged', 'antique', 'ivory', 'buckles', 'for', 'the', 'next', 'prize', 'Jaded', 'zombies', 'acted', 'quaintly', 'but', 'kept','driving','their','oxen','forward' ]
```

**every**

* Determine if every number is greater than or equal to 0
* Determine if every word is shorter than 8 characters

**filter**

* Filter the array for numbers less than 100
* Filter words that have an even length

**find**

* Find the first value divisible by 5
* Find the first word that is longer than 6 characters

**findIndex**

* Find the index of the first number that is divisible by 3
* Find the index of the first word that is less than 2 characters long

**forEach**

* `console.log` each value of the nums array multiplied by 3
* `console.log` each word with an exclamation point at the end of it

**map**

* Make a new array of each number multiplied by 100
* Make a new array of all the words in all uppercase

**reduce**

* Add all the numbers in the array together using the `reduce` method
* Concatenate all the words using reduce

**some**

* Find out if some numbers are divisible by 7
* Find out if some words have the letter `a` in them

**sort**

* Try to sort without any arguments, do you get what you'd expect with the numbers array?
* Sort the numbers in ascending order
* Sort the numbers in descending order
* Sort the words in ascending order
* Sort the words in descending order

