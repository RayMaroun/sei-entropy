# React Review Guide \[1\]

## ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

### Review Guide: Introduction to React

Below, you'll find key terms, key code snippets and tools, best practices, and further reading - all covering the basics of React.

#### Key Terms & Definitions

* **React**:
  * A framework created by developers at Facebook. It is aimed at being the 'view' of your Javascript application. It focuses on creating a component-based architecture.
* **Component**:
  * An independent, reusable piece of your user interface. A basic component looks like this:

    ```javascript
    class App extends Component {
    render() {
    return (
      <div>
        <h1>Hello World!</h1>
        <p>Howdy</h1>
      </div>
    );
    }
    }
    ```
* **JSX**:
  * A standard that React uses to represent HTML elements as XML tags. It looks like a template language but is much more powerful. Each JSX tag represents a React element, and a React class is composed of multiple elements. You express your visual user interface through nested JSX tags that can render additional components. JSX is not required for React, but it is incredibly useful.
  * JSX can look just like HTML, with `<h1>Hello world!</h1>`, but it can also get far more complicated.
* **Nested Component**:

  * Components called inside another component \(like calling Comment components within a blog Post\). Here is a diagram of the flow of information for a Comment component nested inside \(called by!\) a Post component:

  ![nested components chart](https://ga-instruction.s3.amazonaws.com/json/REACT/assets/unit1/nested_components_chart.jpg)

* **Props**:
  * Arguments passed into a component, as though they were arguments to a function. The component can then use this data to render something or pass the data on to another component. For example, your `App.js` could have

    ```javascript
    ReactDOM.render(
    <Hello name={"Carl Sagan"} />,
    document.getElementById('root')
    );
    ```

    And your `Hello.js` component could have

    ```javascript
    class Hello extends Component {
    render () {
    return (
      <h1>Hello {this.props.name}!</h1>
    )
    }
    }
    ```
* **Virtual DOM**:
  * A virtual representation, or abstraction, of the DOM. React doesn't apply your changes to the DOM directly. While it creates and manipulates elements, it does so through custom React objects. The results of that manipulation are then rendered to the DOM. This prevents you from having to focus on constantly changing the state of a `<div>` tag.
  * The virtual DOM is automatically updated in React with the method `ReactDOM.render()`
  * When your `index.js` is processed, your virtual DOM is compared to the regular DOM, and only the element specified in `ReactDOM.render()` on the page updates.

![Virtual DOM Diagram](https://ga-instruction.s3.amazonaws.com/json/REACT/assets/unit1/DOM.png)

#### Other Key Code Snippets and Tools

* `<Component_Name />` uses **the name of the component to render**. Inside the `Component_Name` component, you return the content to render \(in that component's render method\).
* `create-react-app`:
  * A tool created by Facebook that will help you set up a barebones React app instantly, so you can just install the package and get coding.
* `document.getElementById('root')` finds **the DOM element to append that content to**. This argument can be any element on the page. Here, we're simply appending it to an element with the id `root`.
* `export default`
  * Usages: `export default Hello;` or `export default Comment;`. There is always a component name that's exported!
  * This call, at the bottom of a file containing at least one component, specifies the default named component to be imported by files. The `default` keyword means that anything else we try to import anything from this file that the app can't find, JavaScript will automatically revert to importing the named component here instead.
  * Only one default export is allowed per file.
* `render()`
  * Every component has, at minimum, a `render` method. The `render` method is what renders the component to the screen, so it controls what is displayed for this component. From the `render` method, we return what we want to display - for example, some JSX like `<h1>Hello world!</h1>`
  * Importantly, each `return` can only support one outermost element, so often there is a `div` wrapping the rest of the JSX.

```javascript
class App extends Component {
  render() {
    return (
      <div>
        <h1>Hello World!</h1>
        <p>Howdy</h1>
      </div>
    );
  }
}
```

* `ReactDOM.render()`
  * In your topmost file \(for example, `index.js`\), this defines what will be put on the screen. In the example below, we are rendering what `Component_Name` returns at the `root` element on the page.
  * Usage:

    ```javascript
    ReactDOM.render(
    <Component_Name />,
    document.getElementById('root')
    );
    ```

#### Best Practices:

* Each component should be in a file unto itself.
  * Don't put multiple components into one Javascript file.
* Do not automatically render elements on the DOM _inside_ its own component class definition.
  * If you look through your files, you'll see in your component classes, you define a `render()` method for that component, which is great.
  * That class then is called by `ReactDOM.render()` in **a different place, outside that class definition** \(likely index.js\).
  * In some tutorials or older code, you may find examples of `ReactDOM.render()` inside a component.
  * You should **avoid** this at all cost; this was an older technique in past versions of React.

#### Further Reading

The links below are optional, but they're great resources for you to reinforce the learning here.

* [React.js Conf 2015 introduction](https://www.youtube.com/watch?v=KVZ-P-ZI6W4&feature=youtu.be&t=510)
  * We'd recommend starting around the 8:35 mark and watching until 16:30.
* [Official React Documentation on JSX](https://facebook.github.io/react/docs/jsx-in-depth.html)
  * This includes tutorials, documentation, and a community
* [More on the Virtual DOM](https://www.youtube.com/watch?v=-DX3vJiqxm4)
  * A 35 minute, in-depth video on everything involving the Virtual DOM
* [React without JSX](http://jamesknelson.com/learn-raw-react-no-jsx-flux-es6-webpack/).
  * A blog post on using React without JSX, in case you ever find yourself in this scenario

