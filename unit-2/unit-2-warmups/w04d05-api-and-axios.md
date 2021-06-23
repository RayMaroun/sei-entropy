# W04D05 - API & AXIOS

[Github Repo](https://git.generalassemb.ly/SEI-14/Warmup-W04D05-API-Practice)

We're gonna practice more of accessing API's with Axios, using our own class website!

#### Display All SEI students

* Use this link to access all the students in our website

```javascript
const baseUrl = `https://sei-relativity-ruh.herokuapp.com/developers`
```

* display each name as a list item within the \#main div.
* The list contains all sorts of errors, so try to set some conditions where you only get certain things.
* Remember how to get the data from your response, and remember you have to append to the main page.

`<li></li>`

#### Add your name to the list

> Our database accepts `name` as a param  
> and also accept it as body {"name":"YOUR\_NAME"}

* link the form so that it will take the value of whatever is written in the input field and adds it using Axios to our website's database as a new student

[Axios Documentation](https://github.com/axios/axios)

{% hint style="info" %}
Our API accept deleting one of the developers by using the id  
/developers/ID\_HERE
{% endhint %}

