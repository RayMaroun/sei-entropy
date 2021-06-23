# Mongoose Models Lab

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)[![Misk Logo](https://camo.githubusercontent.com/ff5c98de1d5e33d46e051e4049d8db12d135fd3bc25c14042688ecd0b6179dcd/68747470733a2f2f692e6962622e636f2f4b6d58684a626d2f576562702d6e65742d726573697a65696d6167652d312e706e67)](https://camo.githubusercontent.com/ff5c98de1d5e33d46e051e4049d8db12d135fd3bc25c14042688ecd0b6179dcd/68747470733a2f2f692e6962622e636f2f4b6d58684a626d2f576562702d6e65742d726573697a65696d6167652d312e706e67)



Create a simple mongoose app that does the following. There is no express, so the app should run once, perform the actions described, in the order in which they're described, and then exit.  
  
**Remember these things:**

```javascript
// Do all of this inside it's own folder, called tech-lab
mkdir tech-lab
cd tech-lab

// And don't forget to create your index.js
touch index.js

// Remember to intiate a node app
npm init -y

// Then install mongoose

npm i mongoose --save

// Remember to require mongoose at the top

const mongoose = require('mongoose')

// Then connect to the port that your mongo database is running on, it's
// usually port 27017

mongoose.connect('mongodb://localhost:27017/TodoApp', {
    // Let's clear up the deprecation warnings now
    useNewUrlParser: true,
    useUnifiedTopology:true,
    useFindAndModify: false
}
```

1. Create a model for a Company
   * name \(string, required\)
   * founded \(Date\)
   * employees \(Number\)
   * active \(Boolean\)
   * products \(array of Strings\)
   * CEO \(object with below properties\)
     * name \(String\)
     * age \(Number\)
2. Create Apple
   * name: Apple
   * founded: April 1, 1976
   * employees: 2
   * active: false
   * products: \['computers'\]
   * CEO:
     * name: Steve Jobs
     * age: 21
3. Update Apple
   * name: Apple Inc
   * founded: April 1, 1976
   * employees: 66,000
   * active: true
   * products: \['computers', 'phones', 'tablets'\]
   * CEO:
     * name: Tim Cook
     * age: 56
4. Find Apple
   * log its employees
5. Delete Apple

**STRETCH GOALS:**

Add Google as another Company and repeat the steps from above.

Then try to integrate this into an express app.

```javascript
// Remember to install the express node package
npm i express --save

// Import the express node package
const express = require('express')
// Create a new express application
const app = express()
// Add a port variable to tell our app where to listen
const PORT = process.env.PORT || 3000
// Make sure our app can parse incoming JSON payloads for POST and PUT requests
app.use(express.json())
```

