# Data Associations with Mongoose

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

## Data Associations with Mongoose

#### Why is this important?

_This workshop is important because:_

* Real-world data usually consists of different types of things that are related to each other in some way. An invoicing app might need to track employees, customers, and accounts. A food ordering app needs to know about restaurants, menus, and its users!
* We've seen that when data is very simple, we can combine it all into one model. When data is more complex or more loosely related, we often create two or more related models.
* Understanding how to plan for, set up, and use related data will help us build more full-featured applications.

#### What are the objectives?

_After this workshop, developers will be able to:_

* Diagram one-to-one, one-to-many, and many-to-many data associations.
* Compare and contrast embedded & referenced data.
* Design nested server routes for associated resources.
* Build effective Mongoose queries for associated resources.

#### Where should we be now?

_Before this workshop, developers should already be able to:_

* Use Mongoose to code Schemas and Models for single resources.
* Create, Read, Update, and Delete data with Mongoose.

#### Numerical Categories for Relationships

#### One-to-One

Each person has one brain, and each \(living human\) brain belongs to one person.

![one to one erd example](https://cloud.githubusercontent.com/assets/3254910/18140904/4d85c04e-6f6c-11e6-8301-c06bacff3dd3.png)

One-to-one relationships can sometimes just be modeled with simple attributes. A person and a brain are both complex enough that we might want to have their data in different models, with lots of different attributes on each.

#### One-to-Many

Each leaf "belongs to" the one tree it grew from, and each tree "has many" leaves.

![one to many erd example](https://cloud.githubusercontent.com/assets/3254910/18182445/e4bddb6c-7044-11e6-9099-314b773724f3.png)

#### Many-to-Many

Each student "has many" classes they attend, and each class "has many" students.

![many to many erd example](https://cloud.githubusercontent.com/assets/3254910/18140903/4c56c3ee-6f6c-11e6-9b6d-4c6ffae81323.png)

**Entity Relationship Diagrams**

Entity-relationship diagrams \(ERDs\) represent information about the numerical relationships between data, or entities.

![entity relationship diagram example](https://cloud.githubusercontent.com/assets/3254910/18141666/439d9392-6f6f-11e6-953f-c91415b85f3f.png)

[More guidelines for ERDs](http://docs.oracle.com/cd/A87860_01/doc/java.817/a81358/05_dev1.htm)

### **Lab \[15 min\]**

Come up with an example of related data. Draw the ERD for your relationship, including a few attributes for each model.

#### Association Categories for Mongoose

[Mongo Data Model Design](https://docs.mongodb.com/manual/core/data-model-design/)

**Embedded Data** is directly nested **inside** of other data. Each record has a copy of the data.

It is often **efficient** to embed data because you don't have to make a separate request or a separate database query -- the first request or query gets you all the information you need.

![](https://i.imgur.com/HlLQJ0f.png)

**Referenced Data** is stored as an **id** inside other data. The **id** can be used to look up the information. All records that reference the same data look up the same copy.

It is usually easier to keep referenced records **consistent** because the data is only stored in one place and only needs to be updated in one place.

![](https://i.imgur.com/90AztzB.png)

While the question of **one-to-one**, **one-to-many,** or **many-to-many** is often determined by real-world characteristics of a relationship, the decision to **embed** or **reference** data is a design decision.

There are tradeoffs, such as between **efficiency** and **consistency**, depending on which one you choose.

When using Mongo and Mongoose, though, **many-to-many** relationships often involve **referenced associations**, while **one-to-many** often involve **embedding data**.

### **Lab \[15 min\]**

How would you design the following? Draw an ERD for each set of related data? Can you draw an ERD for each?

* `User`s with many `Tweets`?
* `Food`s with many `Ingredients`?

### Set-up Starter App

**Initialize a directory**

1. `mkdir mongoose-associations-app` and `cd` into it
2. `npm init -y`
3. `npm i express mongoose`
4. `touch server.js`

### Build Express Server

`server.js`

```javascript
const express = require('express');
const app = express();
const mongoose = require('mongoose');

const mongoURI = 'mongodb://localhost:27017/mongoRelationships';

mongoose.connect(
  mongoURI,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log('the connection with mongod is established');
  }
);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('SERVER IS WORKING ON http://localhost:' + PORT);
});
```

### Implementation: Embedded \[Code-Along\]

Imagine you have a database of `User`s, each with many embedded `Tweet`s. If you needed to update or delete a tweet, you would first need to find the correct user, then the tweet to update or delete.

**1\) Set Up Structure with Schemas**

1. `touch models/user.js`

```javascript
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const tweetSchema = new Schema({
  text: String,
  date: Date
});

const userSchema = new Schema({
  name: String,
  // embed tweets in user
  tweets: [tweetSchema]
});
```

The `tweets: [tweetSchema]` line sets up the embedded data association. The `[]` tells the schema to expect a collection, and `tweetSchema` \(or `Tweet.schema` if you had a `Tweet` model defined already\) tells the schema that the collection will hold _embedded_ documents of type `Tweet`.

**2\) Manipulate Data with Models**

```javascript
const User = mongoose.model('User', userSchema);
const Tweet = mongoose.model('Tweet', tweetSchema);
```

**3\) Export Models**

```javascript
module.exports = { User, Tweet };
```

Completed User model file \(**Extra**\)

```javascript
const mongoose = require('mongoose');
const Schema = mongoose.Schema;
const tweetSchema = new Schema({ tweetText: String }, { timestamps: true });
const userSchema = new Schema(
  { name: { type: String, default: '' }, tweets: [tweetSchema] },
  { timestamps: true }
);
const User = mongoose.model('User', userSchema);
const Tweet = mongoose.model('Tweet', tweetSchema);
module.exports = { User, Tweet };
```

**Independent Practice: Users & Tweets**

1. Create a user.
2. Create tweets embedded in that user.
3. List all the users.
4. List all tweets of a specific user.

**Routes for Embedded Data**

\*\*\*\*

| **HTTP Verb** | **Path** | **Description** |
| :--- | :--- | :--- |
| GET | /api/users | Get all users |
| POST | /api/users | Create a new user |
| POST | /api/users/:userId/tweets | Create a new tweet |
| PUT | /api/users/:userId/tweets/:id | Update a tweet |
| DELETE | /api/users/:userId/tweets/:id | Delete a tweet |

**CREATE USER**

`server.js`

```javascript
const User = require('./models/user').User
const Tweet = require('./models/user').Tweet

// ...

app.use(express.json())

// ...

app.post('/api/users', (req, res) => {
  User.create(req.body, (error, newUser) => {
    res.json(newUser);
  })
})
```

![](https://i.imgur.com/1fyubyV.png)

**CREATE TWEET**

```javascript
// create tweet embedded in user
app.post('/api/users/:userId/tweets', (req, res) => {
  // store new tweet in memory with data from request body
  const newTweet = new Tweet({ tweetText: req.body.tweetText });

  // find user in db by id and add new tweet
  User.findById(req.params.userId, (error, foundUser) => {
    foundUser.tweets.push(newTweet);
    foundUser.save((err, savedUser) => {
      res.json(newTweet);
    });
  });
});
```

**UPDATE TWEET**

```javascript
// update tweet embedded in user
app.put('/api/users/:userId/tweets/:id', (req, res) => {
  // set the value of the user and tweet ids
  const userId = req.params.userId;
  const tweetId = req.params.id;

  // find user in db by id
  User.findById(userId, (err, foundUser) => {
    // find tweet embedded in user
    const foundTweet = foundUser.tweets.id(tweetId);
    // update tweet text and completed with data from request body
    foundTweet.tweetText = req.body.tweetText;
    foundUser.save((err, savedUser) => {
      res.json(foundTweet);
    });
  });
});
```

**DELETE TWEET**

```javascript
// delete tweet embedded in user
app.delete('/api/users/:userId/tweets/:id', (req, res) => {
  // set the value of the user and tweet ids
  const userId = req.params.userId;
  const tweetId = req.params.id;

  // find user in db by id
  User.findById(ruserId , (err, foundUser) => {
    console.log('FOUND USER: ', foundUser);
    
    foundUser.tweets.id(tweetId ).remove();
    
    foundUser.save((err, savedUser) => {
      res.json(newTweet);
    });
    
  });
});
```

### Implementation: Referenced \[Reading Homework\]

**Initialize a directory**

1. `mkdir mongoose-referenced` and `cd` into it
2. `npm init -y`
3. `npm i express mongoose`
4. `touch server.js`

### Build Express Server

`server.js`

```javascript
const express = require('express');
const app = express();
const mongoose = require('mongoose');

const mongoURI = 'mongodb://localhost:27017/mongoRelationships';

mongoose.connect(
  mongoURI,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log('the connection with mongod is established');
  }
);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('SERVER IS WORKING ON http://localhost:' + PORT);
});
```

**1\) Set Up Structure with Schemas \(as before\)**

1. `mkdir models`
2. `touch models/ingredient.js models/food.js`

`ingredient.js`

```javascript
const mongoose = require('mongoose');

const ingredientSchema = new mongoose.Schema({
  name: {
    type: String,
    default: ''
  },
  origin: {
    type: String,
    default: ''
  }
});

const Ingredient = mongoose.model('Ingredient', ingredientSchema);

module.exports = Ingredient;
```

`food.js`

```javascript
const mongoose = require('mongoose');

const foodSchema = new mongoose.Schema({
  name: {
    type: String,
    default: ''
  },
  ingredients: [
    {
      type: Schema.Types.ObjectId,
      ref: 'Ingredient'
    }
  ]
});

const Food = mongoose.model('Food', foodSchema);

module.exports = Food;
```

Check out the value associated with the `ingredients` key inside the food schema. Here's how it's set up as an array of referenced ingredients:

* `[]` lets the food schema know that each food's `ingredients` will be an array
* The object inside the `[]` describes what kind of elements the array will hold.
* Giving `type: Schema.Types.ObjectId` tells the schema the `ingredients` array will hold ObjectIds. That's the type of that big beautiful `_id` that Mongo automatically generates for us \(something like `55e4ce4ae83df339ba2478c6`\).
* Giving `ref: Ingredient` tells the schema we will only be putting `Ingredient` instance ObjectIds inside the `ingredients` array.

**2\) Seed file**

Let's create a `seed.js` file. Here's how we'd take our models for a spin and make two objects to test out creating an Ingredient document and Food document.

```javascript
const mongoose = require('mongoose');
const Schema = mongoose.Schema;

const Food = require('./models/food');
const Ingredient = require('./models/ingredient');

const mongoURI = 'mongodb://localhost/mongoRelationships';
mongoose.connect(
  mongoURI,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log('the connection with mongod is established');
  }
);

// CREATE TWO INGREDIENTS
const cheddar = new Ingredient({
  name: 'cheddar cheese',
  origin: 'Wisconson'
});

const dough = new Ingredient({
  name: 'dough',
  origin: 'Iowa'
});

// SAVE THE TWO INGREDIENTS SO
// WE HAVE ACCESS TO THEIR _IDS
cheddar.save((err, savedIng) => {
  if (err) {
    return console.log(err);
  } else {
    console.log('cheddar saved successfully', savedIng);
  }
});

dough.save((err, savedIng) => {
  if (err) {
    console.log(err);
  } else {
    console.log('dough saved successfully', savedIng);
  }
});

// CREATE A NEW FOOD
const cheesyQuiche = new Food({
  name: 'Quiche',
  ingredients: []
});

// PUSH THE INGREDIENTS ONTO THE FOOD'S
// INGREDIENTS ARRAY
cheesyQuiche.ingredients.push(cheddar); // associated!
cheesyQuiche.ingredients.push(dough);
cheesyQuiche.save((err, savedFood) => {
  if (err) {
    return console.log(err);
  } else {
    console.log('cheesyQuiche food is ', savedFood);
  }
});
```

![](https://i.imgur.com/J6mO3TE.png)

* A lot of this set-up is also in the `server.js` file. That's ok.

Note that we push the `cheddar` ingredient document into the `cheesyQuiche` ingredients array. We already told the Food Schema that we will only be storing ObjectIds, though, so `cheddar` gets converted to its unique `_id` when it's pushed in!

Go into `mongo` and find the cheesy quiche:

![](https://i.imgur.com/gzc9S2C.png)

**3\) Pull Data in With .populate\(\)**

When we want to get full information from an `Ingredient` document we have inside the `Food` document `ingredients` array, we use a method called `.populate()`.

We'll test out this code in a file called `test.js`.

1. `touch test.js`
2. After adding the code below, run `node test.js`

```javascript
const mongoose = require('mongoose');

const Food = require('./models/food');
const Ingredient = require('./models/ingredient');

const mongoURI = 'mongodb://localhost:27017/mongooseAssociationsInClass';
mongoose.connect(
  mongoURI,
  { useNewUrlParser: true, useUnifiedTopology: true },
  () => {
    console.log('the connection with mongod is established');
  }
);

Food.findOne({ name: 'Quiche' })
  .populate('ingredients') // <- pull in ingredient data
  .exec((err, food) => {
    if (err) {
      return console.log(err);
    }
    if (food.ingredients.length > 0) {
      console.log(`I love ${food.name} for the ${food.ingredients[0].name}`);
    } else {
      console.log(`${food.name} has no ingredients.`);
    }
    console.log(`what was that food? ${food}`);
  });
```

Click to go over this method call line by line: 

1. **Line 1:** We call a method to find only **one** `Food` document that matches the name: `Quiche`. 
2. **Line 2:** We ask the ingredients array within that `Food` document to fetch the actual `Ingredient` document instead of just its `ObjectId`. 
3. **Line 3:** When we use `find` without a callback, then `populate`, like here, we can put a callback inside an .`exec()` method call.  Technically we have made a query with `find`, but only executed it when we call `.exec()`. 
4. **Lines 4-15:** If we have any errors, we will log them. Otherwise, we can display the entire `Food` document **including** the populated `ingredients` array. 
5. **Line 9** demonstrates that we are able to access both data from the original `Food` document we found **and** the referenced `Ingredient` document we summoned.

**Query without `populate()`**

![](https://i.imgur.com/T33vFaz.png)

**Query with `populate()`**

![](https://i.imgur.com/9kjsf09.png)

Now, instead of seeing **only** the `ObjectId` that pointed us to the `Ingredient` document, we can see the **entire** `Ingredient` document.

**Independent Practice: Foods & Ingredients**

Tasks:

In the test file

1. Create 3 ingredients.
2. Create a food that references those ingredients.
3. List all the foods.
4. List all the ingredient data for a food.

**Routes for Referenced Data**

When you need full information about a food, remember to pull ingredient data in with `populate`. Here's an example:

**INDEX of all foods**

`server.js`

```javascript
const Food = require('./models/food');
const Ingredient = require('./models/ingredient');

// ......

// send all information for all foods
app.get('/api/foods/', (req, res) => {
  Food.find({ })
    .populate('ingredients')
    .exec((err, foods) => {
      if (err) {
        res.status(500).send(err);
        return;
      }
      console.log(`found and populated all foods: ${foods}`);
      res.json(foods);
    });
});
```

> Many APIs don't populate all referenced information before sending a response. For instance, the Spotify API is riddled with ids that developers can use to make a second request if they want more of the information.

**Check for Understanding**

On which of the following routes are you most likely to `populate` all the ingredients of a food you lookup?

| **HTTP Verb** | **Path** | **Description** |
| :--- | :--- | :--- |
| GET | /foods | Get all foods |
| POST | /foods | Create a food |
| GET | /foods/:id | Get a food |
| DELETE | /foods/:id | Delete a food |
| GET | /foods/:food\_id/ingredients | Get all ingredients from a food |

#### Route Design

Remember RESTful routing? It's the most popular modern convention for designing resource paths for nested data. Here is an example of an application that has routes for `Store` and `Item` models:

#### RESTful Routing

| **HTTP Verb** | **Path** | **Description** | **Key Mongoose Method\(s\)** |
| :--- | :--- | :--- | :--- |
| GET | /stores | Get all stores | click for ideas\`.find\` |
| POST | /stores | Create a store | click for ideas\`new\`, \`.save\` |
| GET | /stores/:id | Get a store | click for ideas\`.findById\` |
| DELETE | /stores/:id | Delete a store | click for ideas\`.findOneAndDelete\` |
| GET | /stores/:store\_id/items | Get all items from a store | click for ideas\`.findById\`, \(\`.populate\` if referenced\) |
| POST | /stores/:store\_id/items | Create an item for a store | click for ideas\`.findById\`, \`new\`, \`.save\` |
| GET | /stores/:store\_id/items/:item\_id | Get an item from a store | click for ideas\`.findOne\` |
| DELETE | /stores/:store\_id/items/:item\_id | Delete an item from a store | click for ideas\`.findOne\`, \`.remove\` |

_In routes, avoid nesting resources more than one level deep._

### Extra Lab:

* Refactor the routes into individual controller files using [express.Router\(\)](https://expressjs.com/en/guide/routing.html)

