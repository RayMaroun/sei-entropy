---
description: will update it after the lecture
---

# Axios with React

### Learning Objectives

_After this lesson, you will be able to:_

* Create a React component that calls an API

#### Big Goal:

Create a react app that renders Posts from an external API. Through this code along we will cover the best place can call an API inside the Component Life cycle.

#### API URL:

We will use this fake API to build our App.

```javascript
const API_URL= 'http://localhost:5000';

// dont forget to go inside server and run
// npm run server so yyour server will work (API)
// Read API_DOC.js to understand
```

{% file src="../.gitbook/assets/4.a-server-starter-code.zip" caption="4.A server-starter-code" %}

{% file src="../.gitbook/assets/4.b-todo-list-axios-starter-code.zip" caption="4.B todo-list-axios-starter-code" %}

## Codealong - Todo List

It is time for you to build a very simple component that shows **TodoList**. Before doing so, challenge yourself to a mini quiz.

**Q: Which React Component method should API calls be made from?**

`componentDidMount()`. Per the [React documentation](https://facebook.github.io/react/docs/react-component.html#componentdidmount), _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

**Q: What does it mean to make `GET` request?**

We are asking the server to send us data to read. To `GET` means to "read."

## Axios Get

### Fetching Tasks in a React Component \(axios.get\)

`axios` is Promise based HTTP client for the browser and node.js! More detailed information can be found in their [README on github](https://github.com/axios/axios).

```javascript
import React, {Component} from 'react';

class App extends Component {
  constructor(props) {
    super();
    this.state = {
      tasks: ['eat', 'coding', 'sleep'],
    };
  }
  
  componentDidMount() {
      /* nothing here... yet! */
  }

  render() {
    return (
      <div className="app">
        <h1>APP</h1>
      </div>
    )
  }
}


export default App
```

We can now tell our component to fetch Tasks then set it to our state. We do this by adding the `axios.get()` call inside of _componentDidMount\(\)_.

Calling `this.setState()` then triggers a re-_render_ inside of our component.

You should have this:

```javascript
import React, {Component} from 'react';
import axios from 'axios';

class App extends Component {
  constructor(props) {
    super();
    this.state = {
      loading: false;
      tasks: ['eat', 'coding', 'sleep'],
    };
  }

  componentDidMount() {
    this.getAllTasks()
  }
  
  getAllTasks=()=>{
    const API_URL= 'http://localhost:5000/tasks';
    this.setState{loading: true}
    // fetch a poem
    axios.get(API_URL)
      .then( response => {
      // set state
      this.setState{tasks: response.data}
      this.setState{loading: false}
      })
      .catch(err => console.log(err))
  }

  render() {
  
   const newTasks = this.state.tasks.map((taskTitle, i) => {
      return <TodoItem title={taskTitle} key={i} />;
    });   
     
    return (
      <div className="app">
        <h3>APP</h3>
         {newTasks}
      </div>
     )
  }
}
```

Let's test it out!

* Add an `if` statement under `render`.
  * This simply checks to be sure that `axios.get()` has completed before `render()` tries to return the movie - otherwise, it returns "Loading...".
  * For this especially, it's important that the state is declared in the constructor. This way, the `if` statement does not fail if the asynchronous `setState()` hasn't completed the update yet.

```javascript
return (
      <div className="app">
        <h3>APP</h3>
        {this.state.loading ?
          (<p>Loading...</p>):({newTasks})
        }
      </div>
     )
```

You're done! Your `App` page should load tasks!

## Axios Post

```javascript
// this is not correct

import React, {Component} from 'react';
import axios from 'axios';

export default class NewItem extends Component {
  constructor(props) {
    super();
    this.state = {
      textInput: ';
    };
  }

  handleChange = (event) => {
    this.setState({ textInput: event.target.value });
  }

  handleSubmit = (event) => {
    event.preventDefault();
    this.props.addNewItem(this.state.textInput)
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>
            New Task:
            <input type="text" onChange={this.handleChange} />
          </label>
          <button type="submit">Add</button>
        </form>
      </div>
    )
  }
}
```

```javascript
import React, {Component} from 'react';
import axios from 'axios';

import NewItem from './components/NewItem'

class App extends Component {
  constructor(props) {
    super();
    this.state = {
      loading: false;
      tasks: ['eat', 'coding', 'sleep'],
    };
  }

  componentDidMount() {
    this.getAllTasks()
  }
  
  getAllTasks=()=>{
    const API_URL= 'http://localhost:5000/tasks';
    this.setState{loading: true}
    // fetch a poem
    axios.get(API_URL).then( response => {
      // set state
      this.setState{tasks: response.data}
      this.setState{loading: false}
    }).catch(err => console.log(err))
  }

  addNewTask=(newTitle)=>{
    const API_URL= 'http://localhost:5000/tasks';
    this.setState{loading: true}
    // fetch a poem
    axios.post(API_URL,{title: newTitle})
      .then( response => {
      // set state
      this.setState{tasks: response.data}
      this.setState{loading: false}
      })
      .catch(err => console.log(err))
    }
  
  render() {
  
   const newTasks = this.state.tasks.map((taskTitle, i) => {
      return <TodoItem title={taskTitle} key={i} />;
    });   
     
    return (
      <div className="app">
        <h3>APP</h3>
        <NewItem addNewItem={this.addNewTask}/>
         {this.state.loading ?
          (<p>Loading...</p>):({newTasks})
        }
      </div>
     )
  }
}
```

For more information than you probably ever wanted to know about fetching data in React, these articles by Robin Weirauch make for a pretty complete resource:

* [How to Fetch Data in React](https://www.robinwieruch.de/react-fetching-data/)
* [Fetching Data with React Hooks](https://www.robinwieruch.de/react-hooks-fetch-data/) 
  * 🏴‍☠️ BEWARE! There be HOOKS here!   🏴‍☠️ 

