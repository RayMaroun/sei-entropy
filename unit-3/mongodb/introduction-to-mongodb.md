# Introduction to MongoDB

### Objectives

By the end of the lesson, students will be able to do the following:

* Define a NoSQL database.
* Select a MongoDB database and collection to work with using the Mongo shell.
* Create, Read, Update, and Destroy documents in a MongoDB collection using the Mongo shell.

### Databases

Databases store our data in a structured way, so we can access what we need when we need it!

The two types of databases we'll learn about in this course are SQL and noSQL.

SQL stands for _"Structured Query Language"_. However, MongoDB is a NoSQL database; this means it's not SQL.

The official terminology is: _not only SQL_.

_**Well what the heck's a SQL database then?**_

![Comparison between SQL and NoSQL](../../.gitbook/assets/image%20%2832%29.png)

### NoSQL Vocabulary - SQL vs NoSQL

Both are considered Databases, but here's the key differences.

* SQL resembles an excel spreadsheet.
* What's normally called a row or record in SQL, is called a document in NoSQL. \(object\)
* What's normally called a column in SQL, is referred to as a field in NoSQL. \(key\)
* What's normally called a table in SQL, is called a collection in NoSQL.
* NoSQL resembles JavaScript or JSON Object.
  * It resembles an array like structure with objects containing key pairs.

_As far as SQL databases are concerned, there are several out there. The most common are mySQL, PostgreSQL, and SQLite. They have well defined columns and rows, and they all use some version of the SQL query language_

_Other examples of NoSQL databases are CouchDB, Couchbase, Redis.It. They are all very flexible because their structure involves sets of key-value pairs that can take any shape. Each NoSQL database has its own \(very similar\) query language._

## Working with MongoDB

### Introduction

* After we installed MongoDB, we'll open two terminals:
  * On the first terminal, run `mongod`. This will start a mongo server.
  * Then, on the second terminal, run mongo. We'll do all our work on this terminal.
* Now that we have our `mongoDB Shell` up and running we can create a database!
  * The command for that is very simple `use <DB NAME>`
  * We'll just tell our shell to use the name we want to give our DB.
  * If that DB doesn't exist, MongoDB will create it for us.
* Now we can create a collection and a document inside that collection with one command.
  * `db.<COLLECTION NAME GOES HERE>.insert({text: 'Put some text here'});`
* This command will create a new database collection with whatever you call it, and then it will insert a document called `text`.
* Say we name our collection `Todo`.
  * `db.Todo.insert({text: 'Clean out the refrigerator'});`
  * This command will create a collection: `Todo` and a document inside of the collection: `text`,
* You can then see the document you created as well as any future additional documents by running the following command:
  * `db.Todo.find();`
  * or `db.Todo.find().pretty();`

You **MUST** have your `MongoDB` server running inside it's own tab in your terminal emulator to perform **any** local development or testing.

**So, to summarize:**

**Before Any Development:** Run `mongod` - This boots up your **MongoDB** server on port 27017.

* This process must run in a separate tab in your terminal in the background.

**If you need a Mongo Shell** Run `mongo` - This will open a shell console to interact with MongoDB directly, just like you're able to interact with your OS from a bash shell. You won't always need a shell, but it's helpful if you ever need to perform tests, or if you don't have a cool UI to interact with your mongoDB.

### More interaction with MongoDB

We need to get comfortable using a mongo shell

We're going to use a new database to practice with called: _**JobContacts**_

So, to use and create our new database we just run: `use JobContacts`

The command to list databases is `show databases`

For example:

```text
> show databases
local  0.078GB
> use contacts
switched to db contacts
> show databases
local  0.078GB
>
```

Note that although I've switched to the `JobContacts` database, I haven't put any data into it yet, it doesn't show up in the database list.

The collection we'll create in our database will be called `contacts`. It has no entries in it yet, which you can see by saying `db.contacts.count()`

```text
> db.contacts.count()
0
```

This is a common pattern in Mongo: you can refer to anything you like, and Mongo will cooperate, but things are not actually created until you give Mongo something to remember.

### Creating data

We're going to start keeping a contacts database for our job search.

_All these people are fictional, they are products of our imagination, any resemblance to actual persons living or dead is purely coincidental_

Our first contact is Joe Recruiter, with Staffing Inc. So we create his record this way:

```text
db.contacts.insert({
    name: 'Joe Recruiter',
    company: 'Staffing Inc.',
    phone: {
        office: '617-555-1991 ext. 311',
        cell: '508-555-9215'
    },
    email: 'joe.recruiter@staffinginc.com'
});
```

MongoDB uses JSON natively, which makes it convenient for Javascript web applications.

Also, the `JobContacts` database exists now that we have inserted data into it:

```text
>  show databases;
JobContacts  0.078GB
local     0.078GB
>
```

Let's add these people to the contacts database:

🔵 **Activity \(7 Minutes\)**

```text
- Consider the JSON representation first: think before you type!
- Add these people to your db
- thumbs up when done
```

Ann Placement-Manager, Staffing Inc., office phone 617-555-1991 ext. 315, cell phone 718-555-9151, email [ann.placementmanager@staffinginc.com](mailto:ann.placementmanager@staffinginc.com)

Martine H. R. Manager, TechCorp LLC, title Director of Human Resources, office phone 617-555-7123, cell phone 617-555-9918, home phone 617-555-1122, work email [martine.h.r.manager@techcorpllc.com](mailto:martine.h.r.manager@techcorpllc.com), home email [martinemanager@gmail.com](mailto:martinemanager@gmail.com)

### Retrieving and Reading Data

Let's start by looking at the entire database so far.

```text
> db.contacts.find();

{ "_id" : ObjectId("5579a06aaa2cdce4a1f15f21"), "name" : "Joe Recruiter", "company" : "Staffing Inc.", "phone" : { "office" : "617-555-1991 ext. 311", "cell" : "508-555-9215" }, "email" : "joe.recruiter@staffinginc.com" }
{ "_id" : ObjectId("5579a202aa2cdce4a1f15f22"), "name" : "Ann Placement-Manager", "company" : "Staffing Inc.", "phone" : { "office" : "617-555-1991 ext. 315", "cell" : "718-555-9151" }, "email" : "ann.placementmanager@staffinginc.com" }
{ "_id" : ObjectId("5579a20aaa2cdce4a1f15f23"), "name" : "Martine H. R. Manager", "title" : "Director of Human Resources", "company" : "TechCorp LLC", "phone" : { "office" : "617-555-7123", "cell" : "617-555-9918", "home" : "617-555-1122" }, "email" : { "work" : "martine.h.r.manager@techcorpllc.com", "home" : "martinemanager@gmail.com" } }
>
```

That's kind of tough to read, so we can filter it through `.pretty()`

```text
> db.contacts.find().pretty();
{
    "_id" : ObjectId("5579a06aaa2cdce4a1f15f21"),
    "name" : "Joe Recruiter",
    "company" : "Staffing Inc.",
    "phone" : {
        "office" : "617-555-1991 ext. 311",
        "cell" : "508-555-9215"
    },
    "email" : "joe.recruiter@staffinginc.com"
}
{
    "_id" : ObjectId("5579a202aa2cdce4a1f15f22"),
    "name" : "Ann Placement-Manager",
    "company" : "Staffing Inc.",
    "phone" : {
        "office" : "617-555-1991 ext. 315",
        "cell" : "718-555-9151"
    },
    "email" : "ann.placementmanager@staffinginc.com"
}
{
    "_id" : ObjectId("5579a20aaa2cdce4a1f15f23"),
    "name" : "Martine H. R. Manager",
    "title" : "Director of Human Resources",
    "company" : "TechCorp LLC",
    "phone" : {
        "office" : "617-555-7123",
        "cell" : "617-555-9918",
        "home" : "617-555-1122"
    },
    "email" : {
        "work" : "martine.h.r.manager@techcorpllc.com",
        "home" : "martinemanager@gmail.com"
    }
}
```

What do we see in this?

* MongoDB gave each of our documents a unique ID field, called ID.
* MongoDB doesn't care that Joe and Ann only have one email, while Martine has two emails. It also doesn't care that Martine has a job title, while Joe and Ann do not.

#### 

#### Searching for particular things

We can pass arguments to `find`, and MongoDB will give us all matching records:

```text
> db.contacts.find({ _id: ObjectId("5579a20aaa2cdce4a1f15f23") }).pretty();
{
    "_id" : ObjectId("5579a20aaa2cdce4a1f15f23"),
    "name" : "Martine H. R. Manager",
    "title" : "Director of Human Resources",
    "company" : "TechCorp LLC",
    "phone" : {
        "office" : "617-555-7123",
        "cell" : "617-555-9918",
        "home" : "617-555-1122"
    },
    "email" : {
        "work" : "martine.h.r.manager@techcorpllc.com",
        "home" : "martinemanager@gmail.com"
    }
}




> db.contacts.find({ company: "Staffing Inc." }).pretty();
{
    "_id" : ObjectId("5579a06aaa2cdce4a1f15f21"),
    "name" : "Joe Recruiter",
    "company" : "Staffing Inc.",
    "phone" : {
        "office" : "617-555-1991 ext. 311",
        "cell" : "508-555-9215"
    },
    "email" : "joe.recruiter@staffinginc.com"
}
{
    "_id" : ObjectId("5579a202aa2cdce4a1f15f22"),
    "name" : "Ann Placement-Manager",
    "company" : "Staffing Inc.",
    "phone" : {
        "office" : "617-555-1991 ext. 315",
        "cell" : "718-555-9151"
    },
    "email" : "ann.placementmanager@staffinginc.com"
}
>
```

We got a call from 617-555-1122 called us! Who could it be?

```text
db.contacts.find({ $or: [
    { 'phone': '617-555-1122'},
    { 'phone.office': '617-555-1122' },
    { 'phone.cell': '617-555-1122' },
    { 'phone.home': '617-555-1122' }   
]});
```

There is an incredibly useful table that translates from SQL to MongoDB syntax at [http://docs.mongodb.org/manual/reference/sql-comparison/](http://docs.mongodb.org/manual/reference/sql-comparison/).

### Try it yourself

I recommend working within your groups so that you can assist each other.

🔵 **Activity \(10 Minutes\)**

```text
- Make up three more fictional people and add them to your contacts database.  
- For now, keep things in the formats we have used with Joe Recruiter, Ann Placement-Manager, and Martine H. R. Director.
- Make sure at least one of your people works for Staffing Inc. or TechCorp LLC.
- Search for your people and make sure you find them in the database!
```

### Update

Suppose that Joe Recruiter has spun off his own firm. We start with finding him in the database:

```text
> db.contacts.find({name: "Joe Recruiter"}).pretty();
{
    "_id" : ObjectId("5579a06aaa2cdce4a1f15f21"),
    "name" : "Joe Recruiter",
    "company" : "Staffing Inc.",
    "phone" : {
        "office" : "617-555-1991 ext. 311",
        "cell" : "508-555-9215"
    },
    "email" : "joe.recruiter@staffinginc.com"
}
>
```

Here's how we can update:

```text
db.contacts.update({
    name: "Joe Recruiter"
},{ $set: {
    company: 'Recruiter Recruitment LLC',
    'phone.office': '508-555-1111'
}});

db.contacts.update({
    name: "Joe Recruiter"
}, {
    $set: { email: 'joe@recruiterrecruitment.com' }
});
```

\(Yes, we could have done both of those in one statement.\)

Notice the $set key: the value is a dictionary of key-value pairs to update.

### You try it

* One of the contacts you added got a job at Staffing Inc. Change his or her company, office phone number, and email.
* One of your contacts has a new job title. Update it.

### Keeping a record of communications

We're using this database to support a job hunt, right?

```text
db.contacts.update({
    name: "Joe Recruiter"
}, {
    $push: { communications: {
        date: '20150611',
        summary: "Discussed General Assembly teaching job" }
    }
});

db.contacts.update({
    name: "Joe Recruiter"
}, {
    $push: { communications: {
        date: '20150612',
        summary: "Discussed General Assembly teaching job further" }
    }
});
```

Joe Recruiter was flagged as a potential case of stolen identity, so we want to remove our contact record:

```text
db.contacts.update({
    name: "Joe Recruiter"
}, { $unset: { communications: 1 }});
})
```

### Deleting a document

Joe Recruiter died in 1878. Definitely stolen identity. No point in keeping him as a contact!

```text
db.contacts.remove({ name: "Joe Recruiter"});
```

### Try it yourself

We're starting a veterinary practice to take care of all the cats we know!

🔵 **Activity \(30 minutes\)**

```text
Start with `use cats` in your MongoDB shell, then add these cats:


* Tiger, male, age 7, black short hair, adopted from NYSPCA
* Reggie, male, age 7, half-Siamese striped tabby, adopted from NYSPCA
* Ting, seal point Siamese, age 8, male, Siamese rescue
* Boris, male, Russian blue, age 5, brother to Natasha, adopted from NYSPCA
* Natasha, female, Russian blue, age 5, sister to Boris, adopted from NYSPCA
* Bond, female, black and white tuxedo cat, age 4, found in Harvard Yard
* Sacco, male, half-Siamese, age 3, adopted from MSPCA, brother to Vanzetti
* Vanzetti, male, half-Siamese, age 3, adopted from MSPCA, brother to Sacco
* M, female, grey tuxedo cat, age 3, adopted from MSPCA
* Gilbert, male, 3/4-Siamese, age 3, adopted from MSPCA
* Sullivan, male 3/4-Siamese, age 3, adopted from MSPCA
* Domino, age 1, black and white tuxedo cat, rescued from Alabama
* Ann, female, age 8, grey leopard tabby, found under a barn, sister to Julian
* Julian, female, age 8, grey leopard tabby, found under a barn, sister to Ann

Some cats have favorite pastimes:

* Tiger likes sitting in the sun.
* Reggie likes complaining at the top of his voice.
* Boris likes echolocating in ventilation systems.
* Sacco and Vanzetti like making mischief.
* Bond likes ordering people around.
* Domino likes harassing other cats.

BONUS:
Now, we're a veterinary practice.   Make up at least fifteen vet visits and use the update + $push method to record them.  Do not distribute them evenly: some cats should have no vet visits on record, others will have several.
- Until the End of Class
```

\_\_

\_\_

