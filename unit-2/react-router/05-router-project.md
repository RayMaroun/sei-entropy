# 6. Lab: Implement Router

### Recap

What have we learned so far?

* Single Page Applications have specific URLs that are routed to display

  different content.

* React Router is a third-party library that we can install and use with React.
* Since React Router isn't built in to React, we must import its components.
* React Router makes it easy for us to route URLs to components.
* React Router automatically manipulates modern browser history mechanics.

Now let's put that to the test!

```javascript
<Route
  path="THE_PATH_YOU_WANT"
  render={ (props) => <NAME_OF_THE_COMPONENT PROPS_NAME={PROPS_VALUE}  {...props}/> }
/>
```

{% file src="../../.gitbook/assets/7.-mini-project-starter-code \(2\).zip" caption="7. mini-project-starter-code" %}

### You Do: Implement Router

Let's go back to our blog project.

You've been told your blog needs to have five pages:

* Homepage
* Main blog
* Favorite movie
* Favorite food
* About page

You already have the "Main blog" page, which renders the `Post` component! One down, four to go.

Task:

* Each page is a component - we're learning to use React Router here!
* Create a navigation menu of list items that Route to each page.
  * These pages don't need to have much content — just the header at the top saying what the page is and a paragraph description of your choosing.

_Fun Note:_ There's no reason you can't change the CSS, if you'd like! The CSS file that you'll change is `App.css`. If you'd like, you can grab ours below:

 App.css \(check what inside it\)

* Thought exercise: Why is that the only CSS file you need to change?

**Hint**: You'll need multiple `.js` files

**Hint**: Do you have `react-router-dom` installed for this project?

**Hint**: You can instantiate a component with `props` inside of a `<Route>` element. An example is below:

```javascript
<Route
  path="/blog"
  render={props => (
    <Blog
      {...props}
      title={post.title}
      author={post.author}
      body={post.body}
      comments={post.comments}
    />
  )}
/>
```

#### A good article that discusses how to pass props to a component:

* [https://tylermcginnis.com/react-router-pass-props-to-components/](https://tylermcginnis.com/react-router-pass-props-to-components/)

#### Articles about the spread operator:

* [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax)
* [6 great uses of the spread operator](https://davidwalsh.name/spread-operator)

### Solution

Your solution should look something like as follows:

![Solution for Project](../../.gitbook/assets/router-solution.png)

