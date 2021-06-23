# Imperative and Declarative Programming

### Learning Objectives

_After this lesson, you will be able to:_

* Create a JavaScript function via declarative programming
* Create a JavaScript function via imperative programming
* Contrast imperative and declarative

## Programming Styles

You've made it pretty far through this module, awesome job so far!

Now's the time to grab some coffee, because we're going to throw some terminology at you. It's great that now you're proficient at React, but as you go forward with programming, there are some concepts that are worth thinking about.

## Imperative and Declarative Programming

Imperative and declarative programming are two terms that you might encounter if you hang out with developers long enough. Most developers begin by writing _imperative_ code. That is to say, most developers: 1. Outline what they need to do. 2. Write it out step by step.

Writing pseudocode is an excellent example of writing things out step by step the imperative way. For example, if we asked everyone in the room to say their name, we could conceptually write it out as follows:

```text
ask everyone in the room to line up
for every person in the line
  ask each person to come to the front of the room
  ask each person to then speak their name
```

So to step through this the imperative way of thinking, let's open this [CodePen](https://codepen.io/SuperTernary/pen/eEVVvg?editors=0010).

* Naturally, we could write that out in Javascript by creating an array of those people.

```javascript
let room = ['Superman', 'Black Panther', 'Wonder Woman', 'Iron Man']
```

> Note the ES6 syntax with 'let' instead of 'var'!

* Next, we could loop through them and assign each active speaker to a variable named _person_.

```javascript
let room = ['Superman', 'Black Panther', 'Wonder Woman', 'Iron Man']

for (let i = 0; i < room.length; i++) {
  let person = room[i]
}
```

* Finally, we have them speak their name - or in our case, we'll just _console.log\(\)_ their name out as represented by the _person_ variable.

```javascript
let room = ['Superman', 'Black Panther', 'Wonder Woman', 'Iron Man']

for (let i = 0; i < room.length; i++) {
  let person = room[i]
  console.log("Imperative way: " + person)
}
```

> Run this in CodePen and check the console tab. It works - we've built this function using the _Imperative_ way of thinking.

We have explicitly listed out each step, paying attention to each and every detail of what we needed to achieve.

* Imperative programming focuses on the _why_, _how_, _where_, and _when_ your code executes. It allows precise control over your code and allows for line-by-line code execution - you're writing every single thing that happens.

Now, let's break from this approach for just a moment. Below that function in CodePen \(leave the array!\), let's look at building something in the **declarative** manner.

Now, if we want to perform the same action, we could write our loop like so:

```javascript
room.forEach((person) => {
  console.log("Declarative way: " + person);
});
```

> Run it! It still lists the people in the room. Consider how much less code it took.

What happened? Well, Javascript has a built-in method that loops over arrays for you. `.forEach()` does the same thing that `for` loop you wrote above - except you had to write a lot less.

* `forEach` is a method in declarative programming. Instead of writing every single step yourself - instead of explicitly writing the _why_, _how_, _where_, and _when_ of your program - this method only cares about _what_ you want.

Instead of taking the time to write out a specific set of instructions to receive a result, you focus on just one thing: the result. This might sound a little confusing at first, so open up CodePen and try solving the following problem.

#### Practice: Applying a Discount to Items in a Shopping Cart

You notice that your favorite series is on sale this month. You've been holding off, but today is the day! You're going to pick it up and treat yourself. After filling your shopping cart up, you peruse the internet for a discount coupon. Finally, you found one! You furiously enter in `TREATYOSELF2017` into your cart's coupon code input box, and instantaneously your cart reflects the discounted prices. Success!

How is this discount coded?

An **imperative** approach might: 1. Declare an object consisting of the items in the cart with the original prices. 2. Loop through that object with a `for` loop, updating the price as it goes.

And this would be explicitly coded line by line, like this:

```javascript
// Imperative approach
// oh boy! Zelda games! On sale! I need them!
let items = [
  {
    title: 'Breath of the Wild',
    price: 49.99
  },
  {
    title: 'The Minish Cap',
    price: 29.99
  },
  {
    title: 'Twilight Princess',
    price: 49.99
  }
];

// calculate the discount of 50% off
let discountedItems = [];
// loop on through
for (let i = 0; i < items.length; i++) {
  // create a new item, update the sale price thanks to the coupon, and push into the discountedItems array
  discountedItems.push({
    title: items[i]['title'], // keep the title
    price: items[i]['price'] * 0.5  // update the price
  });
}
```

The imperative approach to writing code gives us full control of _how_ we add the updated price into the new array. In this case: 1. _When_ we create the object, we set the initial attributes. 2. We access attributes directly through indices that represent _which_ object and _what_ attribute we want to select. 3. _How_ we do this is by creating a new array and updating the values to push to the new object.

> Try it. Add `console.log(items); console.log(discountedItems);` and hit `run` in [this CodePen](https://codepen.io/SuperTernary/pen/brLLRb?editors=0011). It works!

This is fairly clean code, but we could write more succinct code using a **declarative** style. We'll use the array's built-in `.map` method to accomplish the same thing. We'll focus on _what_ we want — just the updated values — and we'll let `.map` take care of the _how_.

```javascript
let discountedItems = items.map((item) => {
  return {
    title: item.title,
    price: item.price * 0.5
  }
})
```

> Try it! This goes right after the "items" array declaration, replacing all the calculation code \(the `for` loop and the discountedItems array before that\).

Using the declarative approach, we declare that we intend to .map through an array and create a newly updated version of it.

_"But what if that method breaks?"_ you might be thinking. While a problem, you would know exactly what is broken - the `.map` method \(or, more likely, your syntax is incorrect\). This allows for easy debugging and testing. Consider how you would debug the imperative version of the code instead. How would your approach differ?

#### Wrapping It Up

Declarative and imperative are two different styles of writing code.

* Imperative is commonly found in object-oriented programming environments where you focus on a line-by-line execution path, working with objects.

With modern web development's focus on simplicity, some developers have been leveraging declarative techniques.

* React.js is one framework that uses a declarative approach. Vue.js is another. You'll find that many asynchronous JavaScript techniques rely on declarative programming techniques for ease of readability.

Neither method is incorrect, but declarative code tends to lead to DRY, clean code. And a final fun fact: Functional programming is a subset of declarative programming. If you've ever used a functional language, such as Haskell or Lisp, or written calculus, you've likely written declarative code.

