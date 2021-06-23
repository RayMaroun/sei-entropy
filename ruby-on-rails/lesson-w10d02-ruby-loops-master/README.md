[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# Ruby Loops

## Lesson Objectives

- Loops

## Loops

One of the most common things we do as developers is to iterate through data structures.

Whenever we talk about data in Ruby, its important to review how Ruby handles groups of data.

We learned how to iterate over collections in JavaScript using loops. Now we're going to learn the same in Ruby.

### Review JS Loops

<details>
<summary>What loops did we use in JavaScript?</summary>
<code>while</code>, <code>do...while</code>, <code>for</code>, <code>for...in</code>, <code>.forEach</code>
</details>

### Looping with Ruby

In JS if we wanted to print numbers 0 through 3 we would:

```javascript
for(var i = 0; i < 3; i++) {
  console.log(i);
}
// > 0
// > 1
// > 2
```

In Ruby this is much cleaner:

```ruby
3.times { |i| puts i }
# > 0
# > 1
# > 2
```

`times` is a method that takes a _block_.  A block is just a chunk of code that may or may not take arguments.  The closest thing to a block in ES6-land would be an (anonymous) arrow function.

We also have `.upto` and `.downto` methods for looping.

> Yes there _are_ `for` loops in Ruby but we DO NOT use them

But, the closest equivalent to JavaScript's `for` loop is Rubys `for...in` loop

```rb
users = ["Alice", "Bob", "Carol"]
for user in users do
  puts user
end
```

We can also iterate over arrays:

```ruby
arr = [10, 20, 30]

arr.each { |num| puts num }
# > 10
# > 20
# > 30

arr.map { |num| num / 10 }
# => [1, 2, 3]
```

`each` and `map` also take blocks (just like `forEach` and `map` take callbacks in JS).

For blocks with longer lines or multiple lines, replace `{` and `}` with `do` and `end`

```ruby
arr.map do |num|
  "#{num / 10} is great!"
end
# => ["1 is great!", "2 is great!", "3 is great!"]
```

And we can iterate over hashes:

```ruby
hash = { a: 1, b: 2, c: 3 }
hash.each do |key, val|
  puts "the value of #{key} is #{val}"
end
# > the value of a is 1
# > the value of b is 2
# > the value of c is 3
```

### Exercise: Other types of Loops in Ruby (30 minutes)

#### [while](https://ruby-doc.org/core-2.6.1/doc/syntax/control_expressions_rdoc.html#label-while+Loop)

```rb
input = ""
puts "You must guess the Magic Words to exit the while loop!"
while input != "Magic Words" do
  puts "What are the Magic Words?"
  input = gets.chomp
end
puts "You made it out! Congrats!"
```

#### [until](https://ruby-doc.org/core-2.6.1/doc/syntax/control_expressions_rdoc.html#label-until+Loop)


```rb
input = ""
puts "You must guess the Magic Words to exit the while loop!"
until input == "Magic Words" do
  puts "What are the Magic Words?"
  input = gets.chomp
end
puts "You made it out! Congrats!"
```

#### [loop](https://ruby-doc.org/core-2.6.1/Kernel.html#method-i-loop)

```rb
puts "You must guess the Magic Words to exit the while loop!"
loop do
  puts "What are the Magic Words?"
  input = gets.chomp
  break if input == "Magic Words"
end
puts "You made it out! Congrats!"
```

#### [.times](https://ruby-doc.org/core-2.6.1/Integer.html#method-i-times)

```rb
users = ["Alice", "Bob", "Carol"]
users.length.times do |index|
  puts users[index]  
end
```
> [**Further Reading on Ruby loops**](http://www.tutorialspoint.com/ruby/ruby_loops.htm)


### Exercise: Practice Each (15 minutes)

Use `each` to do the following...

- Say hello to everybody in the below array of names (sample output: `Hello Donald!`).

  ```ruby
  names = [ "Donald", "Daisy", "Huey", "Duey", "Luey" ]
  ```

- Print out the squared values of every number in this numbers array.

  ```ruby
  numbers = [ 1, 3, 9, 11, 100 ]
  ```

- Print out the Celsius values for an array containing Fahrenheit values.

  > Hint: `C = (F - 32) * (5 / 9)`

  ```ruby
  fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]
  ```

- Insert all the values in the `artists` array into the `ninja_turtles` array.

  ```ruby
  artists = [ "Leonardo", "Donatello", "Raphael", "Michelangelo" ]
  ninja_turtles = []
  ```

- **Bonus:** Print out every possible combination of the below ice cream flavors and toppings.

  ```ruby
  flavors = [ "vanilla", "chocolate", "strawberry", "butter pecan", "cookies and cream", "rainbow" ]
  toppings = [ "gummi bears", "hot fudge", "butterscotch", "rainbow sprinkles", "chocolate sprinkles" ]
  ```
<details>
  <summary>
    Hint
  </summary>
  Use nested enumerable methods or check out <a href="http://apidock.com/ruby/Array/product">product</a>.
</details>

### Map (30 minutes)

#### Explore 1

Run these two snippets separately:

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.each do |product|
  caps_product = product.upcase
  puts caps_product
  caps_product
end
puts uppercase.join(", ")
```

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map do |product|
  caps_product = product.upcase
  puts caps_product
  caps_product
end
puts uppercase.join(", ")
```

How would you explain the difference in the result?
```

```

#### Explore 2

Consider:

```ruby
cart = ["shoes", "watch", "computer"]
uppercase = []
cart.each{|product| uppercase.push(product.upcase) }
puts uppercase.join(", ")
```

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map{|product| product.upcase }
puts uppercase.join(", ")
```

What is the difference in the result of these two snippets?
```

```

#### Explore 3: Bang

Consider:

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map{|product| product.upcase }
puts cart
puts uppercase
```

Below is the same snippet, but with `.map!` instead of `.map`.

What does `!` often indicate in Ruby?
```

```

```rb
cart = ["shoes", "watch", "computer"]
uppercase = cart.map!{|product| product.upcase }
puts cart
puts uppercase
```

What's the difference between `.map` and `.map!`?
```

```

### Exercise: Practice Map (15 minutes)

Use `map` to do the following...  

1. Create an array that appends "Duck" to everybody in this array of first names

  ```ruby
  first_names = [ "Donald", "Daisy", "Daffy" ]

  #= ["Donald Duck", "Daisy Duck", "Daffy Duck"]
  ```

2. Create an array containing the squared values of every number in this array.

  ```ruby
  numbers = [ 1, 3, 9, 11, 100 ]

  # => [1, 9, 81, 121, 10000]
  ```

3. Create an array with the Celsius values for these Fahrenheit values.

  > Hint: `C = (F - 32) * (5 / 9)`

  ```ruby
  fahrenheit_temps = [ -128.6, 0, 32, 140, 212 ]

  #=> [-89.2, -17.8, 0, 60, 100]
  ```