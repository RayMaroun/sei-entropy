# Object Oriented Programing with Ruby

## Learning Objectives

- Explain the importance of OOP
- Describe the role of Classes and how they work 
- Define a class for an object in Ruby that assigns attributes in the initialize constructor.
- Create an instance of an object in Ruby using `.new`.
- Write setter and getter instance methods for Ruby objects.
- Explain the `self` keyword.
- Invoke a getter or setter method using `self`.
- Contrast defining and invoking class methods with instance methods.

## Opening

We've already gotten exposure to JavaScript objects using object literal notation (i.e., the curly brackets). You might have created a Person object like this:

```js
const person = {
  firstName: 'Usman',
  lastName: 'Bashir',
  sayHi: function() {
    console.log("Hi, I'm Usman");
  }
}
```

What's nice about the above code snippet? How does it compare to this...

```js
  let firstName = 'Usman';
  let lastName = 'Bashir';

  function sayHi(){
    console.log("Hi, I'm Usman");
  }
```

<details>
  <summary> 
    <strong>Some thoughts...</strong>
  </summary >
</details>

> * Related properties and methods are packaged together. 
> * Fewer global variables. 
> * Readability.


#### How have we been writing code up until this point?

We have been writing **procedural code**, which basically means we are writing and executing code as we need it. We'll define some variables and functions here, maybe some event listeners there. We end up with a lot of separate pieces that contribute to the overall functionality of an application. This goes against the idea of keeping our code **DRY**, short for _Don't Repeat Yourself_. 
  
What do we do when we want to go beyond reusing a value which may just be a primitive or an object containing some key/value data? What if we want to clone an object that has _behaviors_ we seek to reuse?

For example, say we are developing a revamped version of the video game Street Fighter. Each character may have their own unique fighting tricks, but in general, all character objects should have at least the same kick and punch abilities. With DRY in mind, when we develop a new fighter object we know we would want to avoid recreating any of these general behaviors and instead code a solution that clones them. We can most easily solve this problem by following patterns driven by Object Oriented Programming.

In JavaScript, there's no distinction between Objects and key-value pairs (a.k.a. hashes a.k.a. associative arrays), and in fact, JS objects look and behave similarly to Ruby hashes. However, objects in Ruby behave differently from objects in JS.

Why does the word 'object' refer to two kinds of different things, depending on whether we're talking about Ruby or JavaScript? The answer is that 'object' is actually a much more generic term, referring to an abstraction that represents both data and behavior. In the case of object-oriented programming languages 'object' means a self-contained collection of properties and methods.

The physical world is composed of objects (e.g. cars, buildings) which each have their own attributes and behaviors, so having the ability to model things in this way is very useful for solving problems.

#### What is an object in programming?

  An object encapsulates related data and behavior in an organized structure.

#### Why might we use an OOP approach to programming?

Object-oriented programming (OOP) provides us with opportunities to clean up our procedural code and model it more closely to resemble the real world.

OOP helps us to achieve the following...
  * **Abstraction:** Determining essential features 
  * **Encapsulation:** Containing and protecting methods and properties 
  * **Modularity:** Breaking down a program into smaller sub - programs

OOP becomes **very** important as our front-end and back-end code grows in complexity. Even a simple app will have lots of code to do things like...
  * Send requests to a backend to fetch / update / destroy data 
  * Update the state of the page as data changes 
  * Respond to events like clicking buttons

### Creating Objects

So far, we've had to make our objects 'by hand' (i.e. using object literals)...

```js
const celica = {
  model: 'Toyota Celica',
  color: 'limegreen',
  fuel: 100,
  drive: function() {
    this.fuel--;
    return 'Vroom!';
  },
  refuel: function() {
    this.fuel = 100;
  }
}

const civic = {
  model: 'Honda Civic',
  color: 'lemonchiffon',
  fuel: 100,
  drive: function() {
    this.fuel--;
    return 'Vroom!';
  },
  refuel: function() {
    this.fuel = 100;
  }
}
```

Even though we're technically using objects to organize our code, we can see a noticeable amount of duplication. Just imagine if we needed a hundred cars in our app! Our code would certainly not be considered "DRY".

As you may have noticed, some of these properties change between cars (`model` and `color`), and others stay the same. For example, `fuel` starts at 100, while the `drive` and `refuel` functions are the same for every car.

Making all of these similar objects by hand is just tedious. What
if we could build a function that makes them for us?

### Create a `make_car` Method - Lab (10 minutes)

> 5 minutes exercise. 5 minutes review.

Define a method `make_car` that takes two parameters - `model` and `color` - and returns an object representing a car using those params.

```ruby
# This should return a car object just like the previous example
celica = make_car("Toyota Celica", "limegreen")
```

<details>
  <summary> <strong>Solution...</strong></summary >

```ruby
  def make_car(model, color)
    {model: model, color: color}
  end
```

</details>

This is the basic idea behind OOP: we define a **blueprint** for an object and use it to generate multiple instances of it!

## Classes

### Overview

It's so common that we need to make objects with similar properties and methods that programming languages usually have some features to help with this.

Ruby itself provides a feature called **classes** to accomplish this. A class serves as a **blueprint** for instantiating new objects.

It is kind of how 3D printing works.

You have a **blueprint** like the one here.

![](https://media.giphy.com/media/HWICO3FUGCgiQ/giphy.gif)

Which the 3D printer takes and can then print it any number of times.

![](https://media.giphy.com/media/u1XGYJG3KNxiE/giphy.gif)

## Creating Classes and Instantiating Objects

### Make a Person (Code-Along)

Let's start small and build a class representing a `Person`.

```ruby
class Person
  def initialize(name, age = 0)
    puts "A new person was born"
    @name = name
    @age = age
  end

  # Adding instance methods
  def eat
    puts "I am eating lunch"
  end

  def speak(message)
    puts message
  end

  def name
    @name
  end

  def name=(name)
    @name = name
  end

  def password=(password)
    @password = password
  end

  def great(other)
    puts "Hi #{other.name}! My name is #{name}."
  end
end
```

Because there is no such thing as an 'Object Literal' in Ruby, all new objects must be created using .new

The `@` indicates that we're talking about an instance variable, a property for which each individual instance produced by the class has a unique copy. In other words, every new `Person` will have its own unique `name` and `age` values.

As you can see, it's possible to define methods inside class definitions. Generally speaking, these methods can be invoked on each instance of that class, and so are called instance methods. `.eat`, above, is one example.

`initialize`, however, is a special case. initialize plays a role in defining specific values for each instance's properties.

When we create a new object in Ruby, we don't invoke `initialize` directly, but instead invoke a special method, `.new`, directly on the class we want to instantiate (in this case, `Person`).

#### Lab: Creating a Blog Post

Try building a class to represent a blog post. You should be able to edit and delete it. Lastly, any time a new Blog Post is created, print out "A new blog was written".

## Getters and Setters

### Make a Car

Now that you have some experince building classes. Let's go back and build out the following `Car` class. A car should be able to get and set fuel and color but should not be able to set model since the model of the car can not be changed once it is built.

```ruby
class Car
  def initialize(model, color)
    @model = model
    @color = color
    @fuel = 100
  end 

  def drive
    @fuel = @fuel - 1
    puts "Vroom!"
  end

  def refuel
    @fuel = 100
  end
end

celica = new Car.new("Toyota Celica", "limegreen")
civic = new Car.new("Honda Civic", "lemonchiffon")

celica.fuel # ?

celica.drive
celica.drive
celica.drive

celica.fuel # ?

celica.fuel = 100
celica.fuel # ?
```

Classes work a lot like the `make_car` method we just created, but they're supported by Ruby and we use the `new` keyword to generate instances of the Class object (just like our earlier `celica` and `civic` examples).

> Note: All classes and modules must use `CamelCase`.

Now, what happened when we tried this?

In JavaScript, all properties and methods on an object are (by default) both publicly readable and writable.

In Ruby, all instance variables are private - they can only be accessed or modified within the object - and all methods are public by default (though they can also be made private).

How then can we access the properties of a Ruby object from the outside? Methods defined within the object have access to those properties, and since those methods can be (and usually are) public, we can create methods specifically for accessing properties. These methods are typically called 'getter' and 'setter' methods, based on whether they're used to retrieve ('get') or change ('set') properties.

Let's add getter and setter methods for our car's fuel

```ruby
class Car
  def initialize(model, color)
    @model = model
    @color = color
    @fuel = 100
  end

  # 'getter' for @fuel
  def fuel
    @fuel
  end

  # 'setter' for @fuel
  def fuel=(amount)
    @fuel = amount
  end
  
  def drive
    @fuel = @fuel - 1
  end

end

celica = Car.new("Toyota Celica", "green")
celica.fuel # 100

celica.drive
celica.drive
celica.drive
celica.fuel # 97

celica.fuel = 100 
celica.fuel # 100
```

### Make a Animals Class

```ruby
class Animals
  def initialize(species, age, sound)
    @species, @age, @sound = species, age, sound
  end

  def get_older
    @age = @age + 1
    puts @age
  end

  def make_sound
    puts "#{@sound}! Hello, I'm a #{species} And I'm #{@age} years old."
  end
end
```

#### Lab: Writing Getters and Setters

For each of the instance properties you defined earlier, create two accessor methods, a 'getter' and a 'setter', so that those properties can be manipulated after the object is instantiated.

Note: Create both a 'getter' and 'setter' for one property at a time.

## Helper Methods for Accessing Properties

In this last exercise, you created two methods for each property specified in the different classes. This was necessary in order to have read and write access to those properties. But writing all those nearly-identical pairs of methods was pretty tedious, no?

As you know by now, when programmers need to do repetitive tasks,
they usually try to find a way to automate and simplify the work.
And in fact, the developers of Ruby built in a couple of helper methods
for just this purpose.

There are three `attr_` methods available for Ruby objects to use.

| Method Name     | Methods Created       | Other Notes                      |
|:---------------:|:---------------------:|:--------------------------------:|
| `attr_accessor` | 'getter' and 'setter' | The most commonly used.          |
| `attr_reader`   | 'getter' only         | Creating "read-only" properties. |
| `attr_writer`   | 'setter' only         | Rarely used.

The Ruby method `attr_` helper methods take a symbol as an input and
creates 'getter' and 'setter' methods with that symbol as their name.

**attr_accessor example**
```rb
attr_accessor :fuel
#  'getter' for @fuel
#   def fuel
#     @fuel
#   end

#  'setter' for @fuel
#   def fuel=(amount)
#     @fuel = amount
#   end
```

Let's implement these on our car.  A car should be able to get and set fuel and color but should not be able to set model since the model of the car can not be changed once it is built.

```rb
class Car
  attr_accessor :fuel
  attr_accessor :color
  attr_reader :model

  def initialize(model, color)
    @model = model
    @color = color
    @fuel = 100
  end
  
  def drive
    @fuel = @fuel - 1
  end
end

celica = Car.new("Toyota Celica", "green")
celica.fuel # 100

celica.drive
celica.drive
celica.drive
celica.fuel # 97

celica.fuel = 100 
celica.fuel # 100

celica.color # green
celica.color = 'blue'
celica.color # blue

celica.model # Toyota Celica
celica.model = "Ford Explorer" # NoMethodError: undefined method `model=' for
                               # <Car:0x__________________ @model="Ford Explorer">
```

### Lab: Helper Methods for Accessing Properties

Replace the 'getter' and 'setter' methods in all of your classes with the appropriate helper methods.

## Ruby `self` vs JS `this`

In JavaScript, we could use the `this` keyword to reference an object within its own methods.

```js
const celica = {
  model: 'Toyota Celica',
  color: 'limegreen',
  fuel: 100,
  drive: function() {
    this.fuel--;
    return 'Vroom!';
  },
  refuel: function() {
    this.fuel = 100;
  }
}
```

In Ruby, we can use the `self` keyword.

```rb
class Car
  attr_accessor :fuel
  attr_accessor :color
  attr_reader :model

  def initialize(model, color)
    @model = model
    @color = color
    @fuel = 100
  end
  
  def drive
    # self.fuel is reference the getter and setter methods for fuel
    self.fuel = self.fuel - 1
  end
end
```

But, Ruby loves to be short and sweet so we can skip the `self` keyword altogether and just use the name of the method and Ruby will assume we are trying to call a method on the object itself.

In Ruby, we can use the `self` keyword.

```rb
class Car
  attr_accessor :fuel
  attr_accessor :color
  attr_reader :model

  def initialize(model, color)
    @model = model
    @color = color
    @fuel = 100
  end
  
  def drive
    # fuel is reference the getter and setter methods for fuel
    fuel = fuel - 1
  end
end
```

## Ruby Instance Method vs Class Method

Instance methods are invoked on an instance of a class or an object like `drive`, but Ruby also has class methods which can be invoked on the class itself.  `.new` is a class method, we use it by called `Car.new` and not `celica.new`.

To define a class method, we use `self.` before the method name.

```rb
class Airplane
  
  # instance method
  def fly
    puts 'vroom'
  end

  # class method
  def self.inventor
    puts "The Wright Brothers"
  end
end

# Class method
Airplane.inventor # The Wright Brothers

# Class method
plane = Airplane.new

# Instance method
plane.fly # vroom
```

### Lab: Ruby Class Methods

Update your `Person` class to have a class method named `planet` that `puts "Earth"`.


### Make an ATM - Lab (20 minutes)

For this exercise you will be creating an ATM class.

It will have the following properties...
* `type` (e.g., "checking"), which should be determined by some input
* `money`, which should start out as `0`

It should have the following methods...
* `withdraw`, which should decrease the amount of money by some input
* `deposit`, which should increase the amount of money by some input
* `show_balance`, which should print the amount of money in the bank to the console.

The `Atm` class has a `transaction_history` property which keeps track of the withdrawals and deposits made to the account.

- Make sure to indicate whether the transaction increased or decreased the amount of money in the bank.

#### Bonus

Give the `Atm` class a `backup_account` property that can, optionally, contain a reference to another instance of the class, determined by some input

- Whenever an ATM's balance goes below zero, it will remove money from the instance stored in `backup_account` so that its balance goes back to zero.
- This should trigger a withdrawal in the back up account equal to the amount of money that was withdrawn from the original account.

> 15 minutes exercise. 5 minutes review.

### Create a `RecordAlbums` Class - Lab (10 minutes)

It should have the following properties...

- artist_name(string)
- album_name(string)
- songs (array of strings)
- current_song (string from array)

It should have the following methods...

- next_song(method), which prints out its result
- previous_song(method), which prints out its result

-------

## Closing / Questions

- What are the benefits to using an OOP approach to programming?
- What is a class?
- What is `new `?
- How are the last two related?

## Additional Resources

- http://ruby-for-beginners.rubymonstas.org/writing_classes.html
- http://www.zenruby.info/2016/06/ruby-classes.html
