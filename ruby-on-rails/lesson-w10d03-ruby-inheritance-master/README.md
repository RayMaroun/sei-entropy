# Ruby Inheritance

## Objectives

By the end of this, developers should be able to:

- Diagram the Ruby method lookup chain.
- Write a class which inherits from another class.
- Write a mixin.
- Desribe reasons why inheritance and Mixins are desirable.

## Ruby Inheritance

Ruby will be our first example of linking different objects together in a hierarchy. This process is called "inheritance" and the result is what we mean when we say an object "inherits" behavior from another object.

Some objects can be classified in multiple ways. These multiple classifications often make sense as a hierarchy. For example, a `Dog` is a kind of `Pet`. It's also a kind of `Animal`. In Ruby, we can share code (data or behavior) between two classes using **inheritance**. Let's look at an example of inheritance. Note that a Ruby class can only inherit from one other class, so whether you name that class `Pet` or `Animal` will depend on your application.

```ruby
class Animal
  def eat
    puts "Nom nom nom"
  end
end

class Dog < Animal
  def speak
    puts "woof"
  end
end

class Cat < Animal
  def speak
    puts "meow"
  end
end

dog = Dog.new
dog.eat # "Nom nom nom"
dog.speak # "woof"

cat = Cat.new
cat.eat # "Nom nom nom"
cat.speak # "meow"
```

### Lab: Inheritance

- Create a class named `Vehicle` which has a method named `start` that `puts "Engine is on!`.
- Create a class named `SpaceShip` which inherits from `Vehicle` and has a method named `fly` which puts `Up up and away!`.
- Create a class named `Car` which inherits from `Vehicle` and has a method named `drive` which puts `Vroom!`.

## Ruby: Super Inheritance

`Super` will call the same method defined in the `parent` or `superclass` and give you the result.

```ruby
class Animal
  def move
    "I can move"
  end
end

class Bird < Animal
  def move
    puts super + " by flying"
  end
end

class Fish < Animal
  def move
    puts super + " by swimming"
  end
end

bird = Bird.new
bird.move

fish = Fish.new
fish.move
```

### Lab: Super Inheritance

- Add a method named `move` to your `Vehicle` class that returns `Here we go `.
- Rename your `fly` method in your `SpaceShip` to `move` and use `super` so that it prints `Here we go Up up and away!`.
- Rename your `drive` method in your `Car` to `move` and use `super` so that it prints `Here we go Vroom!`.

### Lab: Drawing the Method Lookup Chain in Ruby

Please diagram the method lookup chain using the following requirements:

- Create a class `TVShow` that has an instance method called `roll_credits`.
- Create a class `FamilyFeud` that inherits from the class `TVShow` and has an instance method called `fast_money`.
- Diagram creating a new instance of the `FamilyFeud`
- Diagram how Ruby finds and executes the methods called on  `FamilyFeud`

```rb
steve_harvey_family_feud = FamilyFeud.new
steve_harvey_family_feud.fast_money
steve_harvey_family_feud.roll_credits
```

### Lab: Model Shapes Using Classes

A `Rectangle` is a `Shape`, and a `Square` is a `Rectangle`.

#### Creating a 'Shape' Class

Define a Shape class with the following:
- `num_sides`: set during instantiation, read-only.
- `side_length`: set during instantiation, readable and writable.
- `color`: NOT set during instantiation, readable and writable.
- `Shape.new(num_sides, side_length)` should create a shape.
- `calculate_area` methodwhich calculates the area of a 'regular' shape (all sides equal) for the given side length. The mathematical formula for this is:
```
area = num_sides * length * length / (4 * tangent(PI/num_sides))
```

#### Creating a Rectangle Class

- Rectangles should be instantiated with `Rectangle.new(3, 4)` to create a rectangle with a length of 3 and a width of 4.
- Instances of Rectangle should respond to the `#calculate_area` method and give the correct result.

#### Creating a Square Class

- Squares should be instantiated with `Square.new(4)` to create a square with all sides equal to 4.
- Instances of Square should respond to the `#calculate_area` method and give the correct result.

## Mixins

Mixins are useful when we want to make chunks of code that are reusable across multiple classes but they do not inherit from the same class.  These "chunks" are called `modules`. Take a look at the code below:

```rb
# define module Sleeper
module Sleepable
  def go_to_sleep
    puts "nap time"
  end
end

# define Class Person
class Person
  include Sleepable
end

# define Class Computer
class Computer
  include Sleepable
end

dell = Computer.new
dell.go_to_sleep # "nap time"

human = Person.new
human.go_to_sleep # "nap time"
```

In the code above, we defined a `module` called Sleepable. We also define a `Person` class and a `Computer` class. By using the keyword `include` followed by the name of the module (in this case `Sleepable`) we have access to the methods we defined in our module.  This is great because it allows us to keep our code *D-R-Y*, not to mention it allows us to be lazy developers (the good kind of lazy).

## Additional Resources

- http://www.zenruby.info/2016/06/ruby-classes.html
- https://www.codequizzes.com/ruby/intermediate/inheritance-ancestors-super
- https://www.codequizzes.com/ruby/intermediate/monkey-patching-modules-singleton-methods
