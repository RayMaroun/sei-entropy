# 7. Extra Lab: Calculator

Now, it's time for you to check back on everything! You will be building a calculator with React, and only minimal instructions have been provided for you to really think about what's happening.

At first, your calculator will just add 2 numbers together when they are typed in. For the bonus, you might decide to get more creative.

## Set Up

As usual, turn off the old react app by `Ctrl+C` then use this starter code  
run `npm i`  
run `npm start`

{% file src="../../.gitbook/assets/calculater-starter-code.zip" %}

## Step 1

Start Using the `App.js` as an example of how to create a basic component. Add the following JSX to your Calculator's `render()` function:

```markup
<div className="container">
  <h1>Add with React!</h1>

  <div className="add">
    <input type="text" />
    <span>+</span>
    <input type="text" />
    <span>=</span>
    <h3>Addition results go here!</h3>
  </div>
</div>
```

## Step 2

Set up the initial state of your component. What state attributes will you need to track? What values should those state items start with? Where is that state displayed in the browser?

{% hint style="info" %}
_Hint: You will only need one state_
{% endhint %}

## Step 3

Bind the inputs to an event so you can trigger a function when their values change. Consider: should it be a click event? A submit event? Something else? It's up to you!

Here is a lot of documentation to help you choose what you want to do and how to do it:

* [React form documentation](https://facebook.github.io/react/docs/forms.html)
* [A list of events React supports](https://facebook.github.io/react/docs/events.html#supported-events)
* [How to handle events](https://facebook.github.io/react/docs/handling-events.html)

Revisit the To-Do List project to see how we previously reacted to changing input text.

> Hint: Where should the event binding go? In the same component as it's being used - in fact, right on the input.

## Step 5

Once you've chosen how to bind your inputs to an event, you'll need to create a method. The method should accept the triggered event, get the input values from your form, add them together, and set part of the state to the new `sum`.

> Hint: Where should this method go? In the same component as it's being used - between the constructor and the render.
>
> Thought: How will you handle inputs that aren't numbers?

## Step 6

Once the state of the `sum` has been set, React will re-render the whole component. Make sure you have a place in your JSX that displays the result!

## Bonus

* Make the calculator work with any of the 4 basic arithmetic operations

  \(+, -, \*, /\). How will this change your `state` and your JSX?

