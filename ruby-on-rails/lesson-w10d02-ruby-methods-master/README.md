[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Ruby Methods

## Lesson Objectives

- Identify specific differences between Ruby and JavaScript in the following areas... 
  - Methods (Functions)
- Advanced Ruby argument discussion

## Blocks

Any code surrounded by curly braces is a block.

```ruby
2.times {
  print "Hey!"
}
```

With blocks, you can group a set of instructions together so that they can be passed around your program.

The curly braces can also be traded for the words `do` and `end`, which is nice if your block is longer than one line.

```ruby
loop do
  print "Hey!"
end
```

## Methods

As stated before, everything in Ruby is an object so there is no distinction in this language between functions and methods. Under the hood, even seemingly stand-alone functions are in fact associated with an object. The convention, however, is to call these methods.

**We use the word `method` in Ruby, never `function`. If we do, it's mostly out of habit.**

A method is made up of a few components. Take a look at the following method.

```ruby
def double( number )
   doubled_number = number * 2
   return doubled_number
end

double( 3 )
# => 6

double 3
# => 6
```

This method has several components to point out:

 - def - the Ruby equivalent of function
 - double - the method name in the above example
 - number - the argument name in the above example
 - end - closes the method

Passing arguments in Ruby works fairly similar to how it does in JS. They get passed as comma separated values after the method name.

```ruby
def hello(name, greeting, small_talk, punctuation)
  "#{greeting} #{name}, #{small_talk}#{punctuation}"
end
```

Lets think back to the behaviors of arguments in JS. Remember how lenient it is?

In Ruby, if you specify a number of arguments, the function must take that number of arguments. No more, No less. 

### Less
```ruby
$ hello("Jamie", "Hark", "frickin' cold eh")

=> ArgumentError: wrong number of arguments (given 3, expected 4)
```

### More
```ruby
$ hello("Jamie", "Hark", "frickin' cold eh", ".", "Forsooth, ye yonder pilgrim is quite the bespoke son of a tailors daughter, ai?")

=> ArgumentError: wrong number of arguments (given 5, expected 4)
```

SIDENOTE: Ruby's errors are amazing. Use them!

There are some fun ways to play with arguments and define further behavior:

### Default arguments

```ruby
def drink_milk(thirsty = true)
  return "I'm not thirsty" unless thirsty

  "mmmmmm... milk...."
end
```

### Woah, that return statement?

In Ruby, returns are implicit by design. Ruby will always assume that the last line of the method will be returned. So why the first return?

Can you read it in English? One of Ruby's biggest benefitsis that it reads pretty closely to English

Additionally, you can add the statements `if` and `unless` to your return statement, which acts similarly to an if block.

```javascript
function apiCall(err, data){
  if (err){
    return err;
  }

  // Do stuff
}
```

vs.

```ruby
def api_call(err, data)
  return err if err

  # Do Stuff
end
```

### Everything is an Expression

```ruby
def add(a, b)
  a + b
end

add(1, 2) # => 3

add(1, 2, 3)
# > ArgumentError: wrong number of arguments (given 3, expected 2)
```

Notice we do not need the keyword ```return```. The last line hit by the method will always be the return value. This is called an implicit return.

### Predicate Methods (?)

This is similar to adding the bang to the end of a method. Predicate methods using `?` returns a boolean value.

```ruby
  5.odd?
  # true
  5.even?
  # false
  something = "A thing"
  # => "A thing"
  something.nil?
  # => false
```

## Ruby Code Style Guide

The Ruby community is very opinionated about styling.  As you are starting out, you MUST follow [these rules](https://github.com/bbatsov/ruby-style-guide).

Here are the most important rules

**Casing**

* All variables and methods must use `snake_case`
* All classes and modules must use `CamelCase`
* All constants (besides classes and modules) must use `SCREAMING_SNAKE_CASE`

**Blocks**

* A single line block must use `{` and `}`
* A multi-line must use `do` and `end`
* If an argument is unused it should start with `_` (or just be named `_`)
  * `hash.each { |_key, val| puts val }`

**Methods**

* A method should end with a `?` if an only if it always returns a boolean
  * These are called _predicate methods_
* A method ending in `!` should be a _dangerous_ version of the method sans `!`
  * _dangerous_ means either that it can mutate the object _or_ that can raise an error
* Don't name methods like `get_foo`, `set_foo`. They should be `foo` and `foo=`
* **Do** use `attr_reader` and `attr_writer`
* Do not use parens when calling a method without args
  * `super` is one possible exception
* **Do** use parens for every method except for DSLs (and a small list of other common methods)
  * `attr_reader`, `puts`, `require`, `include`, `it`, `has_many`, ...