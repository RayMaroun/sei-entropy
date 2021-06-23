# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

## Quiz Time

1. Fork and Clone this repo.
2. Put your answers in this file.
3. You may use any resource except each other.
4. Submit a pull request when you're done.

### Questions:

_Prompt_:  You have a main component, `Milkshake.js`, which imports and will render UI from a component `Ingredients.js`. Which file does the below code go in?

```js
ReactDOM.render(
  <Ingredients />,
  document.getElementById('root')
);
```

_Choices_:

1. `Milkshake.js`
2. `Ingredients.js`

```
PUT YOUR ANSWER HERE
```


-----------------------------------

_Prompt_:  A component is being passed a prop named `flavor`. What JSX would the component return in its `render` method to display the prop in a paragraph?

_Choices_:

1. `<p>My favorite ice cream is {this.props.flavor}!</p>`
2. `<p>My favorite ice cream is {props.this.flavor}!</p>`
3. `<p>My favorite ice cream is {props.flavor}!</p>`
4. `<p>My favorite ice cream is {this.flavor}!</p>`

```
PUT YOUR ANSWER HERE
```


-----------------------------------

_Prompt_:  Is this a valid Component declaration?

```js
  class Paintings extends Component {
    render () {
      return (
        <h1>Hello World!</h1>
        <h3>It is time for tea.</h3>
      );
    }
  }
```

_Choices_:

1. Yes
2. No

```
PUT YOUR ANSWER HERE
```


----------------------------------

_Prompt_:  Is this a valid way to, in a file called `Spices.js`, render the JSX that the `Cinnamon` component returns to the screen?

```js
ReactDOM.render(
  <Cinnamon>,
  document.getElementById('root')
);
```

_Choices_:

1. Yes
2. No

```
PUT YOUR ANSWER HERE
```


----------------------------------

_Prompt_: What, specifically, happens when this method is called?

```js
ReactDOM.render(
  <Kangaroos />,
  document.getElementById('root')
)
```

_Choices_:

1. The `ReactDOM.render` method generates a virtual DOM node containing whatever content the `Kangaroos` component returns, and appends that to the element with an ID of `root`. Then, React compares the virtual DOM to the regular DOM and updates on the webpage only the elements that have changed.

2. The `ReactDOM.render` method generates a virtual DOM node containing whatever the JSX that the `Kangaroos` component returns. React then reloads the entire webpage, changing only the element with an ID of `root`.

3. The `ReactDOM.render` method returns JSX to the `Kangaroos` component, and the `Kangaroos` component returns a virtual DOM node. React updates on the webpage only the elements specified in `Kangaroos` that have changed.

4. The `ReactDOM.render` method generates a new element with an ID of `root`, which it populates with the JSX returned from the `Kangaroos` component. React updates the virtual DOM to have this new element, which the browser sees to dynamically change the page with the new element on it.

```
PUT YOUR ANSWER HERE
```



-----------------------------------

_Prompt_:  If you have multiple components written in a single file, you can then have multiple default export statements at the bottom of that file - one for each component.

_Choices_:

1. True
2. False

```
PUT YOUR ANSWER HERE
```


----------------------------------

_Prompt_:  What is React.js?

_Choices_:

1. A framework created by developers at Facebook. It is aimed at being the 'view' of your Javascript application. It focuses on creating a component-based architecture.
2. A boilerplate that eliminates displaying JSON retrieved from your server. It updates the model portion of your web application to dynamically render UI.
3. A library of independent, reusable pieces of user interface that you can call upon to add variability to your application.
4. All of the above

```
PUT YOUR ANSWER HERE
```


-----------------------------------

_Prompt_:  Take a look at the following React file. Choose the reason(s) it won't run properly.

```js
import React from 'react';
import ReactDOM from 'react-dom';
import Store from './Store.js';

const groceryList = {
  important: "milk",
  spices: [
    "pepper",
    "salt"
  ]
}

ReactDOM.render(
  <Store
    buy_me={groceryList.milk}
    me_too={groceryList.spices}
  >,
  document.getElementById('root')
);
```

_Choices_:

1. The `Store` component call needs to end with `/>`, not just `>`
2. The prop name and variable name need to match - `buy_me` needs to be `milk` and `me_too` needs to be `spices`
3. The `const groceryList` declaration needs to be inside the `render` method
4. When passing the props into `Store`, the syntax is `this.groceryList.important` and `this.groceryList.spices`

```
PUT YOUR ANSWER HERE
```



----------------------------------


_Prompt_:  How could you use `create-react-app` to create a new app called `jungle_maze`?

_Choices_:

1. `create-react-app npm/start jungle_maze`
2. `create-react-app jungle_maze.js`
3. `create-react-app jungle_maze`
4. `create-react-app index/jungle_maze.js`

```
PUT YOUR ANSWER HERE
```


----------------------------------

_Prompt_:  If I'm displaying multiple nested components, assuming the `Flowers` component is being passed all necessary props and the `Daisy` component is imported and written correctly, is this valid syntax?

```js
import React, { Component } from 'react';
import Daisy from './Daisy.js';

class Flowers extends Component {
  render() {
    let allDaisies = [
      <Daisy body={this.props.spring} />,
      <Daisy body={this.props.rabbits} />
    ]

    return (
      <div>
        <h1>{this.props.favorites}</h1>
        <h3>Daisies:</h3>
        {allDaisies}
      </div>
    );
  }
}
```

_Choices_:

1. Yes
2. No

```
PUT YOUR ANSWER HERE
```


----------------------------------

_Prompt_: Where does `constructor()` go, and when do you need it?

Choices:

1. At the top of the component class; you always need it for accurate setup of that class.

2. At the top of the component class; you only need it if you are changing any initial configurations for that class.

3. In the component class' `render()` method; you always need it for accurate setup of that class.

4. In the component class' `render()` method;  you only need it if you are changing any initial configurations for that class.

```
PUT YOUR ANSWER HERE
```