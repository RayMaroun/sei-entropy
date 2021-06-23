# W07D03 - Books API

### Objectives

By the end of this, developers should be able to:

* Write five CRUD endpoints for a library API resource using Express and Javascript.

### Preparation

Create a new directory called **`book-api`**, and then start a new Node App:

```text
mkdir book-api
cd book-api
npm init -y
```

Create an index.js file to match the initialized Node App:

```text
touch index.js
```

Create a `.gitignore`, then add `node_modules` to it, to make sure your node\_modules won't be saved on **Github**:

```text
touch .gitignore
```

Add express to your `package.json`, and make sure it saves:

```text
npm install express --save
```

Here is the starter book array for you:

```text
const books = [
  { title: 'Dictionary', author: 'Webster' }, // 0
  { title: 'Encyclopedia', author: 'Encarta' }, // 1
  { title: 'Clean Code', author: 'Robert Cecil Martin' } // 2
]

```

Now at the top of your file don't forget:

```text
// Import the express node package
const express = require('express')
// Create a new express application
const app = express()
// Add a port variable to tell our app where to listen
const PORT = process.env.PORT || 3000
// Make sure our app can parse incoming JSON payloads for POST and PUT requests
app.use(express.json())
```

Most apps need to do a bit more than always sending back "Hello world". To get some more exposure to Express, build out a minimal API in that that we can use to store books for a library.

### **Don't forget these methods/middleware when creating your express app.** What is Middleware? It is those methods/functions/operations that are called BETWEEN processing the Request and sending the Response in your application method.

When talking about `express.json()` think specifically about POST requests \(i.e. the .post request object\) and PUT Requests \(i.e. the .put request object\)

You DO NOT NEED `express.json()` and for GET Requests or DELETE Requests.

 `express.json()` is a method inbuilt in express to recognize the incoming Request Object as a **JSON Object**. This method is called as a middleware in your application using the code: `app.use(express.json());`

| Response method | What it means |
| :--- | :--- |
| `res.json(jsObject)` | Send a JSON response. |
| `res.send()` | Send a string response in a format other than JSON. |
| `app.use(express.json())` | This is a built-in middleware function in Express. It parses incoming requests with JSON payloads and is based on body-parser. Returns middleware that only parses JSON. |

### **Try to create 3 routes, GET, GET/:id, and POST, but feel free to do all five listed below:**

* `GET /books`: respond with JSON of all books.
* `GET /books/:id`: respond with JSON of one book.
* `POST /add-book` : creates a new book and responds with a JSON of all books.
* `PUT /books/:id` : to update a a book.
* `DELETE /books/:id`: delete book based on id, then respond with success.

###  **Try to use Postman to test all of your requests ^^^^^^^^^**

### **Additional Resources:**

1. [Express - Node.js web application framework](http://expressjs.com/)
2. [Understanding Express.js](https://evanhahn.com/understanding-express/)
3. [How body parser works](https://medium.com/@adamzerner/how-bodyparser-works-247897a93b90)

