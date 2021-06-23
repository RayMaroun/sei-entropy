[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Rails Active Record Intro

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
<br>

## Concepts + Definitions

### Turn and Talk (15 min)
In groups, do a Google search the following topics:

- Relational Databases
- SQL (Structured Query Language)
- Postgresql
- ORM (Object Relational Mapper)
- Migrations and Schema
- Active Record
- Active Record Associations


I'll ask each group to explain one in their own words to the class.

### Relational Databases (RDBMS)
RDBMS stand for __relational database management system (RDBMS)__. You can think of a relational database as a fancy Excel spreadsheet. Here's what our **Artist** Model will look like:


![](screenshots/google-doc.png)

- In this example, each **Model** in our app would have it's own tab in the spreadsheet called a **Table**.
- Each **Row** in the spreadsheet is an **instance** of the Model and is assigned an `_id`.
- The `_id` is called a **Primary Key**. No record may have the same `_id`. We'll talk more about Primary and Foreign Keys in our associations lesson. 
- Each **column** is a **Field** for that Model.

**NOTE** - Database tables are **plural** (e.g.- "artists") because they contain multiple records/instances of the **singular** `Model`.


<br>

### SQL (Structured Query Language)
Relational Databases are also commonly referred to as **SQL** databases. [**SQL**](https://en.wikipedia.org/wiki/SQL), or Structured Query Language is a special-purpose programming language designed for managing data held in a relational database management system (RDBMS)

**QUESTION** - Can you name some other Relational or SQL Databases? 

Writing SQL queries can be pretty confusing, but luckily, we have a tool that will manage the SQL database queries for us. We'll actually be able to observe the SQL queries that Active Record builds for us in our Rails server console.

<br>

### ORM (Object Relational Mapper)
- *Official* [wikipedia definition](https://en.wikipedia.org/wiki/Object-relational_mapping). A programming technique for converting data between incompatible type systems in object-oriented programming languages.

> Thats sounds like a lot of 5 dollar words, but what does it really mean?

We need a way to encapsulate our databases into objects that we can talk to on our server. ORM's serve that purpose. Remember those tables we created in SQL? Well, its an object represented on our server now. That's what ORM's do.

More concretely ORM's:

- 'Map' (translate) objects to rows in our DB (and vice versa)
- **Conventions**:
  - 1 table per Model/Class/Entity
  - table name is model name pluralized
  - each column is an attribute for that model
- Table associations are handled using foreign keys

It just so happens you will be learning one of the best ORM's on the market (Active Record). It has some of the best documentation and best syntax(because ruby is awesome) the industry has to offer.

<br>

### What is Active Record?
**CFU** -  What does MVC stand for?

**Active Record** is the **M** in **MVC** - the Model - which is the layer of the system responsible for representing business data and logic. In Rails, a Model is a fancy word for a Class. 

Active Record will be a "translator" between what data the user requests and our database. It'll generate the complex SQL queries for us.

To use a restaurant metaphor:

- The user is the customer
- Active Record is the waiter that takes our request to the kitchen
- The kitchen is the database. It contains the ingredients (data) for the order we've requested

<br>

### Migrations and Schema

Rails and Postgresql are separate entities that live in different locations on your computer.

Our `schema.rb` file represents the current state of our database. It's a way to see what our database looks like under the hood (tables, fields, datatypes).

Anytime we want to change or update something in our database we need to run a **migration** which will update our **schema.rb** file and our database. For example, we'd do this when:

- We add a new Model to our app
- We want to add, rename, or delete a field.
- If we want to change a datatype.

<br>

### Active Record Associations

In Rails, an association is a connection between two Active Record models. Why do we need associations between models? Because they make common operations simpler and easier in your code.
The Types of Associations
Rails supports six types of associations:

- belongs_to
- has_one
- has_many
- has_many :through
- has_one :through
- has_and_belongs_to_many

<br>

<details>
<summary>has_many & belongs_to example</summary>
  <br>
consider a simple Rails application that includes a model for authors and a model for books. Each author can have many books. Without associations, the model declarations would look like this:
  
```ruby

class Author < ApplicationRecord
end
 
class Book < ApplicationRecord
end
```

Now, suppose we wanted to add a new book for an existing author. We'd need to do something like this:

```ruby
@book = Book.create(published_at: Time.now, author_id: @author.id)
```

Or consider deleting an author, and ensuring that all of its books get deleted as well:

```ruby
@books = Book.where(author_id: @author.id)
@books.each do |book|
  book.destroy
end
@author.destroy
```

With Active Record associations, we can streamline these - and other - operations by declaratively telling Rails that there is a connection between the two models. Here's the revised code for setting up authors and books:

```ruby
class Author < ApplicationRecord
  has_many :books, dependent: :destroy
end
 
class Book < ApplicationRecord
  belongs_to :author
end
```

With this change, creating a new book for a particular author is easier:

```ruby
@book = @author.books.create(published_at: Time.now)
```
Deleting an author and all of its books is much easier:

```ruby
@author.destroy
```


</details>

<br>

<details>
<summary>has_many :through & belongs_to example</summary>
  <br>
  A has_many :through association is often used to set up a many-to-many connection with another model. This association indicates that the declaring model can be matched with zero or more instances of another model by proceeding through a third model. For example, consider a medical practice where patients make appointments to see physicians. The relevant association declarations could look like this:
  
```ruby
class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
end
 
class Appointment < ApplicationRecord
  belongs_to :physician
  belongs_to :patient
end
 
class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
end
```

The corresponding migration might look like this:
```ruby

class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :physicians do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :patients do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :appointments do |t|
      t.belongs_to :physician
      t.belongs_to :patient
      t.datetime :appointment_date
      t.timestamps
    end
  end
end
```
  </details>
