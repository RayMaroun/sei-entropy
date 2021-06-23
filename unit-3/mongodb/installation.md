# Installation

### Install with Homebrew

* [Homebrew: The missing package manager for macOS](https://brew.sh/)
* [Mongo Manual Install](https://docs.mongodb.com/manual/installation/)
* Check if homebrew is installed: `brew`

  ```text
  	* If not, install [Homebrew](https://brew.sh/) by following the instructions on the web page
  	* If brew is already installed `brew upgrade`.
  ```

* **Install Mongodb on Mac OS X:** `brew install mongodb`

### Set data location

In terminal type `brew services start mongodb` to run the mongo server.

You will probably get an error saying

> "Data directory `/data/db` not found., terminating"

```text
- if so, you will need to make the directories in your **root** directory as follows (do these commands anywhere):
```

* Create data directories \(at the root level\) \_ `sudo mkdir /data` \_ `sudo mkdir /data/db`
* Next, set root permissions \* `sudo chmod -R 777 /data`

Run the mongo server again: `mongod`.

Should see: "waiting for connections on port 27017"

### Open and close mongo

* Open another terminal tab `cmd + T` and type `mongo`
* To quit `mongo`, type `exit` or `quit()`.
* To quit `mongod` hit `control+c`

Finished!

### Errors

If at some point you get an error with `mongod`:

1. `ps -A | grep mongod`
2. find the line that just mentions `mongod`, but not `grep`
3. take note of the number on the left
4. type `kill 1774` or whatever that number is. Try `mongod` again.
5. If that doesn't work, go to `/data/db` and `rm mongod.lock`. Try `mongod` again.

### Down the Rabbit Hole: Hungry for More

[Understanding Permissions](https://www.elated.com/articles/understanding-permissions/)

### Install Mongo for Windows

1. Download [MongoDB.msi](https://www.mongodb.com/download-center/community) and install it \[community server =&gt; v **4.4.3\]**
2. `PRESS` on `WINDOWS KEY` on your keyboard, then `TYPE` **environment variables** and `CLICK` it
3. Go to **Advanced** `TAB`, then `CLICK` on **environment variables** `BUTTON`
4. In the up section `PICK` **Path** In the `USER SECTION` and, then `CLICK` on **edit**, then `CLICK` on **new** `BUTTON`
5. This path `C:\Program Files\MongoDB\Server\4.4\bin`
6. `CLICK` on **ok** `BUTTON` \(repeat this step three times\)

### 

### Extra \(Download Robo 3T\)

1. Download [Robo 3T.msi](https://robomongo.org/download) and install it \(v **1.3.1**\)
2. Open it and `CLICK` on **Create**, then `CLICK` on **Save**
3. `CLICK` on **Connect**
4. `PICK` **New Connection**, then `PICK` **learn** database, then `PICK` **Collections**, then `PICK` **contacts** collection

