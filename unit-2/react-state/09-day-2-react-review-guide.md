# React Review Guide \[2\]

## ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

### Review Guide: React State

Below, you'll find key terms, key concepts, key code snippets, and further reading - all covering the basics of React state and binding.

#### Key Terms & Definitions

* **Constructor**
  * A constructor is only called once, when the component is initially created.
  * Constructors say, "When you create an instance of this class, do this."
  * If you aren't doing anything special, you don't need to define a constructor method
    * It happens automatically for you using the default constructor inherited from the basic class \(in our case, the `Component` class\)
  * If you have a defined constructor method, the first line of it will always be `super()`.
    * `super()` means: "When this class is created, you should still do the default initialization for this class."
  * Refer to the "Key Code Snippets - Constructor" section below for an example
* **Map**
  * While not a key concept for React, map is a very handy thing to know.
  * A map is like a `for` loop.
    * With `map`, you make a new variable and with it iterate through each item in an array.
  * Refer to the "Key Code Snippets - Map" section below for examples.
* **State**
  * A `state` is in a component. It is similar to a `prop`, but it is used for data that changes over time.
  * Like `props`, which we access with `this.props.val`, we can access `state` values using `this.state.val`
  * Set initial state in the `constructor` method of a component, creating a name and an initial value
  * `state` just represents the state of data on our page. Something saved to `state` in React is not automatically saved to a database or to local storage. If you refresh the page, all `state` is lost.
  * Refer to the "Key Code Snippets - State" section below for examples

#### Key Concepts

* **What triggers a UI change:**
  * In a React component, an update in either the `state` or `props` will trigger the method cascade that can lead to a `render`.
  * Our component calculates the difference \("diff"\) between the current DOM and the virtual DOM node
  * Then, it figures out how to update the state of the DOM in as few manipulations as possible
    * It only replaces the current DOM with parts that have changed.
    * This is one of React's core advantages.
* **Do not:**
  * Don't automatically render elements on the DOM _inside_ their own component class definitions.
    * In a component class, you should define a `render` method for that component.
    * That class then is called by `ReactDOM.render` in **a different place, outside that class definition** \(likely `index.js`\).
  * In some tutorials or older code, you may find examples of `ReactDOM.render` inside a component, but you should avoid this at all costs; this was an older technique used in past versions of React.
* **Important Reminder**
  * Remember that `state` and `props` are not the same thing.
    * `State` represents the _state_ of your user interface component, and is changeable based on a user action \(e.g. clicking a button to increase mood\)
    * `props` are passed in to a component and not changeable by that component \(e.g. the user's name might be passed in to be displayed\)

#### Key Code Snippets - Constructor

**A component with an empty constructor**

```javascript
class Hello extends Component {
  // what should happen when the component is first created
  constructor() {
    // make call to parent class' (Component) constructor
    super();
  }

  // what should the component render
  render() {
    //  ....
  }
}
```

#### Key Code Snippets - Map

**General `map` Syntax**

```javascript
let <new_Variable_Name> = <the_Array_We_Are_Iterating>.map((local_Variable_Name_to_Loop, index) => (
  <what_To_Do_With_Each_Item_in_Loop>
));
```

**Specific `map` Example** Here's a simple example that makes a new array by adding `!` to each element of an array:

```javascript
const phrases = ['ice cream', 'dinosaurs', 'hobbits']; // the array

const excitedPhrases = phrases.map((phrase, index) => {
  return newPhrase = phrase + '!';
});
// excitedPhrases is ["ice cream!", "dinosaurs!", "hobbits!"]
```

#### Key Code Snippets - State

**Setting an initial state**

```javascript
constructor(props) {
  // make call to parent class' (Component) constructor
  super(props);
  // define an initial state
  this.state = {
    moodPoints: 1 // initialize this.state.moodPoints to be 1
  };
}
```

**Changing a state's value**

```javascript
increaseMood(e) {
  this.setState({
    moodPoints: this.state.moodPoints + 1
  });
}
```

**Using a state's value**

```markup
<p>You are this happy: {this.state.moodPoints}</p>
```

#### Further Reading

The links below are optional, but they're great resources for you.

* [Official React Documentation on State and Lifecycle](https://facebook.github.io/react/docs/state-and-lifecycle.html).
  * Specifically, this covers what should and should not go in state.

This is a list of documentation to help you learn more about binding and events:

* [React form documentation](https://facebook.github.io/react/docs/forms.html)
* [A list of events React supports](https://facebook.github.io/react/docs/events.html#supported-events)
* [How to handle events](https://facebook.github.io/react/docs/handling-events.html)

