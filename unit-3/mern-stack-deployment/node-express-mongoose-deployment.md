# Node-Express-Mongoose Deployment

### Learning Objectives

* Define 'deployment'
* Describe the difference between development, test, and production environments
* Deploy a Node App using Heroku
* Set up a Mongoose database using Atlas
* Describe the major points of a 12-factor application
* Use environmental variables to keep sensitive data out of code

### Framing

Deployment is the act of putting an app up on one or more internet-connected servers that allow users to access and use the app.

### About Deployment

> What is deployment? What changes in an application when it is deployed?

#### Requirements for Deploying

There are generally a few things we need for an app to be properly deployed:

* **server** - the server\(s\) must be on and connected to the internet
* **services** - the server must be running the correct services \(web, database, email, etc.\)
* **dependencies** - the server\(s\) must have the proper dependencies installed
* **executable code** - we must get our code onto the server and be able to run it
* **configuration** - we must configure our running app with respect to its deployment environment

#### Deployment Approaches

There are lots of ways to do each of these steps. For example, we can get our code onto a server by...

* Using FTP to transfer the files onto the server
* Adding a git remote and using git push to transmit files \(like with GH pages\)
* Putting the files on a flash drive, fastening it to a homing pigeon's leg, then having an operator receive the pigeon and copy the files over to the server

#### Heroku

Today, we'll be using a service called Heroku to deploy our apps, because it makes all the above steps easy. For example, Heroku automatically does the following...

* starts up a new server when we run heroku create, and installs all the necessary services
* adds a new remote to our git repo, so we can just run git push heroku master to copy our code over
* detects our database
* detects the language our program is written in and chooses a buildpack
* automatically installs our app's dependancies, and starts our app
* easily change configuration information using heroku config

### Environments and Environmental Variables

#### [You Do: Read about Environments](https://app.gitbook.com/@sei-14-sa/s/sei-14-sa-gbook/unit-3/mern-stack-deployment/environments)

> Start by reading about environments. We've been using the `development` environment by default, now we'll look at other environments, particularly `production`.

#### Environmental Variables

Node manages application environments using 'environmental variables'. Environmental variables store configuration information that is defined outside of your codebase. Storing this information separately protects sensitive information like API keys and passwords because it is not visible from your project directory.

This is accomplished using `process` a global object that comes with all node projects. `process` has a property `env` where we store environmental variables.

We can view a projects environmental variables using the node repl in our terminal.

```text
$ cd <your-node-project>
$ node
> console.log(process.env)
```

You can create a new environmental variable in the terminal too! \(terminal, not node!\)

> Make sure there are no spaces next to the equals sign!

```text
$ export <YOUR_ENVIRONMENTAL_VARIABLE_NAME>=<variableValue>
```

> Environment variables tend to be SCREAMING\_SNAKE\_CASE by convention.

Try logging process.env.&lt;YOUR\_ENVIRONMENTAL\_VARIABLE\_NAME&gt; from the node repl to test.

**Bonus: dotenv**

[dotenv](https://github.com/motdotla/dotenv) is a node package used to store sensitive information in the environment. It's a handy tool but not strictly necessary for this deployment. It is a fantastic practice, and accords with [12-factor principles](https://12factor.net/).

### Deploying Node-Express-Mongoose Apps

Deploying our Node-Express-Mongoose application \(our APIs\) consists of 2 sets of steps. First, we'll sign up for Heroku and download the Heroku CLI. Then we'll set up a Mongo database that our app can connect to. Next, we'll configure our Node-Express-Mongoose applications \(our APIs\) to connect to this new cloud-hosted database and finally, deploy our application to Heroku.

### Deploying your app

> Today you can use whatever working project you would like. If your need one to deploy, you can create a new node app and follow along with me or fork and clone this repository.

We'll use Heroku to deploy our app, since it has a "free" pricing tier, and a ton of nice features that simplify and expedite deployment.

1. Sign up for a free [Heroku](https://www.heroku.com/) account.
2. Follow the instructions [here](https://devcenter.heroku.com/articles/heroku-cli) to download the Heroku CLI.
3. From your project directory, create an app on Heroku `$ heroku create <your-app-name>`

> `heroku create` prepares Heroku to receive your code. Heroku will randomly create an app name for you if you don't specify one.

    4. [Set Up Your Cloud-Based Mongo Database](https://app.gitbook.com/@sei-14-sa/s/sei-14-sa-gbook/unit-3/mern-stack-deployment/mongodb-atlas)

> Clicking the link in the header above will take you to a set of instructions for setting up a cloud-hosted \(via AWS\) Mongo database you can use in your deployed Heroku application.

    ****5. **Before** deploying to heroku you will need to make a minor change to your NodeJS entry app file `(index.js or server.js or app.js)`. When Heroku starts your app it will automatically assign a port to `process.env.PORT` \(an environmental variable!\) to be used in production. We can modify `app.listen` to accomodate Heroku's production port and our own local development port.

```text
  const PORT = process.env.PORT || 3001

  app.listen(PORT, () => {
    console.log(`✅ PORT: ${PORT} 🌟`)
  })
```

    6. Define a [Procfile](https://devcenter.heroku.com/articles/getting-started-with-nodejs#define-a-procfile) in the root of your directory. Include the line `web: node index.js`.

> Heroku looks to the `Procfile` for its first instruction when starting your app. In this case, that instruction is to run `node index.js`.

> Another way to do this is to add in your package.json under script, `"start": "node index.js"`

    7. If your deploying with React, finish [this guide](https://app.gitbook.com/@sei-14-sa/s/sei-14-sa-gbook/unit-3/mern-stack-deployment/nodejs-and-react-app-deployment) first before moving to the next step.

    8. Push your code to your 'Heroku' remote.

```text
  $ git add .
  $ git commnit -m "final deployment"
  $ git push heroku master
```

> If you aren't using a master branch you will need to run `$ git push heroku <your-branch>:master`

**Not working?** Check your Heroku log for helpful errors! `$ heroku logs --tail`

     9. Go to your Heroku profile, then choose your deployed project.

![](../../.gitbook/assets/image%20%2886%29.png)

     9. Click "Settings"

![](../../.gitbook/assets/image%20%2877%29.png)

   10. Click "Reveal Config Vars", then add all the necessary environmental variables for your project.

* Examples of environment variables can include:
  * MongoDB URL.
  * Port number.
  * The Secret of your JWT token.
  * Token Duration
  * S3 Bucket \(if you're using Amazon to store files\).
  * Any many more

![](../../.gitbook/assets/image%20%2889%29.png)



     11. Open your deployed app by writing `$ heroku open` in the terminal, or by clicking "Open app" in Heroku

![](../../.gitbook/assets/image%20%2883%29.png)

    

**Not working?** Check your Heroku log for helpful errors! `$ heroku logs --tail`

Great job! Your app is fully deployed. Once finished, read through Heroku's [Getting started with Node.js](https://devcenter.heroku.com/articles/getting-started-with-nodejs). It explains the steps in more depth and highlights many other useful features.

### Google Is Your Best Friend

More often that not, solving deployment issues requires a good deal of Googling. Don't expect to find a silver bullet -- often we must go through many different issues other users may have encountered to understand our own.

What should you Google?

* If you aren't able to deploy, Google the error that shows up in your terminal after trying to push your app.
* If you are able to deploy but your app doesn't load/function properly, see what shows up after running `$ heroku logs` in the Terminal.

### Help Each Other Out

If you notice somebody running into the same problem as you, try working together on debugging it!

