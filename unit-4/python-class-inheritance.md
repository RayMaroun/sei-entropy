# Python Class Inheritance

## Inheritance in Python

### Objectives

* Implement inheritance
* Describe what has been inherited from one class to another
* Identify inheritance syntax
* Use inheritance to reduce repetition
* Use inheritance to model the world

#### Review

1. What is a method?
2. What is a class?
3. What is an instance method?
4. Why do we use a class?

## Inheritance

Inheritance allows us to build new classes out of old classes. It allows us to extend functionality defined in a `parent` class and create `children` classes that extend and compartmentalize different pieces of functionality.

Inheritance models natural hierarchies that we're used to thinking about in the world. We can define one general class to model something like an **Phone** and then `inherit` the methods and properties of the class to make new classes out of the first class, like **IPhone** and **AndroidPhone**.

When we say sub-classes, or child classes, `inherit` methods and properties from a parent class we mean the child class has access to all of the functionality of it's parent, and it can define it's own functionality on top of that.

When we define a class to represent a **Phone** we can add the basic properties and functionality that all phones have.

* All phones have a phone number
* All phones can place phone calls
* All phone can send text messages

After we define what a **Phone** is we can create classes that `inherit` from the Phone class and add their own properties and functionality.

Let's define two new classes that `inherit` from the **Phone** class. We'll make an **IPhone** and an **AndroidPhone**.

* iPhones have a unique `unlock` method that accepts a fingerprint
* iPhones have a unique `set_fingerprint` method that accepts a fingerprint
* Android phones have a unique `set_keyboard` method that accepts a keyboard

```python
class Phone:
  def __init__(self, phone_number):
    self.number = phone_number

  def call(self, other_number):
    print("Calling {} from {}.".format(self.number, other_number))

  def text(self, other_number, msg):
    print("Sending text from {} to {}:".format(self.number, other_number))
    print(msg)
```

```python
class IPhone(Phone):
  def __init__(self, phone_number):
    super().__init__(phone_number):
    self.fingerprint = None

  def set_fingerprint(self, fingerprint):
    self.fingerprint = fingerprint

  def unlock(self, fingerprint=None):
    if (fingerprint == self.fingerprint):
      print("Phone unlocked because no fingerprint has not been set.")

    if (fingerprint == self.fingerprint):
      print("Phone unlocked. Fingerprint matches.")
    else:
      print("Phone locked. Fingerprint doesn't match.")

class Android(Phone):
  def __init__(self, phone_number):
    super().__init__(phone_number)
    self.keyboard = "Default"

  def set_keyboard(self, keyboard):
    self.keyboard = keyboard
```

### Inheritance Syntax

There's two new pieces of syntax used in the code above.

* Class definitions can accept a parameter specifying what class they inherit

  from.

* Child classes can invoke a method called `super()` to gain access to

  methods defined in the parent class and execute them.

Take another look at the Phone classes to see how these pieces of syntax are used to define how the classes define their inheritance and how the `super()` method is used.

Notice how the Android class doesn't repeat the code that attaches the _phone-number passed to the \`\_init_`method to the`self\` reference. The Android class calls the parent constructor through the super method and allows the parent class to execute that default behavior.

```python
class Parent:
  def __init__(self, phone_number):
    self.phone_number = phone_number

class Android(Phone):
  def __init__(self, phone_number):
    super().__init__(phone_number)
```

