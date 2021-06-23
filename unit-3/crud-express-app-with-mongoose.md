# CRUD Express App with Mongoose

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

## CRUD Express App with Mongoose

### Lesson Objectives

1. Initialize a directory
2. Start express
3. Connect Express to Mongo
4. SEED DB
5. Create INDEX
6. Create CREATE Route
7. Create Fruits Model
8. Have Create Route Create data in MongoDB
9. INDEX Route
10. SHOW Route
11. DELETE Route
12. UPDATE Route

### Initialize a directory

1. `mkdir express-mongoose-crud-app`
2. `cd express-mongoose-crud-app`
3. `npm init`
4. `npm install express`
5. `touch server.js`
6. `touch .gitignore`, then and add **node\_modules**
7. Edit package.json to have `"main": "server.js",`
8. Add to the **script** `"dev": "nodemon server.js"`

### Build express app

In `server.js`

```javascript
const express = require('express');
const app = express();

/* ============================================== */

app.get('/', (req, res) => {
  console.log('GET /');
  res.json('SERVER IS WORKING :P');
});

/* ============================================== */


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('SERVER IS WORKING ON http://localhost:'+PORT);
});
```

### Test Fruit Route and `req.body`

Let's build a POST route first. In `server.js` add this:

```javascript
app.post('/fruits', (req, res)=>{
    res.send('/fruits endpoint is working');
});
```

Test the route in Postman. Note - you do not have to enter any for data for this test.

![](https://i.imgur.com/HRE6LmE.png)

#### Test JSON request data with Postman

Next, we'll need to add some Express middleware to properly translate JSON data. Middleware is any code that we want to run between receiving the request and passing it along to the route. Typically, middleware is a `.use` method.

[Body Parser](https://www.npmjs.com/package/body-parser) is an npm package that creates a `req.body` object. It is now included in Express by default.

```javascript
app.use(express.json());
```

Check to see if `req.body` works, update the route to respond with the body of the form.

```javascript
app.post('/fruits', (req, res)=>{
    res.json(req.body);
});
```

In Postman, make sure that the Body is `raw` JSON.

* It will not be as in this picture at the start

![](https://i.imgur.com/sGfsHhy.png)

Let's add some conditional logic based on whether a fruit is ripe and `readyToEat`. This will imitate a checkbox in a form:

```javascript
app.post('/fruits', (req, res)=>{
    if(req.body.readyToEat === 'on'){ 
        //if checked, req.body.readyToEat is set to 'on'
        req.body.readyToEat = true;
    } else { 
        //if not checked, req.body.readyToEat is undefined
        req.body.readyToEat = false;
    }
    res.json(req.body);
});
```

![](https://i.imgur.com/EH1EhnJ.png)

### Connect Express to Mongo

1. `npm install mongoose`
2. Inside `server.js`:

```javascript
const mongoose = require('mongoose');

//... and then farther down the file
mongoose.connect('mongodb://localhost:27017/crud_v01', { useNewUrlParser: true});
mongoose.connection.once('open', () => {
  console.log('DB IS CONNECTED :)');
});
```

Our server.js so far:

```javascript
const express = require('express');
const mongoose = require('mongoose');
const app = express();

/* =================================================== */

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

mongoose.connect('mongodb://localhost:27017/crud_v01', {
  useNewUrlParser: true,
});
mongoose.connection.once('open', () => {
  console.log('DB IS CONNECTED :)');
});

/* =================================================== */

app.get('/', (req, res) => {
  console.log('GET /');
  res.json('SERVER IS WORKING');
});

app.post('/fruits', (req, res) => {
  if (req.body.readyToEat === 'on') {
    //if checked, req.body.readyToEat is set to 'on'
    req.body.readyToEat = true;
  } else {
    //if not checked, req.body.readyToEat is undefined
    req.body.readyToEat = false;
  }
  res.json(req.body);
});

/* =================================================== */

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('SERVER IS WORKING ON http://localhost:' + PORT);
});

```

1. `mkdir models`
2. `touch models/fruit.js`
3. Create the fruit schema

   ```javascript
    const mongoose = require('mongoose');

    const fruitSchema = new mongoose.Schema({
        name:  { type: String, required: true },
        color:  { type: String, required: true },
        readyToEat: Boolean
    });

    const Fruit = mongoose.model('Fruit', fruitSchema);

    module.exports = Fruit;
   ```

4. Import `Fruit` into `server.js`

   ```javascript
    const Fruit = require('./models/fruit');
   ```

### Create a Seed Route

Sometimes you might need to add data to your database for testing purposes. You can do so like this via a route:

```javascript
// FRUITS SEED ROUTE
app.get('/fruits/seed', (req, res) => {
  Fruit.insertMany([
    {
      name: 'grapefruit',
      color: 'pink',
      readyToEat: true
    },
    {
      name: 'grape',
      color: 'purple',
      readyToEat: false
    },
    {
      name: 'avocado',
      color: 'green',
      readyToEat: true
    }
  ], (err, fruits) => {
    res.json(fruits);
  })
});
```

![](https://i.imgur.com/K9oPPyI.png)

### Use Mongoose to persist Data in MongoDB

Inside `server.js`.

#### CREATE Route

```javascript
app.post('/fruits', (req, res)=>{
    if(req.body.readyToEat === 'on'){ //if checked, req.body.readyToEat is set to 'on'
        req.body.readyToEat = true;
    } else { //if not checked, req.body.readyToEat is undefined
        req.body.readyToEat = false;
    }
    Fruit.create(req.body, (error, createdFruit)=>{
        res.json(createdFruit);
    });
});
```

![](https://i.imgur.com/7lFtkTg.png)

#### INDEX Route

```javascript
app.get('/fruits', (req, res) => {
  Fruit.find({}, (err, allFruits) => {
    if (err) { console.log(err) }
    res.json(allFruits);
  });
});
```

#### SHOW Route

```javascript
app.get('/fruits/:id', (req, res)=>{
  Fruit.findById(req.params.id, (err, foundFruit)=>{
    if (err)  { res.send(err) }
    res.json(foundFruit);
  });
});
```

![](https://i.imgur.com/4wg18Ki.png)

#### DELETE Route

```javascript
app.delete('/fruits/:id', (req, res)=>{
  Fruit.findByIdAndRemove(req.params.id, (err, deletedFruit)=>{
     if (err)  { console.log(err) }
    res.json(deletedFruit);
  });
});
```

#### UPDATE Route

```javascript
app.put('/fruits/:id', (req, res)=>{
    if(req.body.readyToEat === 'on'){
        req.body.readyToEat = true;
    } else {
        req.body.readyToEat = false;
    }
    Fruit.findByIdAndUpdate(req.params.id, req.body, {new:true}, (err, updatedModel)=>{
        res.send(updatedModel);
    });
});
```

![](https://i.imgur.com/TUKzsE5.png)

### Additional Resources

* [Mongoose Docs](https://mongoosejs.com/)

