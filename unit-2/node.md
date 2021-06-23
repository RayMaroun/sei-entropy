# Node

[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)![Misk Logo](https://i.ibb.co/KmXhJbm/Webp-net-resizeimage-1.png)

## Node

Node.js runs JavaScript code. This means that millions of frontend developers that already use JavaScript in the browser are able to run the server-side code and frontend-side code using the same programming language without the need to learn a completely different tool.

For us, that means we can run javascript on our local computers without needing to rely on the browser and eventually we can build web servers with javascript!

let's watch [this video](https://www.youtube.com/watch?v=uVwtVBpw7RQ)

### Installation

Let's install node together. In your terminal, run the following command

```text
brew install node
```

Then we can check what version of node we have downloaded with

```text
node -v
```

For windows users or those not using `brew`, follow [install steps here](https://nodejs.org/en/)

For [windows 7 ](https://www.centennialsoftwaresolutions.com/post/install-node-js-on-windows-7)only

### Node JS REPL

With Node, we can enter a javascript REPL environment \(read–eval–print loop\), similar to our browser console.

To do this, we simply run `node` in the terminal. Notice how now our terminal starts with `>`.

We are now in a javascript REPL environment so commands like `ls` or `cd` will not work. But commands like `const name = 'Hazim'` will.

To exit the REPL we can type `.exit` or use `ctrl + c`.

```text
$ node
> 1 + 1
2
> .exit
$
```

### Running JS files with Node

Let's have a javascript file called `test_node.js` located at **W04D03.** We can execute that file with node by running `node test_node.js` in the terminal.

### NPM \(node package manager\)

A node package is one or more modules grouped together. To help us manage our packages node includes a package manager named NPM. We can use it to install packages globally throughout our whole computer or locally to individual projects.

[npm video](https://www.youtube.com/watch?v=ZNbFagCBlwo)

## LAB: \(15 min\): read about[ NPM](https://www.w3schools.com/whatis/whatis_npm.asp)

