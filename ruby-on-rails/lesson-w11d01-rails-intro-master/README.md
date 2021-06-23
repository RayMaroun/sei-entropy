# Introduction to Rails

![Rails Logo](https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Ruby_On_Rails_Logo.svg/1200px-Ruby_On_Rails_Logo.svg.png)

## Lesson Objectives
_After this lesson, developers will be able to:_

- Explain why Rails is necessary
- List some of the responsibilities of a typical server application, and identify which components within MVC map to those responsibilities
- Diagram the process flow from Client through Database and back
- Map MVC roles to specific components of Rails
- Indicate where different types of files can be found within a Rails application
- Follow along in the creation of an App
- Initialize a Rails project
- Use a PostgreSQL DB with Rails
- Run a migration to create a table
- Run migrations to create and rename columns
- Make models and query them with ActiveRecord
- Build a complete server side in Rails
- Create a model with full CRUD capability

<br>
<hr>


## What is Rails?

[Rails is a server-side web application development framework written in the Ruby](https://en.wikipedia.org/wiki/Ruby_on_Rails) programming language. It is designed to make programming web applications easier by making assumptions about what every developer needs to get started. It allows you to write less code while accomplishing more than many other languages and frameworks. 

### It's Features:
- Open Source - free to use, anyone can contribute
- Vast collection of open source code available within the Rails community
- MVC framework (Model View Controller)
- RESTful application design
- Built-in ORM (Object Relational Mapping  programming technique for converting data between incompatible type systems using OOP.
  - Example: converting data that is in rows/columns/tables into JSON), called Active Record, based on [Active Record Pattern](https://en.wikipedia.org/wiki/Active_record_pattern) **
- Encourages Agile web development
- Strong focus on testing, and utilizing testing for documentation


Rails is a server environment just like Node. The big difference is that Rails favors **convention** over **configuration**.

Rails can get things up and running quickly and effectively -- as long you do it _exactly the way Rails tell you to_. For example

* Rails wants you to name your models and controllers a certain way, otherwise it won't work.
* Rails requires you to run a small program called a migration in order to change any database fields.

Node, by comparison is a blank slate where all things are possible. The tradeoff, with Rails, is ease of use for large-scale applications. Whether this is a straightjacket or a wonderful gift is up to you as a developer.

<br>
<hr>


### Rails Philosophies:

- DRY (Don't Repeat Yourself)
- Convention Over Configuration

We've seen a lot of similar things in our previous units. That's because Rails emergence and popularity influenced web development as a whole, and many new frameworks continue to use many of the successful patterns and features that Rails developed.

Something we haven't seen yet, is a new philosophy called `Convention Over Configuration`

- Express is a minimalist framework, where you add in each piece of functionality that you need. Therefore you must also configure everything. There are some recommended patterns, but you can really build the app any way you want.

- Rails provides you with tons of functionality. However, in order to utilize this right-out-of-the-box functionality you must follow all of the Rails conventions.
  - This means proper **pluralization** and **capitalization** will make or break your app (literally).

### Express vs. Rails in our Course


| Comparison |Express| Rails |Comments |
|:----------:|:-----:|:-----:|:-------:|
|Language|JavaScript| Ruby | Still need JS on the front end|
|Database| MongoDB| Postgres |MongoDB is considered NoSQL, while Postgres is SQL|
|ODM/ORM| Mongoose| Active Record |Active Record will convert our SQL into HTML/JSON|
|Third Party Code|NPM| Gem/ bundler/ bundler install|By default Gems are installed globally. By default, npm packages, are local|
|server-side rendering|EJS or Handlebars| [erb](https://www.stuartellis.name/articles/erb/)|server-side rendering|
|run the server |nodemon| rails s| You'll see something called puma running in terminal|


<br>
<hr>


## Server Application

Suppose we wanted to build a server application that can show a profile:

1. A client computer makes a
    GET request that asks for a specific page.
1. When the GET request is received by the server, the server application parses the request and identifies which measurement record is being requested.
1. The data for the desired measurement gets retrieved from our set of records.
1. Finally, the desired data gets put into a HTML file and sent back to the client.

Suppose we wanted to build an server application that records a user's height and weight. It might work as follows:

1. A user interacts with a front-end application, triggering a POST, and this POST request contains data - specifically, the latest measurements of height and weight.
1. When the POST request is received by the server, the server application parses the request and extracts the relevant information.
1. The data from the POST request gets added to our records.
1. As confirmation, a success message in HTML gets sent to the client.

If we were to try to generalize and abstract away the differences between these two steps, we might say that our web application needs to:

1. Receive incoming requests from a client.
1. Execute specific behaviors in response to those requests.
1. Create, read, update, or destroy data records through some kind of data storage system.
1. Share information back to the client.

The quartet of 'create', 'read', 'update', and 'destroy' is commonly known as 'CRUD'; each refers to a specific type of action that can be performed on our data storage system. Each of these types might have more than one specific action associated with it ('read one' vs 'read all', for instance).

One common way of dividing up these four responsibilities is the
**Model-View-Controller** (MVC) architecture pattern. This pattern involves making three core types of components, each responsible for a different part of the server's functionality.

A **Model** directly manages the data in our application, and provides a representation of that data for the rest of the application to use.

A **View** is like it sounds - it's data that gets sent back to the client for the user to consume.

A **Controller** responds to user requests as they come in, and utilizes both the model and the view components to perform the desired behavior and produce a response.

In addition to these three types of components, however, there is a fourth piece that it's important to consider with web development particularly: routing. **Routes** indicate to the server which controllers should be triggered (and how) by which kinds of requests. It's a critical piece of the puzzle, and one we'll be looking at later today in more detail.

What which part(s) of an HTTP request does the router use to determine which code to run?

MVC architecture is very common in web applications, and Rails gives us the tools to spin up applications that are roughly in line with the idea of MVC.

## Lab - Act Out an MVC

We're going to act out the various parts of an MVC application. Link up with another team so that you're in a group of eight, and assign each member of your 'super-group' one of the roles below. These roles are:

- Client
- Server
  - Router
  - Controllers
    - People Controller
    - Places Controller
    - Things Controller
  - Models
    - People Model
    - Places Model
    - Things Model
  - Views
    - People View
    - Places View
    - Things View

Once you've divvied up the roles, take two minutes to read through the directions for your role, found [roles directory](roles). These directions explain what your responsibilities are and how you should carry them out. However, **you may only communicate with the teammates listed in your role card**.

- _Developers playing the role of the model should record their information in the tab associated with their group number found at the bottom of the spreadsheet link in `./roles/model`_.

We'll work through one example request together, and then each group will work independently to answer all remaining requests. Once all groups have finished, we'll have a retro-style discussion about how everything went.


<br>
<hr>

##  &#x2600; BUILD A NEW RAILS APP

To start a new rails app, you **do not** have to make a directory. 

We are going to build an app called

### `intro_app`

The command to build our rails app with Postgres is the following:

```bash
rails new intro_app -d postgresql
```

In English:

Hey `rails` make a `new` project called `intro_app` and set the database `-d` to `postgresql`.


What's all this stuff, One more time?

* `rails new` will make a new project directory and populate it with folders and files
* The name of our app is `intro_app`. 
* With the `-d` flag we specify which type of database to use. In our case, we use `postgresql`


you may need to enter your computer pwd

You can learn more about the `rails new` command by running
`rails new --help`

```
cd intro_app
code .
```

💥💥 Made a mistake typing `rails new`? Just remove the folder that was created and re-run the command. It is far faster to do that than go into the config files and update stuff💥💥

<br>

Terminal feedback will look something like this:

![](https://i.imgur.com/vliTe0q.png) Etc...

<br>
<hr>

## MVC with Rails

Rails is a web framework - a tool that helps us quickly and easily build web applications - written in Ruby, and designed and created by David Heinemeier Hannson (also known as 'DHH'). Although Rails applications don't match up perfectly with the abstract idea of MVC, their architecture is fairly similar.

Open it up in Atom. Have a look at the file structure. Let's take a step back and just look at directories at the top level of the app.

```sh
.
├── app
├── config
└── db
```

For now, you only need to think about `app`, `config`, and `db` - you probably
won't be touching any code outside of those three directories. How is that
possible? Because Rails actually builds out most of these files and folders for
you, every time you use it to create a new application. That's why it's called
a 'framework' - it gives you the skeleton for a brand new app, which you can
then customize.

- The `app` directory holds the code for our application itself. We'll be
    writing a lot of code here.
- `config` holds configuration settings for our app and for the things that
    plug into it. This includes things like environmental variable settings and
    secret keys, but also things like the routing configuration for our server
    (which is not strictly part of our Rails app, but which our app uses);
    the `routes.rb` file, in particular, defines all of the routing for our
    app.
- `db` holds files related to the structure of the application's database.
    The database, like the server, is separate from Rails and is not strictly
    part of the app, so it makes sense to keep this outside of the `app`
    directory.

Let's dive into the `app` directory. This app in particular has more going on
than yours probably will, but it still has all the basic components.

```bash
./app
├── controllers
├── models
└── views
```

Three of these directories should jump out at you: `controllers`, `models`, and
`views`. Each holds the different Ruby files that Rails uses to handle the
respective responsibilities of MVC.

Don't worry about `assets`, `views`, `mailers`, or `helpers` for now, as these all deal with more of the "views" portion of an application, which our front-end is handling. Building a web application with [Rails' default settings](http://rubyonrails.org/) will give you this [monolithic](https://en.wikipedia.org/wiki/Monolithic_application) application style.

## How to Approach Understanding Rails

There is a **lot** of structure and code automatically provided by Rails, and as Rails developers, we only need interact with and understand a small part of it. In fact, the creator of Rails has himself stated that he doesn't need to know or understand all of the Rails framework ([watch the video clip](https://www.youtube.com/watch?v=zKyv-IGvgGE&feature=youtu.be&t=34m55s))!

For the aspects of the Rails framework we are concerned with, excellent descriptions and code examples can be found in the [Getting Started with Rails guide](https://guides.rubyonrails.org/getting_started.html).

<br>

# &#x1F449; CREATE DATABASE

`rails db:create` creates your postgres database based on the name of your Rails app.

![](https://i.imgur.com/DIlpKJY.png)

![](https://i.imgur.com/GjPRN2F.png)

We can check that the database was created by typing

```
rails dbconsole
```

This will open up our postgres CLI.

Close it again with `\q`.


<br>
<hr>

# Rails Server

Now we can run `rails s` from the command line to start our server. Go to `localhost:3000` in the browser and you should see this: 


![](https://i.imgur.com/cjBrX5j.png)

<br>

![](https://i.imgur.com/EjvruMO.png)

<br>
<hr>

## Files and Folders

`cd intro_app`

`code .`

![](https://i.imgur.com/sA1UmdB.png)

There are many files and folders that Rails makes for us. This is in stark contrast to Express that give us . . . a package.json.

|   |Express| Rails|Comments|
|:-:|:-----:|:----:|:-------:|
|project meta-data| package.json | Gemfile | Rails 5.x has a `package.json` by default as well, but that's for extra stuff, not the main meta-data file|
| Server | Express | Puma/Rack |Puma is the server, Rack deals with the middleware, these are configured and arranged pretty differently from Express, so you won't see a `server` file in the root|
|Controllers| controllers | app/controllers | part of MVC |
| Models | models | app/models | part of MVC |
|Views|we used ejs (handlebars is another common one), but we also used Angular| erb, BUT! We won't use it, when we're ready we'll jump into using React|part of MVC|

We don't need to look inside these nooks and crannies. The idea is that Rails will do a bunch of stuff for us inside of these 'black boxes'. This is in contrast to Express where we see everything, including all the middleware config.

Rails gives you all this stuff and you just have to play along with it.

Almost everything you will ever do will be in the `app` folder.

You'll do a bit in the `db` folder, in the `config` folder, and the `Gemfile`.

### For today we're focused only on two directories: `app/models` and `db`

&#x1F535; **Here's what we are going to do today:**


- Step One: make a static About Me page
- Step Two: make a database with table and columns
- Step Three: make a model and interact with it

This is all we will do. There are very specific processes for doing these things. Once these foundations are built, we can begin to free ourselves up a bit.

<br>
<hr>

# &#x26A0; STEP ONE
## Create a static About Me page

For starters, let's create a static about me page for you to put links to your GitHub, portfolio, contact info, etc. It's gonna look like this:

<br>

![](https://i.imgur.com/ksjrSBa.png)

We're gonna use some basic error driven development to let Rails guide us in developing our **About Me** page. Pay close attention to the order. The steps are to create a:
    
- route
- controller
- method
- view

#### Create an `/about` Route

1. Navigate to `http://localhost:3000/about` and you should see this:

    ![](https://i.imgur.com/9ikX0Dz.png)
    
    Rails is looking for an **/about** route. Let's build one.

    <br>

1. In the `config/routes.rb` file, let's create a root route (which we'll change later) and a basic route for **/about**:

```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "about", to: "application#about"
end
```

<br>

#### Create a `def about` method

Refresh your browser and you should see the following error:

![](https://i.imgur.com/blP5HED.png)

The **/about** route is looking for an **about** method in our **ApplicationController** so let's build one.

<br>

![](http://i.imgur.com/2BtC2Zx.gif)
<details>
<summary>**CFU** How are routes constructed? For example:<br>
`get "about", to: "application#about"`
</summary>
HTTP verb + Controller + method
</details>

<br>

Let's add an `about` method to our `app/controllers/application_controller.rb`. While we're here, create an instance variable containing your name.

```ruby
class ApplicationController < ActionController::Base
  def about
    @name = 'Usman'
  end  
end
```


<br>

#### Create an About View

Refresh your page and you should see a "missing template" error.

![](https://i.imgur.com/QSbzmUN.png)

<br>

In `app/views` create an `application` folder and create an `about.html.erb` file. Add the following: 

```html
<h1><%= @name %>'s About Page</h1>
```

<br>

![](http://i.imgur.com/2BtC2Zx.gif)

- How does Rails know where to find a view for a specific controller and method?
- What are these tags called- `<%= %>` and `<% %>`? What's the difference between? 

<br>

#### Add a `root` route

We can assign a specific controller/view to the root route `localhost:3000` like so:

```ruby
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#about"
  get "about", to: "application#about"
end
```

<br>

![](http://i.imgur.com/2BtC2Zx.gif)

- You should be able to see this view at both `http://localhost:3000/about` and `http://localhost:3000/`. Why?




<br>
<hr>

## Methodical, Error-Driven Development

Status checks will be frequent. As developers we want to be meticulous and make
sure we're getting errors where expected as we build our server.

This is called "error-driven development". The goal is to see an error, and to
learn what error to expect. Embrace the errors, and they will tell you what
your next task is.

Follow the steps outlined in good Error Driven Development

1. Route
    - Test the route, see that a route does not exist
    - Add the route
    - Test the route, see that a route does exist
1. Controller
    - Test the route, see that a route does exist but controller does not
    - Add the controller
    - Test the route, see that a controller exists
1. Model
    - Test the route, see that a controller exists but model does not
    - Add the model
    - Test the route, see that a Model exists
1. Migrations
    - Test the route, see that a Model exists but migrations must be run
    - Run migrations
1. View
    - Test the view, see that it does not exist
    - Add the view
1. Test Feature
    - Test the route, ensure actions are successful
    - Use Rails Console to ensure all data persists as expected
    
## Demo: Todos

### User Stories

- Version 1:
  - As a user, I want to view a single todo
  - As a user, I want to view all todos
  - As a user, I want to create a todo with a title and completed
  - As a user, I want to edit a todo's title and completed
  - As a user, I want to delete a todo

### Entity Relationship Diagram (ERD)

<table>
  <th colspan="2" style="text-align:center">Books</th>
  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>
  <tr>
    <td>title</td>
    <td>string</td>
  </tr>
  <tr>
    <td>completed</td>
    <td>boolean</td>
  </tr>
  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>
</table>

### CRUD for Todos

We'll now go through the steps for completing each CRUD action for multiple resources.

#### Read - index

- `TodosController#index`

#### Read - show

- `TodosController#show`

#### Destroy

- `TodosController#destroy`

#### Update

- `TodosController#update`

#### Create

- `TodosController#create`

<br>
<hr>



# &#x1F449; CREATE A TODO MODEL

A `Model` is the `M` in `MVC`. It represents the data layer of our Rails app. Rails has a handy command line tools that will build a model file and a migration file for us (more on migrations in a second). Run this from the command line:

```ruby
rails g model todo title:string completed:boolean
```
![](https://i.imgur.com/CbkwS1M.png)

- This command creates a migration file and a model file for us.
- Models are always singular. We're telling Rails what an individual `todo` looks like. Rails will look for a `todos` table in the database.
- We can pass in the columns and datatypes as arguments.
- **MAKE SURE** you do not put spaces between the colons!
- If you do not specify the datatype, Rails will assume you want a string. `rails g model todo title completed:boolean` would also work.

<br>
<hr>
 

# &#x1F449; MIGRATIONS

We create our database tables and give them columns through **Migrations**. In SQL this is a **table** that has **columns**. We are going to make a ToDo app with very simple data.


&#x1F535; Open the `db` folder. Check out the `migrate` folder. For the most part we will not interact with it directly, but rather will do so by generating and running **migrations**.

> Migrations are a convenient way for you to alter your database in a structured and organized manner.

> Migrations, using Ruby, are database-language independent.


* The migration generated a `migrate` folder in the `db` folder.
* Inside it is the migration file we created.
* The migration file we just made will allow us to create a table with the columns we want.

The numbers are just a timestamp. All migration files are kept here in sequence so that we have a permanent record of all alterations to our database.

[Why do we use migrations?](http://guides.rubyonrails.org/v3.2.8/migrations.html)


Our file should look like this. The column names are `symbols`

![](https://i.imgur.com/CJQr6At.png)

<br><hr>

# &#x1F449;  Run the migration

We have created the migration, and we have told it what we want it to do. All that's left is to execute it.

When we run the migration it will create/alter our database.

Run the migration with `rails db:migrate`. This command will run every file in the migrate folder in order.

![](https://i.imgur.com/pWz6AGY.png)


### schema.rb

Running the migration screated a `schema.rb` file. This is the schema for all your data.

![](https://i.imgur.com/KbhxUby.png)

#### DO NOT TOUCH THE SCHEMA.RB

*Not to be touched*. *DO NOT MODIFY IT*

Same goes for your migrations. Once you've run a migration *DO NOT TOUCH IT*

<br>

### Check the database itself:

```sql
$ rails dbconsole
```

Opens up a psql shell

See the columns created for the todos table:

```sql
SELECT * FROM todos;
```

![](https://i.imgur.com/qT7EuOf.png)

Quit with `\q`.

Now that our database has been constructed with tables and columns for the tables, let's get some data in there.

### &#x2714; Step 1 complete: making a database with a table and columns

<br>
<hr>


# &#x1F449; ACTIVE RECORD

Active Record, as an ORM Framework, gives us several mechanisms, the most important being the ability to:

- represent models and their data
- represent associations between these models
- represent inheritance hierarchies through related models
- validate models before they get persisted to the database
- perform database operations in an object-oriented fashion
- Active Record is the M in MVC - the model - which is the layer of the system responsible for representing business data and logic.

With ActiveRecord, we do not have to write raw SQL queries, and can instead write Ruby to query the database.

We can open up a console and just write ActiveRecord queries directly.

## Rails console

Open Rails console

```
rails console
```

OR

```
rails c
```

![](https://i.imgur.com/4uRBFpl.png)

* We can see that our `Todo` model exists and that we can perform ActiveRecord queries on it, and we can see the SQL statement used to query the database:

```ruby
Todo.all
```

![](https://i.imgur.com/s6MbslU.png)

There are no Todos yet, but the query works!

```ruby
Todo.count
```

![](https://i.imgur.com/Lp6mWi5.png)

Zero todos.

### Create and Save new Todos

- `.new` (creates a new ActiveRecord object template, but doesn't save it to the DB)
- `.save` (saves a new ActiveRecord object template to the database)
- `.create` (calls `.new` + `.save`)


```ruby
todo = Todo.new(title: "First todo", completed: true)
todo.save
```

```ruby
Todo.create(title: "Something", completed: false)
```

![](https://i.imgur.com/lZOqs5V.png)


### Query Todos

- `.find` (finds by id)

```ruby
Todo.find(1)
```

![](https://i.imgur.com/MjTMsad.png)

- `.where` (takes a key value pairs as arguments to search by)

```ruby
Todo.where(title: "Something", completed: false)
```

![](https://i.imgur.com/QkiKLyK.png)


### Update Todos

- `.update` (takes key value pairs as arguments, with the fields to update)

```ruby
todo = Todo.find(1)
todo.update(completed: true)
```

![](https://i.imgur.com/B7A9nlZ.png)

Or chain the commands together:

```ruby
Todo.find(1).update(completed: false)
```

### Delete Todos

- `.destroy` can either be called on an ActiveRecord object or takes the id of an ActiveRecord object

```ruby
Todo.destroy(1)
```

![](https://i.imgur.com/E83FDGb.png)

OR

```ruby
Todo.find(1).destroy
```

We will be using these Active Record queries within Rails.


&#x1F535; **Activity (9 mins)**

Using rails console `rails c`:

1. Create a new Todo
2. Query Todo to see how many there are in the db
3. Create another Todo
4. Update the second Todo
5. Query Todo to see all of them
5. Delete the first Todo

Type `exit` to leave Rails Console


### &#x2714; Step Two complete: making a model and interacting with it

<br>
<hr>



## Aside
Rails has conventions on how to pluralize and singularize words.

If you would like to check the singular or plural of a word, you can do it by running `rails c` (to quit, type `quit`

![rails c pluralize, singularize ](https://i.imgur.com/RiV71w5.png)

<br>
<hr>

## Code Along: Hospital

### User Stories

- Version 1
  - As a user, I want to view a single patient
  - As a user, I want to view all patients
  - As a user, I want to create a patient with a first name, last name,
    diagnosis and born on
  - As a user, I want to edit a patient's first name, last name, diagnosis and
    born on
  - As a user, I want to delete a patient

### Entity Relationship Diagrams

#### Version 1

<table>
  <th colspan="2" style="text-align:center">Patients</th>
  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>
  <tr>
    <td>first_name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>last_name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>diagnosis</td>
    <td>string</td>
  </tr>
  <tr>
    <td>born_on</td>
    <td>date</td>
  </tr>
  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>
</table>

Follow the same Error Driven Development steps as you did with books!

### CRUD for Patient

#### Read - index

- `PatientsController#index`

#### Read - show

- `PatientsController#show`

#### Destroy

- `PatientsController#destroy`

#### Update

- `PatientsController#update`

#### Create

- `PatientsController#create`

## Lab: Cafeteria 

### User Stories

- Version 1
  - As a user, I want to view a single ingredient
  - As a user, I want to view all ingredients
  - As a user, I want to create an ingredient with name and unit
  - As a user, I want to edit an ingredient's name and unit
  - As a user, I want to delete an ingredient
  
### Entity Relationship Diagrams

#### Version 1

<table>
  <th colspan="2" style="text-align:center">Ingredients</th>
  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>
  <tr>
    <td>name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>unit</td>
    <td>string</td>
  </tr>
  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>
</table>

### CRUD for Ingredient

#### Read - index

- `IngredientsController#index`

#### Read - show

- `IngredientsController#show`

#### Destroy

- `IngredientsController#destroy`

#### Update

- `IngredientsController#update`

#### Create

- `IngredientsController#create`

<br>
<hr>

# REVIEW

1. New Rails project ✔
2. Create the database ✔
3. Create a migration to make a table ✔
4. Insert column fields to the migration file ✔
5. Run the migration -- table and schema made ✔
6. Create a model ✔
7. Test the model with ActiveRecord ✔

<br>
<hr>

## Tasks

Developers should run these often!

- `bin/rake routes` lists the endpoints available in your API.
- `bin/rake test` runs automated tests.
- `bin/rails console` opens a REPL that pre-loads the API.
- `bin/rails db` opens your database client and loads the correct database.
- `bin/rails server` starts the API.


## Additional Resources

- [RailsGuides](http://guides.rubyonrails.org/getting_started.html)
- [Official Rails Documentation](http://rubyonrails.org/)
- [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller)
- [Framework vs Library](https://www.linkedin.com/pulse/whats-difference-between-library-framework-ledion-spaho/)
- [Rails Docs: Routing](http://guides.rubyonrails.org/routing.html)
- [Rails Docs: Controllers](http://guides.rubyonrails.org/action_controller_overview.html)
- [Rails Docs: Active Record Basics](http://guides.rubyonrails.org/active_record_basics.html)
- [Rails Docs: Active Record Querying](http://guides.rubyonrails.org/active_record_querying.html)
- [Rails Docs: Active Model Basics](http://guides.rubyonrails.org/active_model_basics.html)
- [Rails Docs: Command Line](http://guides.rubyonrails.org/command_line.html)
- [Migration Cheat Sheet](https://www.ralfebert.de/snippets/ruby-rails/models-tables-migrations-cheat-sheet/)
- [Rails Reserved Words](https://reservedwords.herokuapp.com/)
- [Rails Status Symbols](http://www.railsstatuscodes.com/)
