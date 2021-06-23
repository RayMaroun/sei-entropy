# Section Summary

In this section, we dove deeper into React. Here's what we covered:

## Imperative and Declarative Programming

Declarative and imperative are two different styles of writing code.

* Imperative is commonly found in object-oriented programming environments where you focus on a line-by-line execution path, working with objects.
* Instead of writing every single step yourself - instead of explicitly writing the _why_, _how_, _where_, and _when_ of your program - declarative code only cares about _what_ you want. Instead of taking the time to write out a specific set of instructions to receive a result, you focus on just one thing: the result.

Neither method is incorrect, but declarative code tends to lead to DRY, clean code.

## Functional Components

Functional components are React components that are simply JavaScript functions. They take props as their argument and return JSX \(UI!\).

```javascript
const MyFunctionalComponent = props => (
  <div>
    The weather in {props.city} is currently {props.condition}. The temperature is {props.temperature}.
  </div>
)
```

## Component Lifecycle

React class components have lifecycle methods that are invoked at certain stages of a component's "life" on the DOM. Some of the lifecycle methods you'll use a lot are:

* `constructor()`: Initialize state, bind methods
* `componentDidMount()`: Make AJAX requests, get DOM refs, bind event listeners, set `state` if necessary
* `componentWillUnmount()`: Unbind event listeners, other cleanup
* `componentWillReceiveProps()`: Update `state` based on changes in components
* `render()`: Return markup/UI

## Unidirectional Data Flow

In React, data flows from the top down. Keep your data higher in your component tree so it's available to the sibling/children components that need it.

## Immutable Data

A React component's state and props are to be treated as immutable - never change them directly.

For `state`, use `setState`:

```javascript
handleChange(event) {
  this.setState((prevState, props) => {
    return {
      myPieceOfState: event.target.value
    };
  });
}
```

**Never change props in a component** - changes to props happen in the component that passes them down.

