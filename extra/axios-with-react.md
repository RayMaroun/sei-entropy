# Axios with React {V02}

### Learning Objectives

_After this lesson, you will be able to:_

* Create a React component that calls an API

## Codealong - Kanye West Quotes

It is time for you to build a very simple component that shows a randomly generated Kanye West Quote. We'll do this using the [Kanye Rest](https://api.kanye.rest/). Before doing so, challenge yourself to a mini quiz.

**Q: Which React.Component method should API calls be made from?**

`componentDidMount()`. Per the [React documentation](https://facebook.github.io/react/docs/react-component.html#componentdidmount), _If you need to load data from a remote endpoint, this is a good place to instantiate the network request._

**Q: What does it mean to make `GET` request?**

We are asking the server to send us data to read. To `GET` means to "read."



## Axios Get

### Fetching Kanye in a React Component \(axios.get\)

`axios` is Promise based HTTP client for the browser and node.js! More detailed information can be found in their [README on github](https://github.com/axios/axios).

```javascript
import React, {Component} from 'react';

class Home extends Component {

  componentDidMount() {
      /* nothing here... yet! */
  }

  render() {
    return (
      <div>
        <h1>My favorite Kanye quote:</h1>
      </div>
    )
  }
}


export default Home
```

We can now tell our component to fetch a Kanye quote and then set it to our state. We do this by adding the `axios.get()` call inside of _componentDidMount\(\)_.

Calling `this.setState()` then triggers a re-_render_ inside of our component.

You should have this:

```javascript
import React, {Component} from 'react';
import axios from 'axios';

class Home extends Component {

  state = {
    kanye: ''
  }

  componentDidMount() {
    let kanyeRest = 'https://api.kanye.rest/';
    // fetch a poem
    axios.get(kanyeRest).then( response => {
      // set state
      this.setState{kanye: response.data.quote}
    }).catch(err => console.log(err))
  }

  render() {
    let quote = this.state.kanye;
    return (
      <div>
        <h1>My favorite Kanye quote:</h1>
        {quote}
      </div>
     )
  }
}
```

Let's test it out!

* Add an `if` statement under `render`.
  * This simply checks to be sure that `axios.get()` has completed before `render()` tries to return the movie - otherwise it returns "Loading...".
  * For this especially, it's important that the state is declared in the constructor. This way, the `if` statement does not fail if the asynchronous `setState()` hasn't completed the update yet.

```javascript
render() {
     let quote = this.state.kanye;
     if (this.state.kanye){
       return (
         <div>
           <h1>My favorite Kanye quote:</h1>
           {quote}
         </div>
       )
     }
     return (
       <div>
         <h1>My favorite Kanye quote:</h1>
         Loading...
       </div>
     )
  }
```

You're done! Your `home` page should load a random Kanye quote!



## Axios Post

```javascript
import React from 'react';
import axios from 'axios';

export default class PersonList extends React.Component {
  state = {
    name: '',
  }

  handleChange = event => {
    this.setState({ name: event.target.value });
  }

  handleSubmit = event => {
    event.preventDefault();

    const user = {
      name: this.state.name
    };

    axios.post(`https://jsonplaceholder.typicode.com/users`, { user })
      .then(res => {
        console.log(res);
        console.log(res.data);
      })
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <label>
            Person Name:
            <input type="text" name="name" onChange={this.handleChange} />
          </label>
          <button type="submit">Add</button>
        </form>
          
      </div>
      
    )
  }
}
```

For more information than you probably ever wanted to know about fetching data in React, these articles by Robin Weirauch make for a pretty complete resource:

* [How to Fetch Data in React](https://www.robinwieruch.de/react-fetching-data/)
* [Fetching Data with React Hooks](https://www.robinwieruch.de/react-hooks-fetch-data/) 
  * 🏴‍☠️ BEWARE! There be HOOKS here!   🏴‍☠️ 

