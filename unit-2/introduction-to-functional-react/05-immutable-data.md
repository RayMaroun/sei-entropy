# Immutable Data Types

### Learning Objectives

_After this lesson, you will be able to:_

* Define immutable data type
* List common mutable and immutable data types

## What is Immutable?

Something that is **immutable** is something that cannot be changed. In JavaScript, objects and arrays are mutable - they _can_ be changed. A simple example of object mutation \(note that I declare the object as a const, but it is still mutated\):

```javascript
const anObject = {
  foo: 'bar',
};

anObject.foo = 'barrrrrrr';
```

I just changed `anObject`'s value - I mutated it. This happens because JavaScript assigns objects and arrays to variables by **reference**. Changing their properties does not change their reference, and so they are mutated.

Here's an example of mutating an array:

```javascript
const anArray = ['oneFish', 'two fish', 'red fish', 'blue fish']
anArray.pop() // new value of anArray is ['oneFish', 'two fish', 'red fish']
```

In React, components' `state` and `props` are to be treated as immutable. But wait, we have to change the `state`, right? Yes, yes we do. Just never do it by mutating the `state` directly.

## Don't do:

```javascript
handleChange(event) {
  this.state.myPieceOfState = event.target.value
}
```

This method _directly_ mutates the component's `state`. When `state` is updated, we want our components to re-render with the new data. When `state` is mutated, React may _not_ be aware of the change, and re-render may not happen.

The good news is that you already know how to avoid this. React makes it easy: components have a `setState` method that allows us to update the `state` without mutating it. Behind the scenes, React is returning a fresh copy of the `state` \(with a new reference\) with the updated data when you use `setState`.

## Do:

```javascript
handleChange(event) {
  this.setState((prevState, props) => {
    return {
      myPieceOfState: event.target.value
    };
  });
}
```

Component `props` should not be changed within a component at all. There is no `setProps` method. `Props` change _above_ the component in the tree and are passed down. Refer to the unidirectional data flow lesson for more on this.

## Immutability everywhere

Treating data as immutable makes application development easier. Data mutations can be hard to track \(say, in a debugger\). Though vanilla JavaScript does not have immutable object and array types, you can still develop JavaScript applications that treat data as immutable.

### Immutable methods

As mentioned above, `array.pop()` mutates the array. You can achieve the same effect without mutating the array, however. The array methods `map`, `filter`, and `reduce` return modified copies of the array and _don't_ mutate the originals. To `pop` an array without mutating it, you could:

```javascript
const newArray = anArray.filter((item, index, originalArray) => index !== originalArray.length -1)
```

Similiarly, there are ways to change data in objects that don't mutate the originals. ES6 `Object.assign` is great for this.

```javascript
const newObject = Object.assign({}, anObject, { foo: 'barrrrr' })
```

Notice that the first argument to `Object.assign` is an empty object literal - this means that the keys from `anObject` and the third argument will be copied to a brand new object \(with a new reference\), which will be returned as the value of `newObject`.

### Immutable libraries

While it's certainly possible to write vanilla JavaScript applications and maintain immutable data types, it can get tedious, and if you're not careful you can accidentally mutate your data. There are several mature JavaScript libraries that provide immutable data types and/or immutable methods that can make maintaing immutable data types trivial. One of the most popular is [Immutable.js from Facebook,](https://facebook.github.io/immutable-js/) which provides immutable data types like `List`, `Stack`, `Map`, `OrderedMap`, `Set`, `OrderedSet` and `Record` - and methods for making changes to your data like `set`, `get`, `delete`, `update`, etc. With a library like Immutable.js you don't have to think about immutability - just use the types and methods provided, and the library takes care of it for you.

Additional Resources:

* [JavaScript immutable libraries](https://gist.github.com/jlongster/bce43d9be633da55053f)

