# Python Installation

## Local Python: Installation Directions

### Python 2 vs. Python 3 <a id="python-2-vs-python-3"></a>

Note: there are two versions of Python. There's Python 2 and Python 3. Python 3 was released in 2008 and included breaking changes. Breaking changes means that an upgrade changes the way some code works and old code won't always work with the way new code wants it to be written.

Why did Python 3 introduce [breaking changes](https://docs.python.org/3/whatsnew/3.0.html)? It turns out there were some things in Python 2 that could have been designed better. [Guido](https://en.wikipedia.org/wiki/Guido_van_Rossum) and the Python community decided that it would be worth it in the long haul to fix those mistakes and get the language back on track for where they want it to be in the future. Upgrading to Python 3 is a good thing!

### Why are some people still using Python 2?

It's easy to convert small projects from Python 2 to Python 3, but large, complex projects are a challenge. In an ideal world, everyone could convert their projects and Python 2 would be laid to rest. In reality, lots of large, popular projects began in Python 2 and the creators don't have the resources \(or incentives\) to upgrade.

As a reminder, **all new projects** should be started in Python 3! Everything we do in this course will always be in Python 3.

### Installing Python 3

Instructions vary slightly depending on what kind of machine you're using. Click the link below that applies to you:

[Installation Instructions: Mac](installation.md#installation-instructions-mac)

[Installation Instructions: Linux](installation.md#installation-instructions-linux)

[Installation Instructions: Windows](installation.md#installation-instructions-windows)

### Installation Instructions: Mac

Here's the tools we're using:

* **Python 3** - the latest and greatest version of Python
* **IPython3** - an enhanced Python shell that provides excellent features
  * beyond the normal Python shell. For example:
    * syntax highlighting
    * auto-completion
    * when you press the up arrow it lets you edit entire functions and blocks

      of code.
* **pip3 -** the Python package installer

Use `brew` to install Python 3!

```text
brew install python3
```

Use `pip`, a Python package installer, much like `npm` to `node`. `pip` stands for "Pip Installs Packages." Programmers love recursive acronyms.

Notice, there's two versions of `pip`. One installs things for Python 2 another installs things for Python 3. Use `pip3` to be explicit. If you're lucky, maybe your system uses `pip` for Python 3 by default. Let's assume we're not lucky and always use `pip3`, to be explicit.  


You can verify what version of Python `pip3` uses:

```text
pip3 --version
```

We want to use the one that says:

```text
pip 20.1.1 from /usr/local/lib/python3.9/site-packages (python 3.9)
```

Ok. let's install stuff:

```text
pip3 install ipython
```

#### Installation Instructions: Mac

* \(Bonus, if you're waiting for others to finish.\)

Type the following command in your terminal:

```text
ipython
```

You are now in a development environment! [Click here](installation.md#bonus) for more instructions.

### Installation Instructions: Linux

> **Pro tip:** The instructions are for Ubuntu. If you have another version of Linux, please follow these [suggested directions](http://docs.python-guide.org/en/latest/starting/install3/linux/).

* Open your terminal.

Either:

* Click Ubuntu icon \(upper-left corner\) to open Dash. Then, type "terminal" and select Terminal from the results.

Or:

* Hit the keyboard shortcut `Ctrl - Alt + T`.

#### Installation Instructions: Linux

* Check to see if Python 3 exists.

Some distributions of Linux come with Python 3 already installed. How nice! To check if you have Python 3 already, run the following command:

```text
python3 --version
```

If it gives you a version, you're good to go! Go ahead and skip the rest of the directions and go to the [bonus section](installation.md#bonus) instead. Otherwise, move to Step 3.

#### Installation Instructions: Linux

* Install Python 3.6.

```text
sudo apt-get update
sudo apt-get install python3.9
```

Check again for the Python 3 version.

```text
python3 --version
```

This time, things should be all good. Go ahead and jump down to the [bonus section](installation.md#bonus)!

If you are still unable to get Python 3, please alert your instructor now.

### Installation Instructions: Windows

> **Pro tip:** If you have Windows XP, you need to be downgraded from Python 3.6 to 3.4. Please ask your instructor for help if you plan on using Windows XP.

1. Download the Python installer.

Visit [python.org](https://www.python.org/downloads/release/python-365/) and download the web-based installer for Windows. You'll find this under a "Files" section at the bottom of the page.

If you have 64-bit Windows, use the link that contains `64`. If you have 32-bit Windows, download the one without `64`. If you have no idea what you have, [click here to learn how to find out](installation.md#windows-64-bit-or-32-bit).

#### Installation Instructions: Windows

1. Run the installer.
2. Make sure both `Add Python 3.9 to PATH` and `Install for all users` are checked.
3. Click `Install Now`.

#### Installation Instructions: Windows

* Disable length limit.

After the initial installation is finished, there will be an additional option that says something about a max character limit. **You want this!** Provide permission for this setting to be changed.

* Open your terminal.
  * Click _Start_.
  * Open _Windows System_ menu.
  * Select _Command Prompt_.

#### Installation Instructions: Windows

* Run the `py` command.

```text
py
```

You should get a message telling you what version of Python you're using as well as opening an in-terminal REPL. If you did, great! Skip to the next step.

If you instead received an error message like the one below, something went wrong and Python didn't install correctly.

```text
'py' is not recognized as an internal or external command,
operable program or batch file.
```

In this case, ask your instructor for assistance.

#### Installation Instructions: Windows

* \(Bonus, if you are waiting for others to finish.\)

[Click here](installation.md#bonus).

### Windows 64-Bit or 32-Bit

> **Pro tip:** These directions are for Windows 7 and Windows Vista operating systems. If you have Windows 10, you most likely have a 64-bit machine, but if you want to be extra sure, [check here](https://support.microsoft.com/en-us/help/13443/windows-which-operating-system).

1. Open "System" by clicking the "Start" button.
2. Right click "Computer."
3. Click "Properties."
4. Under "System," you can view the system type.

This will give you a bunch of stats about your machine, including whether it is 32-bit or 64-bit.

1. Return to [Installation Instructions: Windows](installation.md#installation-instructions-windows).

### Bonus

This is an optional section, in case you are waiting for others to finish.

Let's test out our in-line REPL! You can type and execute code one line at a time. Let's do a simple exercise:

> x = 10
>
> print\(x\)

Compared to using a text editor or the online [repl.it](https://repl.it/repls), how does `ipython` stack up? What do you think it's useful for?

* Play around a little bit with some mathematical operators:
  * `+`, `-`, `*`, `/`, and `**`.
* Try exiting \(`exit` command\) and restarting your in-line REPL.
  * Does it still remember `x` from before?
* Can you print strings as well?
  * Try concatenating multiple strings together.

Still waiting? Check out this video about [what you can do with Python](https://www.youtube.com/watch?v=kK_2mzBARTU)!

### Additional Resources

* [List of Differences Between Python 2 and 3](http://sebastianraschka.com/Articles/2014_python_2_3_key_diff.html)
* [Python 2 or 3?](https://wiki.python.org/moin/Python2orPython3)
* [Official OSX Installation Instructions](http://docs.python-guide.org/en/latest/starting/install3/osx/)
* [Official Windows Installation Instructions](https://docs.python.org/3/using/windows.html)
* [Windows-Specific Modules](https://docs.python.org/3/library/windows.html#mswin-specific-services)

