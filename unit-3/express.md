# Express

![GA - SEI](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

## Dive into Express

### Learning Objectives

#### Intro to Express

* Understand Express
* Use `npm` to manage project dependencies
* Use `require` to organize code
* Install Nodemon
* Understand request/response
* Understand dynamic segments

#### Middleware

* Define middleware
* Parse POST and PUT/PATCH requests with the `body-parser`

#### Express as an API

* Write five CRUD endpoints for an API resource using Express and JavaScript to implement a REST service.

#### Express Router

### Intro to Express

How many of you, prior to this course, had heard of the MEAN or MERN stack? Today, we will be talking about [ExpressJS](https://expressjs.com/) the "E" in the MEAN/MERN stack. It is one of the most heavily used libraries in the entire Node community. According to the Express home page, Express is a "Fast, unopinionated, minimalist web framework for Node.js".

> Node.js is not a framework. It is an application runtime environment that allows you to write server-side applications in javascript. Javascript that does not depend on a browser.

Some frameworks, like Rails, are very opinionated frameworks- meaning that it follows convention over configuration. A Rails developer can go into any other Rails app, and understand the basic layout, because all Rails applications are built in the same way, with the same file structure.

Express is much less opinionated. We have a lot of freedom in how we structure our application \(folders and files, how to load different files, how to manage dependencies, etc\).

### Recap

🔵 **YOU DO: 5 minutes**

With you buddy, discuss the following questions:

* What are the **HTTP verbs** and how are they used?
* What are the different parts of a URL and what is the purpose of each?
* Explain a request/response

### What is npm?

🔵 **YOU DO:** Take 5 minutes to read and watch this [video](https://docs.npmjs.com/getting-started/what-is-npm)

> Summary: **npm** \(node package manager\), allows us to install dependencies for our Node.js application.

You may also see tutorials refer to a package called `Yarn` for installing packages. This is an alternative to NPM that is built by Facebook. Both packages pull from the NPM, so anything you see done in Yarn can also be done with NPM.

### Codealong: Hello World - Express

I **HIGHLY** recommend that you pay attention, write the commands down, and refer back to this lesson plan as you become more familiar with Express and Node.js:

#### STEP 1 - Initialize a Simple Hello World Express Application

In the terminal:

```bash
$ cd ~/sei/projects

$ mkdir hello-express

$ cd hello-express

$ npm init

// make sure that when you get to 'entry point' that you change that to 'server.js'.

// if you make a mistake, you can always type 'no' when it asks you whether this is 'ok' at the end of the questions/set up

$ code .
```

* `npm init` will initialize a new Node.js application. Upon initialization, it will prompt you for your input in order to update the `package.json`.
* If we hit enter and use all of the default values \(except for the `server.js`\) and we take a look at the contents of the `package.json` file, we'll see something like this:

![](https://i.imgur.com/mP6KyeW.png)

* The `package.json` file contains meta data about your app or module. More importantly, it includes the list of dependencies to install from npm when running npm install. **We** certainly don't want to keep track of them!  This makes it really easy for other people to work on the same app.  All they need to do is clone your repo, and then npm install all of the dependencies in order to start working on the app.

> **Pro Tip**: `npm init -y` is a shortcut that will select all of the defaults for your `package.json` for you.

🔵 **YOU DO: 2 minutes**

1. Walk through STEP 1 above to instantiate your `hello-express` app.

#### STEP 2 - Install Express

1. Let's install the express node module using `npm`. In the terminal type:

```bash
$ npm install express --save
```

or

```bash
$ npm i express --save
```

We could have also entered express manually to the dependencies list in our `package.json` file. If we added Express this way, we would need to run `npm install` afterward in order to install the package.

**SIDE NOTE** As we saw during `npm init`, the default file for a node app is `index.js`. If your package.json still uses this as the default, you should update it to `server.js`.

🔵 **YOU DO: 1 minute**

1. Walk through STEP 2 above, and add Express to your `hello-express` app.

#### STEP 3 - Create a `server.js`

1. Let's make a new file `$ touch server.js` and add the following contents:

```javascript
// Loading the express module on our server
const express = require('express');

// Creates a new instance of express on our server
const app = express();


app.get('/', function(req, res) { 
  // when a request comes in at localhost:3000, it will respond 
});

// tells the server where to listen for requests
const port = process.env.PORT || 3000;

app.listen(port, function() {
  // tells the server where to listen for requests on port 3000

  console.log(`hello-express is listening on port ${port}`);
}); // actualizing the line above
```

#### Let's talk through this...

**require\(\)**

`require()` is a JS keyword with which we are going to become very, _very_ familiar. It is a Node.js feature that loads modules. We are "requiring" the Express module and saving all of that code to the variable `express` on line one.

**const app = express\(\)**

Requiring Express isn't quite enough. We have required and assigned all of Express's code to the `express` variable, but Express is an application that needs to be invoked.

When we invoke express, we get an instance of all of the functionality that Express provides. We then save that instance to a variable called `app`.

**app.listen\(port, callback\)**

With express invoked and running, we now have access to various functions and properties that allow us to configure and set up our application. The first one that we are going to use is the `listen()` function. It tells express and node to listen for HTTP requests on whatever port is passed in.

### Let's Run Our App

If we run the application \(`$ node server.js`\) we can see our console.log in the terminal `hello-express is listening on port 3000`. This means that our server is running on port 3000. Let's try going to the localhost of that port number. What happens?

**OH NOES, what's going on here?**

Basically, we have told the server what port to listen to \(3000\), but we have not specified what to do if a user goes to the `"/"` or root/home route.

1. Use `ctrl + c` to stop the server.
2. Let's update the `server.js`:

```javascript
app.get("/", function(req, res){
  // display 'Hello World!'
  res.send('Hello World!');
});
```

With the script above, we are telling the app that when a user goes to our home route at localhost:3000 \(their request\), that we will send back a response of 'Hello World!'

1. Let's restart the server \(`$ node server.js`\) and reload the browser. You should now see `Hello World!`.

### Nodemon

This is great! But it is kind of a pain to have to restart the server every time we make changes to our files...

[Nodemon](http://nodemon.io/) is a very helpful npm module that will automatically restart your server when a file is saved.

```bash
$ npm install --global nodemon
```

> When using the `--global` flag \(-g for short\), we are specifying that nodemon will be installed "globally" \(not per project\) so that we can utilize nodemon across all of our node applications.

After installing, we start up our application a little bit differently. In the terminal type:

```bash
$ nodemon server.js
```

Instead of `node server.js`.

Pretty easy, eh?

### RECAP - What have we done so far?

We just built the foundation for our server and for your first web application!

* We created a file \(`server.js`\) that contains instructions for the server \(Node\).
  * **Node** is our server software that we have configured to run on a port to listen for incoming HTTP requests from the browser.
* We installed **Express**, which is our lightweight JS framework, and was built to help simplify the job of building an application that can interact with HTTP requests coming from the internet.
* We defined a single root/home route \(`/`\). When Node receives a request via `http://localhost:3000`, it will serve "Hello World" as a response. All of our local routes for this app will start with `http://localhost:3000`, as we have set our default port to 3000.
* We also installed Nodemon which will automatically restart our node server whenever a change is detected, so we don't have to manually stop/restart our server every time a file changes.W

### 🔵 **YOU DO \(15 minutes\)**

Get together with your buddy. Remember: We are here and you can still ask questions! Spend the next 15 minutes on this exercise.

[http://expressjs.com/en/starter/basic-routing.html](http://expressjs.com/en/starter/basic-routing.html)

1. Write a second route underneath the first that listens for `/greeting` and responds with `'Hey, SEI 14!'`
2. Write a third route underneath the that one that listens for `/coding` and responds with `"Work work work work work"`

SOLUTION:

```javascript
app.get('/greeting', function(req, res) { 
    res.send('Hey, SEI 14!'); 
}); 
app.get('/coding', function(req, res) { 
    res.send("Work work work work work"); 
}); 
```

**Stretch Goal**: Implement `req.query` functions in one of your routes explanation [here](http://expressjs.com/en/api.html#req.query)

### Request and Response

#### The 'req' Argument

The [req](https://expressjs.com/en/api.html#req) argument is an object that contains information about the incoming HTTP **request**:

* req.route
* req.query
* req.params
* req.body \(see bodyParser below\)

> You can also use the full name- `request`, but we use `req` for brevity.

#### The 'res' Argument

The [res](https://expressjs.com/en/api.html#res) argument is another object that contains information about the **response** we want to send to the server.

We initially started using `res.send` to send text to the browser, when using handlebars. However, we can use `res.render` to render an html or hbs file.

We can also use `res.redirect` to trigger another route before sending a response back to the browser.

> You can also use the full name- `response`, but we use `res` for brevity.

You can check out the Request and Reponse headers in the Network tab in your Chrome dev tools. They contain a lot of key/value pairs that we will discuss and use throughout the course.

![](https://i.imgur.com/DIA7MR4.png)

### URL Params

**Params** \(short for "parameters"\) is an object attached to each `request` to the server. We can send params via the URL. Let's update the `server.js` to include:

```javascript
app.get("/:name", function(req, res){
  console.log(req.params);
  res.send(`Hello, ${req.params.name}!`);
});
```

Try this URL: `http://localhost:3000/schmitty`. What is returned?

**CFU:** How many routes do we currently have? What are they?

#### Why are params important?

Eventually, we will use "wildcard" params to grab specific information from our app. For example, if we were building a Facebook replica, and we wanted to grab a specific friend of a specific user, we might build a route that looks like this:

`http://localhost:3000/users/:user_id/friends/:friend_id`

Then, we can send a request like this:

`http://localhost:3000/users/1/friends/2`

### 🔵 **YOU DO: 5 minutes**

1. Create a route that uses 'food' as a parameter
2. The route should return a string that includes the food \(e.g.- "I really love pizza"\).

Did anyone run into any issues?

### Query Parameters

Our base route is a fixed path to a specific resource \(like an html page, a piece of data in our database, an image, etc.\) and we can augment or support that path by providing parameters.

The query parameter pattern should be familiar, it is essentially a key and a value:

```javascript
?q=foo&a=bar
```

The `?` tells the server that all of the text that follows, should be interpreted and parsed as query parameters, with `q` as the key and `foo` as the value. Unlike arguments in functions, or key/value pairs in JS objects, query parameters are not comma separated but separated by an `&`, so our second query parameter key is `a` and it's value is `bar`.

A `console.log()` of our query parameters would look something like this:

```javascript
{
    q: "foo",
    a: "bar"
}
```

Let's make our `/:name` route more dynamic by adding a 'first\_name' query parameter!

```javascript
app.get("/:name", function(req, res){
  console.log(req.params);
  console.log(req.route);
  console.log(req.query);

  // parameter is name, query parameter is first_name
  res.send(`Hello, ${req.params.name}. My name is ${req.query.first_name}.`);
});
```

**Try this example:** `http://localhost:3000/schmitty?first_name=jamie`

If we wanted to be formal, we could add a 2nd query parameter of 'last\_name':

```javascript
app.get("/:name", function(req, res){
  console.log(req.params);
  console.log(req.route);
  console.log(req.query);

  res.send(`Hello, ${req.params.name}. My name is ${req.query.first_name} ${req.query.last_name}.`);
});
```

**Try this example:** `http://localhost:3000/schmitty?first_name=jamie&last_name=king`

**Again we ask, why are these important?**

You actually use query parameters all the time on Amazon, Ebay, Airbnb, etc. - anytime you search or 'query' an app. For example, the query to search for Drake tickets on Atlanta's Craigslist looks like this:

`http://atlanta.craigslist.org/search/tia?query=drake`

### 🔵 **YOU DO: 5 minutes**

1. Write a route at `/sightings` that takes a query parameter of `state` and `sights` and responds with an object that looks like this:

```javascript
{
  state:`<the state passed in>`, 
  sights: `<how many ufo sightings you think there are in that state>`
}
```

1. Also, send a response that asks 'How many ufo sightings do you think there are in `the state`? `the answer`.'
2. Write a `/bigfoot` route that takes a query parameter of `blurry` and...
   * If blurry is true, send the response: `"It's not the photographer's fault. Bigfoot is blurry, and that's extra scary to me. There's a large, out-of-focus monster roaming the countryside. Run! He's fuzzy! Get out of there!"` 
   * If blurry is false, respond with:  `"A group of researchers have amassed evidence that the legendary Bigfoot is real, ABC News reported, with the scientists presenting reams of evidence."`

**SOLUTION:**

```javascript
javascript app.get('/sightings', function(req, res){ 
    console.log(req.route); 
    //just to checkout the server logs 
    console.log(req.query); 
    //just to checkout the server logs 
    res.send(`How many ufo sightings you think there are in that ${req.query.state}? ${req.query.sights}.`); 
}); 
    
app.get('/bigfoot', function(req, res){ 
    console.log(req.route); 
    //just to checkout the server logs 
    console.log(req.query); 
    //just to checkout the server logs 
    if (req.query.blurry === "true") { 
    res.send("It's not the photographer's fault. Bigfoot is blurry, and that's extra scary to me. There's a large, out-of-focus monster roaming the countryside! Run! He's fuzzy! Get out of there!"); 
    } else { 
    res.send("A group of researchers have amassed evidence that the legendary Bigfoot is real, ABC News reported, with the scientists presenting reams of evidence."); 
    } 
});
```

### Dynamic Segments

We do have another way that isn't one that we have previously discussed. We often use dynamic segments and query parameters. For example:

```text
/hello/:name?human=true
```

What would this route look like?

```javascript
app.get('/hello/:name', function(req, res) {
  res.send({params: req.params, queries: req.query});
});
```

Try this route: `http://localhost:3000/hello/schmitty?human=true`

### 🔵 **YOU DO: 5 minutes**

1. Build a route at `/favorite/:noun` where `:noun` can be any favorite 'thing' \(e.g. - color, food, song, movie, jeans\)
2. The route will return the parameter `:noun` in the string `I have a favorite <insert :noun here>.`
3. Add the expectation of query parameters, so that hitting the following route: `/favorite/color?color=red` will return to the browser the string `I have a favorite color, it is red.`

**SOLUTION:**

```javascript
app.get('/favorite/:noun', function (req, res) {
  if (req.query[req.params.noun]) {
    res.send(
      `I have a favorite ${req.params.noun}, it is ${
        req.query[req.params.noun]
      }.`
    );
  } else {
    res.send(`I have a favorite ${req.params.noun}.`);
  }
  console.log({ params: req.params, queries: req.query });
});
```

### Order Matters

Keep in mind that when Express receives a request, it checks each route in order until it finds a pattern match.

For example, if you order your routes like this:

```javascript
app.get('/:name', function(req, res){
    ...
});

app.get('/greeting', function(req, res){
    ...
});
```

and you send a request to the URL `http://localhost:3000/greeting` which route will Express think you want? In this example, you want to make sure your "wildcard" `/:name` route comes **AFTER** `/greeting` so that Express will pattern match these correctly.

### 🔵 Lab Time

1. Make routes for  `add, subtract, multiply, divide` that will take two numbers as query parameters `num1` and `num2` and perform the operation specified in the route and send those answers to the browser.

For example, this will send the number `15` to the browser:

```javascript
/add?num1=5&num2=10
```

1. Add a fifth route `/math/:operator`
2. Create a route that can do all four math operations using control flow. For example:

```javascript
if req.params.operator === 'add' 
    then add num1 and num2 
else if 
    etc etc...
```

## Middleware

As an example, to accept a POST request with data attached to it, we'll need to parse the body of the HTTP request into a JS object. Because Express is minimal and doesn't make assumptions about what its users will try to do with it, this isn't included by default. Luckily, Express is easy to extend with plugins called "middlewares".

[Middlewares](https://expressjs.com/en/guide/using-middleware.html) are functions that can operate on the `req` and `res` objects in an Express app after a request is received and before a response is sent. You can register a middleware with `app.use(myMiddlewareFunc)`. The order in which you pass them to `.use` determines the order in which they execute. A simple middleware might look like this:

```javascript
const exampleMiddleware = function (req, res, next) {
  // do something with `req` or `res`
  next()
}
```

Almost all middlewares will have `(req, res, next)` as parameters. `req` and `res` are the standard Express request and response objects. `next` is a function that every middleware must invoke to pass control on to the next middleware in the chain. Otherwise, the request will hang and the client won't get a response!

In the case of our API though, we'll use a pre-existing middleware from an NPM package named [body-parser](https://www.npmjs.com/package/body-parser) instead of writing our own.

### Express as an API

Let's talk about **CRUD**! What does it stand for?

Let us start with the easy part first. By focusing on the **R** part to read data and show it to the user.

To do that, let's start by writing a dummy route to show a list of people.

Add a Route to List People:

```javascript
let people = [
    {firstName: 'Mohammad', lastName: 'Jouza'},
    {firstName: 'Raymond', lastName: 'Maroun'},
    {firstName: 'Jaber', lastName: 'Al_Salamah'},
    {firstName: 'Sameh', lastName: 'Kinawy'}
]

app.get('/api/people', function(req, res) {
  res.json({ people: people });
});
```

Getting all of the people is fine and all. But what if we only want details on a single person?

How can we do that?

**Solution:** 

```javascript
app.get('/api/people/:id', function (req, res) {
  res.json({ person: people[req.params.id] });
});
```

This is cool! But what happens when we ask for a person with an ID that does not exist in the DB or in the `people` Array?

Our DB will return a null object if it could not find the record. And, in the case of an `Array` we will receive `undefined`.

Which we can take advantage of.

**Solution:**

```javascript
app.get('/api/people/:id', function (req, res) {
  const personID = req.params.id;
  const person = people[personID];
  if (person !== undefined) {
    res.json({ person: person });
  } else {
    res.status(404).json({ error: 'Person Not Found' });
  }
});
```

That's awesome! But what happens if the user sends a letter instead of a number?

Yeah, we need to make sure they can't do that.

How can we do that?

**Solution:** 

```javascript
app.get('/api/people/:id', function (req, res) {
  const personID = req.params.id;
  if (!isNaN(personID)) {
    const person = people[personID];
    if (person !== undefined) {
      res.json({ person: person });
    } else {
      res.status(404).json({ error: 'Person Not Found' });
    }
  } else {
    res.status(406).json({ error: 'Invalid ID' });
  }
});
```



That's a lot of work, isn't it? Well, that's what you have to do when there is no Magic to take care of things for you.

Okay, enough reading data. Let's move on to the Create part of CRUD.

Lets set up a route to handle post request for creating a new person.

**Solution:**

```javascript
app.post('/api/person', function (req, res) {
  res.status(201).json({ result: 'Working...' });
});
```

That's fine, but how do we read data submitted in a post request?

```text
npm i body-parser --save
```

```javascript
/*
 * Add `bodyParser` middleware which will parse JSON requests
 * into JS objects before they reach the route files.
 *
 * The method `.use` sets up middleware for the Express app.
 */
app.use(bodyParser.json());
```

```javascript
res.status(201).json({ result: req.body });
```

**Solution:**

```javascript
app.post('/api/person', function (req, res) {
  people.push(req.body.person);
  res.status(201).json({ people: people });
});
```

Great, we now have an API that lets us see a list of all the people or details about one of them and it even allows us to create a new person.

With that, we have implemented the **C**, and **R** parts of **CRUD**.

Now it is up to you to implement the **U**, and **D** parts of **CRUD** in a lab right now based on what we have learned today.

### Extra Lab

**To Do:**

1. Update existing Person
2. Delete existing Person

### Extra Reading =&gt; Express Router

If you haven’t already noticed, then you soon will. We’ve been adding every route for our API into a single file. Which, if we remember is a big no no. We should always try and follow the **SRP** \(Single Responsibility Principle\).

Let’s refactor our app to be more modular. By breaking it into mini-apps each concerned about itself using `express.Router` class.

Start by creating the `routes` directory.

And then create `routes/index.js` file using VS Code.

```javascript
const express = require('express'); // use the express module in this file
const router = express.Router(); // use the router module from express

/* GET home page. */
router.get('/', function(req, res, next) {
  res.json({ message: 'Hello SEI Relativity' });
});

module.exports = router; // export the router object so we can use it in server.js
```

Creating **Routers** like this lets us organize our routes better. We can put all routes with the same prefix on the same router, then mount it on our **app** router.

Though, how do we use this `routes/index.js` file?

Well, we import it in the `server.js` file.

```javascript
const indexRouter = require('./routes/index');

// Mount the the router module on a path in the main app.
app.use('/', indexRouter);
```

🔵 **WE DO: Refactor People Index Route**

🔵 **YOU DO: 15 minutes**

Now that we have seen the express router in action. Use your knowledge of it, to refactor the remaining routes we've added so far today to our app.

### Reference

* [HTTP Statuses - Cat Edition](https://http.cat/)
* [HTTP Statuses - Plain](https://httpstatuses.com/)
* [Express: Using middleware](https://expressjs.com/en/guide/using-middleware.html)

