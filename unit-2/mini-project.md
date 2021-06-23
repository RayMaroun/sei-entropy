# Axios Lab: Mini Project

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

## Mini-Project: Fun with Axios and APIs!

### Introduction

Yesterday we built apps that consumed 3rd party APIs \(Unsplash, Open Weather, Quotes\). Your mini-project prompt is an open-ended one: **you can work together as a group**, make something cool using a 3rd party API of your choosing! **You should each make individual apps**.

### Axios/API/JSON Review

#### What is an API?

> Basically, an API is a service that provides raw data for public use.

API stands for "Application Program Interface" and technically applies to all of software design. The DOM and jQuery are actually examples of APIs! Since the explosion of information technology, however, the term now commonly refers to web URLs that can be accessed for raw data.

APIs publish data for public use. As third-party software developers, we can access an organization's API and use their data within our own applications.

**Q: Why do we care?** &gt; Why recreate data when we don't have to? Think about past projects or ideas that would be easier if you could pull in data already gathered elsewhere. &gt; APIs can provide us with data that would we would otherwise not be able to create ourselves.

As we move into building single page applications, now is the perfect time to start understanding how to obtain data on the client side and then render it on the browser.

#### Why Just Data?

Sometimes that's all we need. All this information, from all these browsers and all these servers, has to travel through the network. That's almost certainly the slowest part of the request cycle. We want to minimize the bits. There are times when we just need the data. For those times, we want a concise format.

#### What is JSON?

**JSON** stands for "JavaScript Object Notation" and has become a universal standard for serializing native data structures for transmission. It is light-weight, easy to read and quick to parse.

```javascript
{
  "users": [
    { "name": "Bob", "id": 23 },
    { "name": "Tim", "id": 72 }
  ]
}
```

> Remember, JSON is a serialized format. While it may look like an object, it needs to be parsed so we can interact with it as a true Javascript object.

#### Where Do We Find APIs?

APIs are published everywhere. Chances are good that most major content sources you follow online publish their data in some type of serialized format. Heck, [even Marvel publishes an API](http://developer.marvel.com/documentation/getting_started). Look around for a "Developers" section on major websites.

**That sounds hard. Can't you just give me a freebie?**

Try the [Programmable Web API Directory](http://www.programmableweb.com/apis/directory) or the [Public APIs Directory](https://github.com/toddmotto/public-apis).

#### What Is An API Key?

While the majority of APIs are free to use, many of them require an API "key" that identifies the developer requesting data access. This is done to regulate usage and prevent abuse. Some APIs also rate-limit developers, meaning they have caps on the free data allowed during a given time period.

**Try hitting the** [**Giphy**](https://api.giphy.com/) **API...**

* No key: [http://api.giphy.com/v1/gifs/search?q=funny+cat](http://api.giphy.com/v1/gifs/search?q=funny+cat)
* With key: [http://api.giphy.com/v1/gifs/search?q=funny+cat&api\_key=dc6zaTOxFJmzC](http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC)

**It is very important that you not push your API keys to a public Github repo.**

> This is especially true when working with [Amazon Web Services \(AWS\)](https://aws.amazon.com/). Here's an example of a [stolen key horror story](https://wptavern.com/ryan-hellyers-aws-nightmare-leaked-access-keys-result-in-a-6000-bill-overnight).

#### What is Axios?

[Axios](https://github.com/axios/axios) is a Promise based HTTP client for the browser and node.js. We use Axios to request data from 3rd party APIs \(or our own seperate API server\). To use, include the library in your `index.html` **ABOVE** your custom script file!

```markup
<body>
  ...

  <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
  <script src="<YOUR-SCRIPT-FILE.js>"></script>
</body>
```

#### How do I make an Axios `GET` request?

[READ THE DOCS](https://github.com/axios/axios)

```javascript
axios({
  method: 'GET',
  url: 'https://randoom_dev.api.com/random_api_endpoint_url'
})
  .then(function(response) {
    // handle success
    console.log(response);
  })
  .catch(function(error) {
    // handle error
    console.log(error);
  });
```

#### What are Promises?

Now we need to tell our AJAX method what to do next. We can do this by doing something with the return value, which comes in the form of a **promise**.

You can think of them as an IOU the the asynchronous nature of Javascript. It's like when you order a pizza. You place your order and are given receipt as an IOU until they prepare your order. In the meantime, you can check your phone, grab a drink, go wash your hands, etc. When your food is ready and delivered, the promise is fulfilled.

What other types of async operations can you think of in real life?

We can use **promise methods** to tell the `axios()` request what to do if the request is successful or not. In this case, we are going to add two...

**.then**

A promise method for when the Axios call is successful...

```javascript
.then(response => {
  console.log("Axios request success!");
  console.log(response);
});
```

**Q: What are we passing into the \`.then\` promise method? Does this remind you of anything we've done previously in class?** &gt; \`.then\` requires a callback that determines what we do after a successful AJAX call.

**.catch**

A promise method for when the Axios call fails...

```javascript
.catch((error) => {
  console.log("Axios request fails!");
  console.log(error)
});
```

> `.catch` requires a callback that determines what we do after an unsuccessful AJAX call.

#### What are CORS erros?

* [CORS Explained](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors)
* [Wikipedia](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)

#### How Do I avoid CORS errors?

* [3 Ways to Fix Cors Errors](https://medium.com/@dtkatz/3-ways-to-fix-the-cors-error-and-how-access-control-allow-origin-works-d97d55946d9)
* You may need to add [this chrome extension](https://chrome.google.com/webstore/detail/cors-unblock/lfhmikememgdcahcdlaciloancbhjino?hl=en) to bypass CORS errors. Be sure to turn it off once you are done working on the lab.
* Append `https://cors-anywhere.herokuapp.com/` to the front of your api endpoint. For example: `https://cors-anywhere.herokuapp.com/https://dog.ceo.api.com/random/images`
* To [Test CORS](https://webbrowsertools.com/test-cors/).

#### What is Postman and why do I care?

[Postman Tutorial](https://www.guru99.com/postman-tutorial.html)

Postman allows us to test out API endpoints **before** we start bulding the front-end of our application in React.

We can **only** use the browser for `GET` requests. If we want to test out **any** other type of HTTP request like `POST` then we must use a tool like Postman.

It is **much easier** to test out and **confirm** these HTTP requests with Postman **first** instead of building an entire front-end with views, forms, buttons, links, etc. **Way too many points of failure!**

### API Exploration

Take 25 minutes to explore the documentation for an API. In particular, think about what you see in the URL and the API response itself. This website has a lot of public API's [public-apis](https://github.com/public-apis/public-apis)

| API | Sample URL |
| :--- | :--- |
| [**This for That**](http://itsthisforthat.com/) | [http://itsthisforthat.com/api.php?json](http://itsthisforthat.com/api.php?json) |
| [**Giphy**](https://github.com/Giphy/GiphyAPI) | [http://api.giphy.com/v1/gifs/search?q=funny+cat&api\_key=dc6zaTOxFJmzC](http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC) |
| [**OMDB API**](http://www.omdbapi.com/) | [http://www.omdbapi.com/?t=Game of Thrones&Season=1](http://www.omdbapi.com/?t=Game%20of%20Thrones&Season=1) |
| [**StarWars**](http://swapi.co/) | [http://swapi.co/api/people/3](http://swapi.co/api/people/3) |
| [**Dog API**](https://dog.ceo/dog-api/) | [http://itsthisforthat.com/api.php?json](http://itsthisforthat.com/api.php?json) |
| [**Game of Thrones API**](https://anapioficeandfire.com/) | [http://api.giphy.com/v1/gifs/search?q=funny+cat&api\_key=dc6zaTOxFJmzC](http://api.giphy.com/v1/gifs/search?q=funny+cat&api_key=dc6zaTOxFJmzC) |
| [**Pokemon API**](https://pokeapi.co/) | [http://www.omdbapi.com/?t=Game of Thrones&Season=1](http://www.omdbapi.com/?t=Game%20of%20Thrones&Season=1) |
| [**Weather Underground**](http://www.wunderground.com/weather/api) | [http://swapi.co/api/people/3](http://swapi.co/api/people/3) |
| [**TV Maze**](http://www.tvmaze.com/api) | [http://dev.markitondemand.com/Api/Quote/xml?symbol=AAPL](http://dev.markitondemand.com/Api/Quote/xml?symbol=AAPL) |
| [**Programmable Web API Directory**](http://www.programmableweb.com/apis/directory) | [http://swapi.co/api/people/3](http://swapi.co/api/people/3) |
| [**Public APIs Directory**](https://github.com/toddmotto/public-apis) | [http://dev.markitondemand.com/Api/Quote/xml?symbol=AAPL](http://dev.markitondemand.com/Api/Quote/xml?symbol=AAPL) |

There's an API for pretty much everything. You can search for more at [Mashape](https://www.mashape.com/explore) or [check out these public APIs](https://github.com/toddmotto/public-apis)

**If you find yourself spending more than 25 minutes just getting the API to talk back to you, you're spending too much time.**

### Not sure where to start? Here is a suggested workflow...

1. Locally, `mkdir` and `touch` html, js, and css files.
2. **Set up your HTML and CSS.** Figure out what you want your app to look like. Be sure to include Axios and link up your files.
3. **Create your Axios call.** Just make sure it's working -- don't worry about handling the response yet.
4. **Extract information from your response.** How do you go about accessing it?
5. **Handle API Response.** What are you going to do with the API response? How will you render it in your HTML/CSS?
6. **Axios error handling.** What will your program do when your API call doesn't work?

**Make frequent commits!**

### MVP - Minimum Viable Product

Your app must have at minimum:

1. A form to accept user input for whatever API you choose
2. Incorporate at least 2 endpoints from your API

**FOR EXAMPLE**

In the Dog API App, we could click a button to get a random dog image **OR** we could type in a specific breed in an input box and make a request for a specific random dog pic. This required the use of **two** endpoints.

#### Advanced features

Going above and beyond the basic implementation is desirable, should you have the time. Feel free to enhance your project with any of the following features:

1. Add buttons that a user can click to get the specific information he/she wants \(e.g. - 5 day, today's weather, a map, etc\)
2. Add a "loading" animation while the data is gathered from the API
3. Implement some of the jQuery methods you've learned \(`fadeIn()`, `fadeOut()`, etc.\)
4. Host your application on [githubpages](https://pages.github.com/)
5. Implement [Google Maps](https://cloud.google.com/maps-platform/)
6. Implement [Bootstrap](https://getbootstrap.com/)

### Suggested Ways to Get Started

* **Wireframe** Make a drawing of what your app will look like.
* **Break the project down into different components** \(data, presentation, views, style, DOM manipulation\) and brainstorm each component individually.
* **Use your Development Tools** \(console.log, inspector, alert statements, etc\) to debug and solve problems
* **Commit early, commit often.** Don’t be afraid to break something because you can always go back in time to a previous version.
* **Consult documentation resources** \(MDN, jQuery, etc.\) at home to better understand what you’ll be getting into.
* **Don’t be afraid to write code that you know you will have to remove later.** Create temporary elements \(buttons, links, etc\) that trigger events if real data is not available. For example, if you’re trying to figure out how to change some text when the game is over but you haven’t solved the win/lose game logic, you can create a button to simulate that until then.

