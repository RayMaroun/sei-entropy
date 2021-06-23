---
description: >-
  This section helps you prepare the React section of your application for
  deployment.
---

# NodeJS and React App Deployment

### CORS Whitelist

Add this code at the top of your NodeJS entry app file `(index.js or server.js or app.js)` .

```javascript
//Don't forget to install cors (npm i cors)
const cors = require("cors");

//Make sure to add to your whitelist any website or APIs that connect to your backend.
var whitelist = [`http://localhost:${PORT}`, "https://<your app name>.herokuapp.com"];

var corsOptions = {
  origin: function (origin, callback) {
    if (whitelist.indexOf(origin) !== -1 || !origin) {
      callback(null, true);
    } else {
      var message =
        "The CORS policy for this application does not allow access from origin " +
        origin;
      callback(new Error(message), false);
    }
  },
};

app.use(cors(corsOptions));
```

### Axios Requests Path <a id="a5c1"></a>

Since we will be using the same URL for our API calls and for serving our app, we’ll have to create a common-path specifically for all our axios Requests . This path needs to be specified in both our server file \(`index.js or server.js or app.js`\) and our axios API calls.

While defining routes , add a parent sub-path \( _/api_ \) to all routes. Make the following changes to your server file Server.js:

Your File Might be looking like show below \( You need to change this \)

```javascript
const usersRouter = require('./routes/buyer');
app.use('/buyer', buyerRouter);

const friendsRouter = require('./routes/seller');
app.use('/seller', sellerRouter);
```

Your File Should look like this

```javascript
const usersRouter = require('./routes/buyer');
app.use('/api/buyer', buyerRouter);

const friendsRouter = require('./routes/seller');
app.use('/api/seller', sellerRouter);
```

When sending the _axios_ from your react app , make sure that the axios request is directed to the correct path . Don’t define the full path or the server port \(like localhost:3000/buyer\) , this is done automatically by Heroku. For example, calling the _**/api/buyer**_ route defined about, well call:

```javascript
doFectchData() {
    axios.get('/api/buyer/')
      .then(response => {
      
        // Your Code Here
          
      });
}
```

### Deployment Methods

#### Together

We can deploy our NodeJS app and react app together as one app.

Firstly, you need to add the build version of the react app to the NodeJS, in other to do this :

* Run `npm run build` from your react app directory.
* After the build is completed, `copy` or `cut` the `build` folder and `paste` it in the NodeJS root directory.
* modify your NodeJS entry app file `(index.js or server.js or app.js)` with the codes below.

```javascript
//must change your port to this for deployment else it wont work
const PORT = process.env.PORT;

//Install path, then write this at the top of your NodeJS entry app file, the
const path = require("path");

//serves all our static files from the build directory.
app.use(express.static(path.join(__dirname, "build")));

// After all routes
// This code essentially serves the index.html file on any unknown routes.
app.get("/*", (req, res) => {
  res.sendFile(path.join(__dirname, "build", "index.html"));
});

app.listen(PORT);
```

> Shortcut push code to github

#### Separately

You can choose to deploy your app and two different servers, i.e. push the NodeJS to a separate server instance and push reactJS app to a separate server instance.

In other to get this working:

* Push your reactJS app to a separate repository on GitHub
* Push your NodeJS app to a separate repository on GitHub
* Push each of these to separate Heroku instances, or you can deploy the frontend to [Vercel](https://vercel.com/).

### References

* [React Deployment](https://create-react-app.dev/docs/deployment/)
* \*\*\*\*[How to Deploy a MERN Stack App on Heroku](https://khemanjain.medium.com/how-to-deploy-a-mern-stack-app-on-heroku-ea1fa054fa08)

