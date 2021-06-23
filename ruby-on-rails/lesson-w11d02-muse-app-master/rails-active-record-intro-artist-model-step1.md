[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails Muse App

## Objectives

_After this lesson, students will be able to:_

- Describe Active Record and ORMs
- Describe database tables and migrations
- Explain primary and foreign keys
- Understand how to query a database using Active Record
- Perform CRUD actions on one model using `rails console`

## Preparation
*Before this lesson, students should already be able to:*

- Understand Rails routing
- Describe the Rails framework

## Finished App - WDIR MUSE
Over the next few lessons we're gonna build an app that tracks Artists and Songs. Here's a deployed version of [WDIR Muse](https://wdir-muse.herokuapp.com/)

<br>

![wedo](http://i.imgur.com/6Kce0ca.png)

## Generate the Muse Rails App
1. `cd` into the directory that you want to create your app
1. Run this in your Terminal `rails new muse -d postgresql` to generate a new Rails app called Muse
	- `-d postgresql` tells Rails that we want to use a Postgresql database instead of SQLite3 (the default). This adds `gem pg` to our `Gemfile`
2. Be sure to `cd` into the `muse` project folder and open the project in your IDE of choice
4. Run `rails db:create db:migrate` to initialize our database and create a `db/schema.rb` file
5. Open a new Terminal tab and start the Rails server with `rails s`. You'll want to keep the server running in a seperate window to make your workflow easier.
6. In your browser, navigate to `http://localhost:3000`. You should see the Rails welcome page
6. Let's go ahead and make our first `git` commit:

    - `git add -A`
    - `git commit -m "first commit - created and migrated database"`

<br>

![wedo](http://i.imgur.com/6Kce0ca.png)

## Create our `Artist` Model

Let's kick the tires with Rails, Postgresql and Active Record. We'll start building the data layer of our Muse app by creating an `Artist` model.

1. Make sure to `cd` into your Muse App directory. Some starter code is [here](https://github.com/marcwright/muse-wdir) if you want to clone. Be sure to pull the `muse-setup` branch. That's the starting point for this lesson.


2. `rails g model Artist name hometown img albums:integer`
	- This command will create a **migration file** that will let the database know about our new Model
3. Run `rails db:migrate`
	- This command will write the **migration** file information to our `schema.rb`. It'll tell our Postgresql database to create an `artists` table with the appropriate fields.


### Seed our database with artists

Let's seed our database with some Artists so we have some data to work with.

1. Copy and paste this data into your `db/seeds.rb` file:

	```ruby
	Artist.create(name: "Rihanna", albums: 6, hometown: "Barbados", img: "http://mccarthyamp.com/wp-content/uploads/2016/02/23445669273_bfc7c4062b_b.jpg")
	Artist.create(name: "Taylor Swift", albums: 8, hometown: "Nashville", img: "https://upload.wikimedia.org/wikipedia/en/f/f6/Taylor_Swift_-_1989.png")
	Artist.create(name: "Billy Joel", albums: 14, hometown: "Long Island", img: "https://images-na.ssl-images-amazon.com/images/I/81RgoBLQOKL._SY355_.jpg")
	Artist.create(name: "Drake", albums: 4, hometown: "Toronto", img: "http://images.complex.com/complex/image/upload/t_in_content_image/drake-thank-me-later-album-cover_o6ek33.jpg")
	Artist.create(name: "Beyonce", albums: 6, hometown: "Houston", img: "http://www.fuse.tv/image/571c26a6017704456e00001b/816/545/beyonce-lemonade-album-cover-full.jpg")
	```

2. Run `rails db:seed` from the command line to populate your database

3. Open a new Terminal tab and enter `rails c` to confirm that we have some data to work with.
4. In `rails c`, type in `Artist.count` and confirm that you have 5 Artists.


<br>

![wedo](http://i.imgur.com/6Kce0ca.png)

CRUD for our Artist Model
------------------------------
<details>
<summary>What does CRUD stand for?</summary>
<br>
**CRUD** is an acronym for the four verbs we use to operate on data: **C**reate,
**R**ead, **U**pdate and **D**elete. **Active Record** automatically creates methods
to allow an application to read and manipulate data stored within its tables.

</details>

Before we create the controllers and views of our app we're gonna take a look at what Active Record is doing under the hood with our models. We're gonna take a look at the exact same code we're gonna put into our Rails controllers later on.


## Create

### `.new` + `.save`
Let's create an instance of the `Artist` object on the ruby side, but that does not save originally. Note the syntax for creating a `new` instance.

```ruby
adele = Artist.new(name: "Adele", hometown: "London", albums: 3, img: "https://pbs.twimg.com/profile_images/657199367556866048/EBEIl2ol.jpg")

adele.name 	#=> "Adele"
adele.hometown 	#=> "London"
```
To save our instance to the database we use `.save`:

```ruby
adele.save

adele
# We know that the Artist has been saved because it now has id:, created_at: and updated_at: fields.
```

<br>

![youdo](http://i.imgur.com/ylb6WX9.gif)

Create your a Artist using `.new` and `.save` and add him/her to the database.

<br>

### `.create`
**YOU DO** - The `create` method will both instantiate and save a new record into the database:

```ruby
sia = Artist.create(name: "Sia", albums: 5, hometown: "Sydney", img: "https://pbs.twimg.com/profile_images/692921625801592833/sny-shV1.png")
```

<br>

![youdo](http://i.imgur.com/ylb6WX9.gif)

Add an Artist to your database using `.create`

<br>

## Read

Active Record provides a rich API for accessing data within a database. Below
are a few examples of different data access methods provided by Active Record.

```ruby
# return a collection of all students
artists = Artist.all
```

```ruby
# return the first student
first_artist = Artist.first
```

```ruby
# return the first user named Adele
adele = Artist.find_by_name('Adele')

# or
adele = Artist.find_by(name: 'Adele')

# or find by id
taylor = Artist.find(2)

# '.where' will return all artists named Adele who live in London
adele = Artist.where(name: 'Adele', hometown: 'London')
```

<br>

![youdo](http://i.imgur.com/ylb6WX9.gif)

- Find the Artist with 14 albums
- Find the Artist with an `id` of 4


You can learn more about querying an Active Record model in the [Active Record
Query Interface](http://guides.rubyonrails.org/active_record_querying.html) guide.

<br>

## Update

Once an Active Record object has been retrieved, its attributes can be modified
and it can be saved to the database.

```ruby
britney = Artist.find_by_name('Adele')
britney.name = 'Britney'
britney.save
```

A shorthand for this is to use a hash mapping attribute names to the desired
value, like so:

```ruby
adele = Artist.find_by_name('Britney')
adele.update(name: 'Adele')
```
<br>

![youdo](http://i.imgur.com/ylb6WX9.gif)

- Choose a Artist and update their `name` and `hometown` attributes

<br>


## Delete

Likewise, once retrieved an Active Record object can be destroyed which removes it from the database.

```ruby
adele = Artist.find_by_name('Adele')
adele.destroy
Artist.all 	#=> confirm she's been deleted
```
<br>

![youdo](http://i.imgur.com/ylb6WX9.gif)

- `delete` an Artist

## Independent Practice (15 mins)

- Create 3 new Artists
- Update an Artist's attribute
- Delete an Artist you created

<br>

## `git commit`
	
- `git add -A`
- `git commit -m "created the artist model seeded the database"` 

<br>

![Imgur](http://i.imgur.com/wPefQjh.png)

## Conclusion (5 mins)

In this lesson we dove into some dense topics:

- Relational Databases
- SQL (Structured Query Language)
- Postgresql
- ORM (Object Relational Mapper)
- Active Record

We also created an `Artist` model for our Muse app. In the next lessons we're gonna add a second model (`Song`) and create an Active Record association with `Artist`. We'll also add views and forms to our Rails app so that we can perform CRUD operations in the  browser.


<br>
## Additional Resources

- https://guides.rubyonrails.org/routing.html
- https://guides.rubyonrails.org/action_controller_overview.html
- https://guides.rubyonrails.org/active_model_basics.html
