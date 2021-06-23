# 5. Pass props through React Router

### App.js

1. Create a `proceduresArray` with an array of the hard coded procedures from `Prodecures.js`
2. Pass props to the Prodecures Component Route: `<Route path='/procedures' component={() => <Procedures procedures={proceduresArray} />} />`

```javascript
// rcc
import React, { Component } from 'react';
import { BrowserRouter as Router, Route, Link } from 'react-router-dom';

import './App.css';

import Home from './components/Home';
import Contact from './components/Contact';
import Procedures from './components/Procedures';

export default class App extends Component {
  constructor(props) {
    super(props)
  
    this.state = {
      proceduresArray = [
        'General Checkups',
        'Teeth Cleaning',
        'Cavity Screenings',
        'Cavity Fillings',
        'Chipped Tooth Fixings',
        'Tooth Removal',
        'Root Canals',
      ]
    }
  }

  render() {
    console.log(proceduresArray);
    return (
      <Router>
        <div className="app">
          <h3>APP</h3>
          <nav>
            <Link to="/">HOME</Link> {' || '}
            <Link to="/contact">CONTACT</Link> {' || '}
            <Link to="/procedure">PROCEDURE</Link>
          </nav>

          <Route exact path="/" component={Home} />

          <Route path="/contact" component={Contact} />

          <Route
            path="/procedure"
            render={(props) => <Procedures {...props} elementsArr={this.state.proceduresArray} />}
          />

        </div>
      </Router>
    );
  }
}

/* 
pass props 

<Route
  path="/"
  render={(props) => <Home {...props}/>}
/>

*/
```

### Procedures.js

1. Pass props to the functional component
2. `.map` over the `props.procedures` array
3. Insert the new array into the return method

```javascript
import React, { Component } from 'react';

export default class Procedures extends Component {
  render() {
    const liArr = this.props.elementsArr.map((elem, i) => {
      return <li key={i}>{elem} </li>;
    });

    return (
      <div className="procedures">
        <p>Procedures</p>
        <ul>
          {liArr}
        </ul>
      </div>
    );
  }
}
```

## Additional Resources

* \*\*\*\*[**Pass props in React Router**](https://learnwithparam.com/blog/how-to-pass-props-in-react-router/)\*\*\*\*
* \*\*\*\*[**Map over props in stateless component**](https://stackoverflow.com/questions/52745604/how-to-use-es6-map-function-in-react-stateless-component)\*\*\*\*
* \*\*\*\*[**Pass props to a component rendered by React Router v4**](https://ui.dev/react-router-v4-pass-props-to-components/)\*\*\*\*

