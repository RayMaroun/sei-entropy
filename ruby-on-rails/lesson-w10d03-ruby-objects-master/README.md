# Ruby Objects

## Objectives
By the end of this, developers should be able to:

- Define a class for an object in Ruby that assigns attributes in the initialize constructor.
- Create an instance of an object in Ruby using .new.
- Write setter and getter instance methods for Ruby objects.
- Invoke a getter or setter method using self.
- Contrast defining and invoking class methods with instance methods.

## Introduction

In JavaScript (JS), there's no distinction between Objects and key-value pairs (a.k.a. hashes a.k.a. associative arrays), and in fact, JS objects look and behave similarly to Ruby hashes. However, objects in Ruby behave differently from objects in JS.

Why does the word 'object' refer to two kinds of different things, depending on whether we're talking about Ruby or JavaScript? The answer is that 'object' is actually a much more generic term, referring to an abstraction that represents both data and behavior. In the case of object-oriented programming languages 'object' means a self-contained collection of properties and methods.

The physical world is composed of objects (e.g. cars, buildings) which each have their own attributes and behaviors, so having the ability to model things in this way is very useful for solving problems.


## Creating Classes and Instantiating Objects

Let's briefly recap what we know about objects in JavaScript.

### Make a Rectangle

```js
class Rectangle {
  constructor(length, width){
    this.length = length;
    this.width = width;
  }
  area() {
    return this.length * this.width;
  }
}

const table = Rectangle.new(10, 2)
table.length // 10
table.area() // 20
```

Let's see how we can build classes and objects in  Ruby.

```rb
class Rectangle
  def initialize(length, width)
    @length = length
    @width = width
  end

  def area
    @length * @width
  end

end

table = Rectangle.new(10, 2)
table.length # 10
table.area # 20
```

Because there is no such thing as an 'Object Literal' in Ruby, all new objects must be created using .new

The `@` indicates that we're talking about an instance variable, a property for which each individual instance produced by the class has a unique copy. In other words, every new `Rectangle` will have its own unique `length` and `width` values.

As you can see, it's possible to define methods inside class definitions. Generally speaking, these methods can be invoked on each instance of that class, and so are called instance methods. `.area`, above, is one example.

`initialize`, however, is a special case. `initialize` plays a similar role to `constructor` functions in JavaScript, defining specific values for each instance's properties.

As you can see above, when we create a new object in JS, we don't simply invoke the constructor function -- we need to use a special keyword, `new`, in order for it to work properly.  Similarly, in Ruby, we don't invoke `initialize` directly, but instead invoke a special method, `.new`, directly on the class we want to instantiate (in this case, `Rectangle`).

### Lab: Creating Objects

Define a Ruby class for creating Person objects.  Every Person object should have:

- `first_name` and `last_name` properties
- `introduction` method that prints an introduction using their first and last name

## Getters and Setters

### Make a Car

```js
class Car {
  constructor(model, color){
    this.model = model;
    this.color = color;
    this.fuel = 100;
  }
  drive() {
    this.fuel = this.fuel - 1;
  }
}

const celica = new Car("Toyota Celica", "green");
celica.fuel; // 100

celica.drive(); 
celica.drive(); 
celica.drive(); 
celica.fuel; // 97

celica.fuel = 100; 
celica.fuel // 100
```

And in Ruby we might try...
```rb
class Car
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
celica.fuel # ?

celica.drive
celica.drive
celica.drive
celica.fuel # ?

celica.fuel = 100 # ? 
celica.fuel # ?
```

What happened when we tried this?

In JavaScript, all properties and methods on an object are (by default) both publicly readable and writable. 

In Ruby, all instance variables are private - they can only be accessed or modified within the object - and all methods are public by default (though they can also be made private).

How then can we access the properties of a Ruby object from the outside? Methods defined within the object have access to those properties, and since those methods can be (and usually are) public, we can create methods specifically for accessing properties. These methods are typically called 'getter' and 'setter' methods, based on whether they're used to retrieve ('get') or change ('set') properties.

Let's add getter and setter methods for our car's fuel

```rb
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

### Lab: Writing Getters and Setters

For each of the instance properties you defined earlier, create two accessor methods, a 'getter' and a 'setter', so that those properties can be manipulated after the object is instantiated.

Note: Create both a 'getter' and 'setter' for one property at a time.

## Helper Methods for Accessing Properties

In this last exercise,  you created two methods for each property specified in the Person class.  This was necessary in order to have read and write access to those properties.
But writing all those nearly-identical pairs of methods was pretty tedious, no?

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

Replace the 'getter' and 'setter' methods in your person class with the appropriate helper methods.

## Ruby `self` vs JS `this`

In Javascript, we could use the `this` keyword to reference an object within its own methods.

```js
class Car {
  constructor(model, color){
    this.model = model;
    this.color = color;
    this.fuel = 100;
  }
  drive() {
    this.fuel = this.fuel - 1;
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

### Lab: Ruby `self`

Update your `introduction` method to leverage Ruby's implicit `self`.

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

## Additional Resources

- http://ruby-for-beginners.rubymonstas.org/writing_classes.html
- http://www.zenruby.info/2016/06/ruby-classes.html