# JS Objects

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

## JavaScript Objects

Exercising the JavaScript Reference Types.

### Objectives

By the end of this, developers should be able to:

* Store, access, and update data values in objects
* Iterate through an object and operate on its elements
* Define and use methods
* Use `this` keyword to reference object  

**Preparation**

1. Open **`W01D05`** folder**.**
2. Write your code in **`main.js`**.

### Introduction

Let’s create a person in JavaScript. We could use a variable and a string...

```javascript
const person = "Jouza";
```

To print our person’s name we could do...

```javascript
const person = "Jouza";
console.log(person);
```

Well a person has more than a name so let’s add an age and eye color.

```javascript
const person = "Jouza";
const age = 26;
const favColor = "Blue";
```

That data isn't grouped very well, they are all independent variables. We could use an array...

```javascript
const person = ["Jouza", 26, "Blue"];
```

To print our person’s name, age, and eye color we could do...

```javascript
const person = ["Jouza", 26, "Blue"];

console.log(person[0]); // Jouza

console.log(person[1]); // 26

console.log(person[2]); // Blue
```

Ok, now let"s print a sentence with our person in it like we might do on a webpage, maybe a profile.

```javascript
const person = ["Jouza", 26, "Blue"];

console.log("My name is: " + person[0] + ", and my fav color is: " + person[2], " and I am: " + person[1] + " years old."); 
```

There are other qualities we might want to add to describe our person like maybe species, number of legs, and number of arms. We could do…

```javascript
const person = ["John Doe", 150, "Blue", "Human", 2, 2];
```

Ok, now lets print a sentence with our person in it like we might do on a webpage again.

```javascript
const person = ["John Doe", 150, "Blue", "Human", 2, 2];

console.log("The great" + person[0] + ", with striking " + person[2] + " eyes, was a spry " + person[1] + " years old. A " + person[3] + "with " + person[4) + "legs and " + person[5] + " arms.");
```

Yikes, that doesn’t look very readable. It seems like we should use an object to organize our data better. Let’s create a person object and we might as well also separate the first and last name too.

```javascript
const person = {
  species: "human",
  legs: 2,
  arms: 2,
  firstName: "John",
  lastName: "Doe",
  age: 150,
  eyeColor: "Blue"
};
```

What if we want two different people. We could do

```javascript
const person2 = {
  species: "human",
  legs: 2,
  arms: 2,
  firstName: "Jane",
  lastName: "Doe",
  age: 120,
  eyeColor: "Green"
};
```

Now when we write our sentences again, it is much easier to read!

```javascript
const person = {
  species: "human",
  legs: 2,
  arms: 2,
  firstName: "John",
  lastName: "Doe",
  age: 150,
  eyeColor: "Blue"
};

console.log("The great" + person.firstName + " " + person.lastName + ", with striking " + person.eyeColor + " eyes, was a spry " + person.age + " years old. A " + person.species + "with " + person.legs + "legs and " + person.arms + " arms.");
```

### Objects

```javascript
const dictionary = {};
```

#### Demo: Objects

In JavaScript to represent a dictionary of data with key/value pairs, we can use an [Object](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics).

```javascript
// Create an empty object literal
const emptyDictionary = {};

// Create an object literal with values
const car = {
  make: 'Ford',
  model: 'Mustang',
  year: 1999
};

// Read value from an Object, use key
car['make']; // 'Ford'
car.make; // 'Ford'

// Update value in an Object, use key
car.make = 'Toyota';
car; // { make: 'Toyota', model: 'Mustang', year: 1999 }

// Add value to an Object, use key
car.topSpeed = 120;
car; // { make: 'Toyota', model: 'Mustang', year: 1999, topSpeed: 120 }
```

#### Code Along: Iterating through an Object

```javascript
const car = {
  make: 'Ford',
  model: 'Mustang',
  year: 1999
};

// Individually print message for each property of object
console.log(car.make);
console.log(car.model);
console.log(car['year']);

// Loop through object using key
for (const key in car){
  console.log(car[key]);
}
```

### Lab: The Reading List

Keep track of which books you read and which books you want to read!

* Create an array of objects, where each object describes a book and has properties for the `title` \(a string\), `author` \(a string\), and `alreadyRead` \(a boolean indicating if you read it yet\).

```javascript
const books = [
  { title: 'Harry Potter', author: 'JK', alreadyRead: true },
  { title: 'programming', author: 'null', alreadyRead: false },
  { title: 'Algorithm', author: 'Abdullah Aid', alreadyRead: true }
];
```

* Iterate through the array of books. For each book, log the book title and book author like so: "The Hobbit by J.R.R. Tolkien".
* Now use an if/else statement to change the output depending on whether you read it yet or not. If you read it, log a string like 'You already read "The Hobbit" by J.R.R. Tolkien', and if not, log a string like 'You still need to read "The Lord of the Rings" by J.R.R. Tolkien.'

### Lab: The Movie Database

It's like IMDB, but much much smaller!

* Create an object to store the following information about your favorite movie: `title` \(a string\), `duration` \(a number\), and `stars` \(an array of strings\).  


  ```javascript
  const movie_1 = {
    title: 'Puff the Magic Dragon',
    duration: 30,
    stars: ['Puff', 'Jackie', 'Living Sneezes'],
  };
  const movie_2 = {
    title: 'Inception',
    duration: 180,
    stars: ['Leonardo DiCaprio', 'Elliot Page'],
  };
  ```

* Print out the movie information like so: "Puff the Magic Dragon lasts for 30 minutes. Stars: Puff, Jackie, Living Sneezes."
  * Maybe the [join](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join) method will be helpful here
* Create an object to store the following information about your favorite movie: `title` \(a string\), `duration` \(a number\), and `stars` \(an array of strings\). 
* Print out the movie information like so: "Puff the Magic Dragon lasts for 30 minutes. Stars: Puff, Jackie, Living Sneezes."

#### Code Along: Collections

* Create a list of words \(string\) from a paragraph of text.

```javascript
const words = 'hi how are you Jouza test Jouza test hi how are you Ray test Ray test test Jaber test Jaber and Sameh Sameh';
```

* Create an object with each word as a key and the word frequencies \(how many times does each unique word appear in the string\) as the value.

```javascript
const obj = {
  hi: 0,
  how: 0,
  are: 0,
  you: 0,
  Jouza: 0,
  test: 0,
  Ray: 0,
  Jaber: 0,
  Sameh: 0,
  and: 0,
};
```

* Maybe the [join](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/join) method will be helpful here

### Object Methods

Keys of an object can also point to functions. We call those functions, methods!

```javascript
const car = {
  make: 'Ford',
  model: 'Mustang',
  year: 1999,
  drive: function(distance) {
    return "Vroooom! We drove " + distance + " miles";
  }
};

car.make; // 'Ford'
car.drive(20); // 'Vroooom! We drove 20 miles"
```

### Code Along: Television

Now, let's consider how we might model a TV. How could we do this in JavaScript? Together, we'll write out a JavaScript object that represents all of the features and behaviors of a TV listed below.

Let's assume that we're only concerned with using the TV, not selling it or anything like that.

When we interact with a TV, there's a shortlist of things that we typically do:

* Turn it on/off \(toggle power\).
* Increase or decrease the volume.
* Increase or decrease the channel.

In addition, there are a number of other features of the TV that might interest us:

* Is it a plasma/LCD/LED TV?
* What's the resolution?
* How much power does it consume?

### Code Along: Write Methods With `this`

### Lab: Self-Referential Objects

Meal tracking. In particular, you're going to create a 'User' object, complete with several 'Meals'.

A 'User' needs to have:

* a name \(`name`\)
* a date-of-birth \(`bornOn`\)
* a target daily calorie intake \(`calorieTarget`\)
* a list of 'Meals' that they've eaten \(`meals`\)

Every 'Meal' must have:

* a title \(`title`\), e.g. 'breakfast', 'lunch', 'dinner'
* a date \(`date`\), represented as a string e.g. '2016-06-25'
* a description \(`description`\)
* a number of estimated calories \(`calories`\)

Then, create the following methods for your instance of a 'User':

* `caloriesEatenOn`, which accepts a date \(in the format above\) and calculates

    the total number of calories consumed on that date.

* `avgDailyCalories`, which \(as indicated\), calculates the average number of

    calories consumed per day, rounded down to the nearest whole calorie.

* `onTrack`, which compares averageDailyCalories to the User's target daily

    calorie intake, and returns `true` if average caloric intake is at or below

    the target \(or `false` if the reverse is true\).

```javascript
const user = {
  name: 'Jhon Doe',
  boenOn: '13-9-1990',
  calorieTarget: 200,
  meals: [
    {
      title: 'breakfast',
      date: '2020-12-11',
      description: 'yummy',
      calories: 50,
    },
    {
      title: 'lunch',
      date: '2020-12-11',
      description: 'yummy yummy',
      calories: 100,
    },
    { title: 'dinner', date: '2020-12-11', description: 'yummy', calories: 25 },
    {
      title: 'breakfast',
      date: '2020-12-12',
      description: 'yummy',
      calories: 60,
    },
    {
      title: 'lunch',
      date: '2020-12-12',
      description: 'yummy yummy',
      calories: 110,
    },
    { title: 'dinner', date: '2020-12-12', description: 'yummy', calories: 35 },
    {
      title: 'breakfast',
      date: '2020-12-13',
      description: 'yummy',
      calories: 30,
    },
    {
      title: 'lunch',
      date: '2020-12-13',
      description: 'yummy yummy',
      calories: 90,
    },
    { title: 'dinner', date: '2020-12-13', description: 'yummy', calories: 10 },
  ],
  caloriesEatenOn: function (specificDate) {},
  avgDailyCalories: function () {},
  onTrack: function () {},
};
```

### Additional Resources

### Objects

* [Object Basics](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/Objects/Basics)
* [Working with Objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects)
* [Objects JS Info](https://javascript.info/object)
* [MDN `this`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/this)
* [Understand JavaScript's `this` with Clarity](http://javascriptissexy.com/understand-javascripts-this-with-clarity-and-master-it/)
* [`this` in JavaScript](https://john-dugan.com/this-in-javascript/)

### [License](lesson-w01d05-js-objects-master/LICENSE)

1. All content is licensed under a CC­BY­NC­SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or

    alternative licensing, please contact legal@ga.co.

