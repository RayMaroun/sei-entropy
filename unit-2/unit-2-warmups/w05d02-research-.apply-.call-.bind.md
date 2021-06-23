# W05D02 - Research .apply\(\), .call\(\), .bind\(\)



## Research and Instruct

Each person should research the stated topic, you will have 20 minutes to research about it. Random students will be selected to talk about the topic.

### Level 1

In a method, `this` refers to the owner object. Alone, this refers to the global object. In a function, `this` refers to the global object. In a function, in strict mode, `this` is undefined. In an event, `this` refers to the element that received the event. Methods like call\(\), and apply\(\) can refer `this` to any object.

#### .apply\(\)

apply\(this \[, \[arg1, arg2,...\]\]\): Calls a function with a provided this value. Further arguments are provided as a single array.

#### .call\(\)

call\(this \[, arg1, arg2...\]\): Calls a function with a provided this. Further arguments are provided as a comma separated list

Bind\(\) bind\(this\): Returns a new function whose this value is bound to the provided value.

#### .bind\(\)

bind\(\) is the only method out of the three that returns a new function altogether. It does not call the function.

Find out:

* **What they are**
* **What they do**
* **The difference between them**
* **Give an example using one of these methods**

### Level 2

Find out the difference between:

* **Global binding**
  * By default the execution context for an execution is global which means that if a code is being executed as part of a simple function call then `this` refers to global object. “window” object is the global object in case of browser and in Node.JS environment, a special object “global” will be the value of `this`.
* **Implicit binding**

  * The object literal contains a reference to the object and the function refers to the called object by `this`. If function is invoked by reference, the caller is bonded to `this`. Even nested, the object which refers the function is bounded to `this` object.

  `function foo() { console.log(this.a); } var obj = { a: 2, foo: foo, } obj.foo();`

* **Event binding**
  * The event binding allows you to add an event handler for a specified event so that your chosen JavaScript function will be invoked when that event is triggered for the associated DOM element. This can be used to bind to any event, such as `keypress`, `mouseover` or `mouseout`.
* **New binding**

  * When a function is invoked with `new` keyword then the function is known as constructor function and returns a new instance. In such cases, the value of `this` refers to newly created instance.

  `var bar = new foo(2);`

* **Explicit binding**

  * Specifying explicitly what object will be bound to `this`.

  `function foo() { console.log(this.a); } var obj = { a : 2 } foo.call(obj);`



[Helpful Link](https://medium.com/@koheiarai94/notes-from-you-dont-know-js-this-object-prototypes-663f2df100bc)

