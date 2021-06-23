# Momentum Clone

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

## Momentum Clone

### Spec:

Today we're building a clone of the popular chrome homepage extension, [Momentum](https://chrome.google.com/webstore/detail/momentum/laookkfknpbbblfpciffpaejjkokdgca?hl=en).

![Example](../.gitbook/assets/momentum_spec.png)

{% file src="../.gitbook/assets/momentum.zip" caption="Starter Code" %}

## First Part: Get The Data

Don't get too deep into CSS for this part! The goal for part 1 is to just get the data you need from the API's. You'll do styling in part 2.

If you want to change the font color to white, or the background image to the right size that's fine.

### STEP 1:

Use the [Unsplash API](https://unsplash.com/) to get a random photo for the background image. Read the docs to determine the right endpoint to do this. Once you have the response data inspect the object. Which part of the data do you think would be helpful for what we need here? Remember, our goal here is to set the background of our site to a random image. When you find what you need, write a function that sets the background image of our site to the random image from the API.

> -Note that unsplash does have a limit of 50 hits per hour. Once you have this feature done, consider commenting out the fetch call so you don't make fetches while working on other features.  
>   
> -Also note that your CORS chrome extension will need to be on for it to work!

### STEP 2:

* [ ]  Use the [Open Weather API](http://api.openweathermap.org) to get the current weather. You'll need to sign up for an account and get an API key. 
* [ ] Figure out how to get the right data! We want to use this API to get the current temperature in Riyadh. Spend 25 minutes reading [the docs](https://openweathermap.org/current) and using Postman to figure out how to get the current temperature in Riyadh from this API. Reading documentation to figure out how to access data is an important skill, try and give it your best shot! If you can't figure out how to do this in 25 minutes, **the answer is below**. 
* [ ] Now that you have the data, append that data to your page. 

### STEP 3:

Use the [Forismatic API](https://forismatic.com/en/api/) to get a random quote for the bottom of the page. You do not need a unique key for this. You are probably supposed to, but I have found that the key used in the examples from the docs works just fine. Read the docs to determine how to get a random quote. When you have the random quote, append the quote to do the DOM. \(this is an example of an API with very limited and poor documentation\). An alternative quote API is [Quote of the Day](https://quotes.rest/qod).  
they **really need you to be very strict about what they wrote.**  


### STEP 4:

Use [Moment](http://momentjs.com/) to render a time. Momentum is not an API, it's a library for a time. Paste this CDN to the header of your HTML to gain access to the Moment library in your app:

```markup
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.20.1/moment.min.js"></script>
```

Now in your main.js file put this there: `console.log(moment().format('LTS'))`. Look, you have the time! Append this time to the HTML page to finish the app. Reading the docs may be helpful for context.

### Solution \[First Part =&gt; STEP 2\]:

if your API link like this: `api.openweathermap.org/data/2.5/weather?q=riyadh&appid={YOUR_API_KEY}`

you will get this error:

![](../.gitbook/assets/image%20%2824%29%20%281%29.png)

To solve it you should add `https://` before the API link.  
This is the endpoint needed to get the data **\[First Part =&gt; STEP 2\]**:`http://api.openweathermap.org/data/2.5/weather?q=Riyadh&units=metric&APPID=REPLACE-THIS-WITH-YOUR-API-KEY`

## Second Part - Style it!

Now that we have all the data we need, add CSS! To do this you'll have to go into your javascript and add classes or Id's to your code \(don't remember how? [Here](https://api.jquery.com/addclass/) are the jQuery docs for adding classes\). You'll also have to add a `style.css` file, link it your `index.html`, then add styles!

Some styling suggestions:

1. The background image is too big! Resize the background image so you can see the whole thing in the frame.
2. Center the time and make it larger! Change the font size and color appropriately
3. Move the temperature to the top right corner. Change the font size and color appropriately
4. Move the random quote to the bottom of the page. Change the font size and color appropriately.

Add any other minor details you see.

## Bonus:

* Have Unknown instead of the author name in STEP 3 when the quoteAuthor is an empty string.
* Look at the spec, do you see that little icon next to the temperature? Below there is an object with icons you can use for this. Add the appropriate icon next to the temp. If the API says it's sunny, there should be a sun, clouds if it is cloudy, etc.

```javascript
const icons = {
  clear: '☀',
  rain: '️🌧',
  storm: '⛈',
  snow: '🌨',
  mist: '🌫',
  clouds: '☁'
};
```

{% hint style="info" %}
**VS-Code tricks:**   
1- **Rename a variable or a function:**  
=&gt; highlight it then press **F2**

2- **Copy and** Paste **a line:**  
=&gt; click anywhere in a line using the mouse then press **Ctrl+C** then **Ctrl+V**

3- comment on uncomment specific lines:  
=&gt; highlight them then press **Ctrl+/**
{% endhint %}

## What are CORS errors?

* [CORS Explained](https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS/Errors)
* [Wikipedia](https://en.wikipedia.org/wiki/Cross-origin_resource_sharing)

#### How Do I avoid CORS errors?

* [3 Ways to Fix Cors Errors](https://medium.com/@dtkatz/3-ways-to-fix-the-cors-error-and-how-access-control-allow-origin-works-d97d55946d9)
* You may need to add [this chrome extension](https://chrome.google.com/webstore/detail/cors-unblock/lfhmikememgdcahcdlaciloancbhjino?hl=en) to bypass CORS errors. Be sure to turn it off once you are done working on the lab.
* Append `https://cors-anywhere.herokuapp.com/` to the front of your API endpoint. For example: `https://cors-anywhere.herokuapp.com/https://dog.ceo.api.com/random/images`
* To [Test CORS](https://webbrowsertools.com/test-cors/).

