# Installing Ruby

## Objectives

* Install Ruby via rbenv
* Have the correct Ruby running
* Easily switch Ruby versions
* Execute a Ruby script

## Note

The `$` means to run it in the Terminal. So if I write `$ which ruby` it means to run `which ruby` in your bash Terminal.


## Have the correct Ruby running

MacOS comes with its own version of Ruby. The OS uses Ruby to run various processes. So while it's not terrible to mess with the configuration of your systems Ruby (i.e. changing permissions, sudo installing gems etc.), it's better just have our own version that we can change and update without worrying about the side effects.

To see where the current Ruby is being executed, run: `$ which ruby`. This should output to `/usr/bin/ruby`.

If we run `$ ruby -v`, it'll output the standard one at the current time. Not every app uses this version, so we need to use our own tool to manage Ruby versions.


## Install Ruby via rbenv

In your bash terminal:

```bash
# rbenv enables us to download Ruby
brew install rbenv

# list all the available Ruby versions
rbenv install -l

# Find the latest one that looks like:
# 2.6.1
# that DOES NOT have a -dev or -rc, but a -p is OK
# At the current time, the latest one is 2.6.1
rbenv install 2.6.1
# This takes awhile!
```


## Have the correct Ruby running (continued)

Now we'll check to see if we're using the correct version of Ruby.

Previously, when we ran `$ which ruby`, we got `/usr/bin/ruby` and `$ ruby -v` gave us `2.0.0`. Let's fix that.

```bash
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile

# Refresh bash source
source ~/.bash_profile

# Use your version here
rbenv global 2.6.1
which ruby
```

The end result you should be similar to `/Users/<your user name>/.rbenv/shims/ruby`.


## Easily switch Ruby versions

Let's install another version of Ruby. Previously we had `2.6.1`. Let's install `2.4.4` for funsies.

```bash
# bash

# This will take a minute
rbenv install 2.4.4

# Now we can see what we have available to us
rbenv versions

# Let's set it to 2.4.4
rbenv global 2.4.4

# Print our current Ruby version
# It should be 2.4.4
ruby -v
```


> We now have the most up to date version of Ruby available.  If you want to learn more about how rbenv works check out it's documentation [here](https://github.com/sstephenson/rbenv).


## Execute a Ruby script

Let's make a directory for our random Ruby scripts.

```bash
# bash
cd ~/sei/tmp
mkdir ruby_scripts
cd ruby_scripts
touch example.rb
code example.rb
```

```ruby
# example.rb
puts "Hello World!"
```

```bash
# bash
ruby example.rb
```

Yay!
