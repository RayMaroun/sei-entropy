# Mongoose: Using MongoDB with Express Apps

### How can we use MongoDB with our Express Apps / APIs?

* Let's review our experience with MongoDB, how easy was it to interact with using the MongoShell?
* Perhaps you noticed some "clunkiness" from using the MongoDB Shell,
  * Perhaps this made it inconvenient to interact with.
* Some of the queries were not very streamlined either.
* Also, we may have noticed there's no protection against entering arbitrary data.
* MongoDB will literally let us create whatever we want in what ever format we like with very little resistance.
* Developers realized this, so they created a library \(node\_module\).
  * This will help us communicate with a MongoDB much better.
* Remember why we have libraries?
  * Think about how the express application framework helps us build an app.
  * Express already comes complete with built in methods to handle http requests, responses.
  * It gives us a listen method that allows us to tell our app to listen on a specific port.
  * Express gives our `node.js` app a form, or structure if you will.
  * Express is like a wrapper that goes on top of `node.js` gives us a generic frame to work with, a frame.
* Mongoose is to MongoDB as Express is to `node.js`
* Mongoose is an Object Document Mapper.
* Also, unlike how loosely structured our MongoDB was in the shell, Mongoose gives us special objects that allow us to create modules and Schemas to structure our data. Similarly to how SQL does.

### Databases and MVC

![Model-View-Controller](../../.gitbook/assets/image%20%2833%29.png)

### [Enter Mongoose](http://mongoosejs.com/)

* Let's add mongoose to our `node.js` / `express` app!
* First you'll need an app, so go ahead and build one.
* Mongoose is added to you express app like this:
  * `npm install mongoose --save`
* Then you'll need to require it inside of your project like this:

```javascript
const mongoose = require('mongoose');
```

* Now we can actually connect to an instance of the MongoDB database like this:

```javascript
mongoose.connect('mongodb://localhost:27017/TodoApp')
```

* Basically, we're using our mongoose framework/wrapper as a sort of interface or middleware.
  * Mongoose is working like our agent in the background.
* Now we'll add mongoose promises:

```text
mongoose.connect('mongodb://localhost:27017/TodoApp');
```

* Then, we can set up a mongoose model:

```javascript
const Todo = mongoose.model('Todo', {
  text: {
    type: String
  },
  completed: {
    type: Boolean
  },
  completedAt: {
    type: Number
  }
});
```

* Now we can practice with this by creating a new instance of our model:

```javascript
const newTodo = new Todo({
  text: 'Cook Dinner',
  completed: false,
  completedAt: 1200
});
```

* Now, normally we would set/bind the properties of our Todos model object with the request body in order to save it to the database.
* Then we'll need to create a save method to save the new instance of a todo:

```javascript
  newTodo.save().then((doc) => {
      console.log('Saved Todo: ', doc);
  }, (e) => {
    console.log('Something went wrong', e);
  });
```

* Notice how we're using promises here?
  * The `.save()` method actually returns a promise and the `.then()` allows us to handle success of that promise as well as attach an error handler in the case of a failure of the the promise.
* Once you run `nodemon` inside of the terminal, you'll be able to run your server file and your save method will automatically save a new instance of the Todo object.
* You can also go to Robo Mongo and see this document created inside of your collection.
* Awesome! We should have created an actual Todo Document inside of our `MongoDB` database.
* Now, what happens if we were to initialize a new instance of a `Todo` like this?

  ```text
  const newTodo = new Todo({});
  ```

* Did you notice a document was still created?

```text
  Server is locked and loaded on port 3000
  Saved Todo:  { _id: 5ae4fbf145f21d2549084c12, __v: 0 }
```

* You should have gotten a similar output like this in your terminal.
* You can also go to Robo Mongo and notice a document was created

### [Validators, Types and Defaults are Important.](http://mongoosejs.com/docs/validation.html)

* The mongoose model gives us validation we can use to ensure our data is sanitized before it's created.

```javascript
const Todo = mongoose.model('Todo', {
  text: {
    type: String,   // Sets the data property to a string.
    required: true, // Sets the data property to required.
    minlentgh: 1,   // Sets a minimum string length.
    trim: true      // This will remove any leading or trailing white space before inserting contents into the databse.

  },
  completed: {
    type: Boolean,
    default: false
  },
  completedAt: {
    type: Number,
    default: null
  }
});
```

**Now, we can add validation in our model besides just Type.**

* We can use `required`, which is a boolean we can set to true to prevent the creating of an empty field.
* We can also use `minlength`, which is a string validator to set minimum length.
* We can also set defaults too!



### Now it's time to build our API with RESTful Routing

* The first thing we should do is properly configure our app through the separation of concerns.
* As a best practice, we should put our database configuration inside of a separate file.

  * Inside of the root directory of your project: `mkdir db` and then `touch db/mongoose.js`.
  * We'll add our `mongodb` connection method inside of `mongoose.js` and export it as a module.

  ```text
    // Inside of mongoose.js
    const mongoose = require('mongoose');
    mongoose.connect(`mongodb://localhost:27017/Todos`);
    module.exports = {
      mongoose
    }
  ```

  * Then we can require that model inside of our `server.js` file.
  * We could actually set `{mongoose}` as a local variable, which would be assigned the mongoose property from the object that gets returned by requiring the module we created.
    * This is commonly referred to as the process of ES6 de-structuring.

```javascript
const {mongoose} = require('./db/mongoose')

  // This creates a local variable and sets it equal to the mongoose property from the returned value of the mongoose module
```

**Now let's separate our models**

_Gotta keep'em seperated_😎

* We'll create another directory called models and place our models inside of it:
  * Inside of the root directory: `mkdir models`
  * Then let's make our model files: `touch models/todo.js`
  * This command will create two files for both of our models
* Now we can add our models inside of their respective files:

```javascript
// inside of todo.js

const mongoose = require('mongoose')

const Todo = mongoose.model('Todo', {
  text: {
    type: String // We'll be sure to add our validations later
  },
  completed: {
    type: Boolean
  },
  completedAt: {
    type: Number
  }
});

module.exports = {
  Todo
}
```

* Then, just like we did earlier in our `server.js` file with ES6 destructuring, we'll do that for our other modules:

```javascript
const {Todo} = require('./models/todo');
```

* Again, doing this way will set a local variable and set it equal to the `User` / `Todo` property of the object that gets returned when we require the modules.

### Awesome! Now we can build a creation endpoint to handle POST requests

* However, before we do that, we'll need to install `body-parser`
  * run `npm install body-parser --save`
* By now you should already know that `body-parser` is a middleware that allows us to send `JSON` to the server as a request body.
  * Normally, when a http request body is sent, it's in the form of a string. So, body parser allows us to parse it and turn it into `JSON`
* Now you'll need to require `body-Parser` into your `server.js` file:



```javascript
// Third Party Modules
const express = require('express')
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser') //  HERE'S WHERE WE'LL REQUIRE IT

// Local Modules
const {mongoose} = require('./db/mongoose');
const {Todo} = require('./models/todo');
const {User} = require('./models/user');


// Environment variable
const port = process.env.PORT || 3000;

// Middleware
app.use(morgan('tiny'));




app.get('/', (req, res) => {
  res.send('Welcome to the homepage')
});
app.get('*', (req, res) => {
  res.status(404).sendFile(`${__dirname}/404/404.html`)  
  /* the __dirname variable allows use to reference the absolute file path,
     and this is especially helpful when building an absolute file path to a specific file we need to serve
  */   
});
app.listen(port, (err) => {
  console.log(err || `Server is locked and loaded on port ${port}`);
});
```

* Now you'll need to tell your `server.js` script to use `body-parser` as a middleware:

```javascript
  app.use(bodyParser.json());
```

* Now we can set up a route handler:

```javascript
app.post('/todos', (req, res) => {
      // We'll add some logic here
})
```

* Remember how for RESTful resource creation, we like to use `/<pluralized resource name>`
* Now let's test our route handler right quick.
  * To do this, we're going to send a request body to the server using `Postman`
  * Go ahead and `console.log(req.body)`.
  * Now, we'll go to `Postman` and select a `POST` request to: `localhost:3000/todos`
  * Select the `body tab > raw > JSON`
  * Go ahead and place this object in the input area:

```text
{
  "text" : "This is from Postman"
}
```

* Perfect! We should have gotten seen our terminal print out the request body:

```text
{"text": "This is from Postman"}

```

* Excellent! Now we can build out our router to actually create some data inside of our database:

```javascript
  app.post('/todos', async (req, res) => {
    let todo = new Todo({
      text: req.body.text
    })
    await todo.save().then((doc) => { // remember our promises?
      res.send(doc);
    }, (e) => {
      res.status(400).send(e)
    }) // We can send a response status code back to the user too
  });
```

* Perfect! Now we should be able to go back to Postman and send another `POST` request and actually create some new data inside of our database!

### **Awesome! Now we can build a view all resources endpoint to handle GET requests**

* This one will be pretty straight forward after having created a resource already.
* As you may remember, the RESTful route to list all resources would still be pluralized:
  * So, for `todos`, you would write your route like this: `/todos`
  * Go ahead and build a route handler to handle this request:

```javascript
  app.get('/todos', async (req, res) => {
    await Todo.find().then((todos) => {
      res.send({todos})
        // We'll send todos} as an object, this makes it way more flexible
    }, (e) => {
      res.status(400).send(e)
    })
  })
```

### Excellent! Now we can build an API endpoint to find GET requests to one resource

* There's a couple things mongoose gives us that will make this super easy.
* Let's look at the different ways we can query for one resource.

One way we could locate one resource is to use the `.find()` method.

```javascript
Todo.find({
  _id: req.body.id
}).then((todo) => {
  res.send(todo)
})
```

If we're trying to find a single resource, this is probably not the best way to do it, especially if the resource cannot be found because it returns an empty array.

Another way we can do this is by using the `.findOne()` method.

```javascript
Todo.findOne({
  _id: req.body.id
}).then((todo) => {
  res.send(todo);
})
```

This method is slightly more efficient because it's finding one resource by a certain document property. In the case a resource cannot be found, it will return `null`

So, lastly, the best and most efficient way to find a resource \(document\) inside of a collection, especially when it's by ID is by using the method, `.findById()`. This method will return `null` as well if a resource cannot be found.

```javascript
Todo.findById(req.body.id).then((todo) => {
  if (!todo) {
    res.send('Sorry, todo was not found')
  }
  res.send(todo)
}, (e) => {
  res.send(e);
})
```

**So, now that we've explored how to do our queries, we can run this in our app.**

This method of finding a todo by id allows us to use a built in class from the MongoDB driver called `ObjectID`. This way we can terminate the function and send back a status is the ID is invalid.

```javascript
app.get('/todos/:id', async (req, res) => {
  let id = req.params.id;
  if (!ObjectID.isValid(id)) {
    return res.status(404).send()
  };
  await Todo.findById(id).then((todo) => {
    if (!todo) {
      res.status(404).send()
    };
    res.send({
      title: 'Todo',
      todo: todo})
  }, (e) => {
    res.status(400).send()
  })
});
```

### Now we can build an API endpoint to delete a resource:

Before we create a delete endpoint for our application, we'll need to get comfortable with the queries first.

First we have the `.remove({})` method. This is an extremely powerful query as it will remove all of the documents in the collection. Using this method in your application is probably not the best idea, but it's still a good idea to become familiar with it.

Take notice that although this method might resemble the `.find()` method, however this method accepts an empty object as an argument.

So, this is how the `.remove({})` query is written. You can `console.log()` the result, which actually will be the document itself. As you can see, adding mongoose promises make it so much easier to get things done, plus they are very descriptive.

```javascript
Todo.remove({}).then((success) => {
  console.log(success);
}, (failure) => {
  console.log(failure);
})
/* When we run this command, we'll get a readout like this:
  { n: 2, ok: 1 } this
  This means that two documents were removed and we got a ok property value of 1 meaning success.
  as opposed to a 0
*/
```

The next method we could possibly use is called `findOneAndRemove({})`

This query will find the first document that matches and it will remove it. One this to keep in mind is that this query actually return the document after it's been removed from the database. This can be useful, if you're trying to give some information back to the user about the document they removed. This method will take an object as an argument because we might be finding the resource by more than just the id.

The next and final mongoose query method we can use is `findByIdAndRemove()`

This query will also return the document to the user just like findOneAndRemove\(\) as you can tell by the naming convention, this query will find by Id first.

This is probably one of the best query methods when deleting a resource by id because it's what it's designed for exactly.

```javascript
let id = req.params.id;

Todo.findByIdAndRemove(id).then((doc) => {
  console.log(doc);
}, (err) => {
  console.log(err);
});
```

So, for building an API endpoint, we could write our router handler like this:

```javascript
app.delete('/todos/:id', async (req, res) => {
  let id = req.params.id;
  if(!ObjectID.isValid(id)){
  res.status(404).send()
  };

await Todo.findByIdAndRemove(id).then((todo) => {
  if(!todo){
    res.status(404).send()
  }
  res.send(todo)
}, (err) => {
  res.status(400).send();
})
});
```

However, when building a UI using a template engine, `a` and `form` elements can only send `GET` and `POST` requests respectively, so this might be an issue we'll have to address.

