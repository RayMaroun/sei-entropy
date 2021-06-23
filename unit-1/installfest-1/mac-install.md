# Mac OS

List of applications to install for Mac:

* Slack
* Homebrew
* iTerm
* Oh my ZSH
* VS Code
* Git
* Chrome

### Chrome

Chrome is the preferred browser for programmers around the world, its developer tools and simplicity make it an ideal browser.

[Download Chrome](https://www.google.com/chrome/)

### **SLACK**

Slack is the primary communication tool we will be using during th duration of the course, if you haven't already installed Slack, and joined the GA workspace yet, follow this link, and check your email for an invitation 

[Download Slack](https://slack.com/downloads)

### iTerm

iTerm is a popular version of Terminal, which is the default command line interface for Mac. It is highly customizable and works well with ohmyZSH, which we will get to next.

[Download iTerm](https://www.iterm2.com/)

### Oh My ZSH

Oh my ZSH is a shell for our terminal that makes reading the command line easier. A shell is just an interface into our computer.

 We'll be using a shell and configuration package called [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh)

Visit the \[[iTerm website](https://iterm2.com/)\] for install instructions. Open iTerm and run the command listed on the site.

If it prompts you to change your default shell to zsh, select yes! When it asks you for your password, enter your computer user password \(it wont show up, but iTerm is keeping track of your keystrokes\).

Restart Terminal, and you should see a brand new and colorful command prompt.

### Homebrew

Run this first to make sure your command line tools are up-to-date.

```text
xcode-select --install
```

Homebrew is a widely used package manager used to install command line tools, we will be using this ALOT.

Visit the [homebrew website](https://brew.sh/) for install instructions.

You may be prompted to install XCode command line tools. When prompted, click and install through that, and you're homebrew installation will continue.

After the installation process, run the command `brew doctor`. If any warnings or errors are displayed, we will need to resolve them before proceeding with the rest of the install fest.

### Git

If you haven't already, please signup for a [Github ](https://github.com)account, we will be installing Git's command line structure using homebrew. Github is used for team based coding, version control, and storing code remotely.

```text
brew install git
```

#### Configuring Git

```text
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
```

### VS Code

The most accessible and popular code editor, created by Microsoft, and compatible with every OS, VS Code is an incredibly powerful program that will aid in your learning experience.

Download and install VS Code from [here](https://code.visualstudio.com/download)

We're going to set it up so we can open VS Code from the any directory in the command line.

```bash
export PATH=$PATH:"/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

Save this file and then fully restart your terminal window \(quit and restart.\) Now if you want to open VS Code from any directory in the command line we can type `code .`

**WHEN you are done with this, check out the install-fest main page for a list of extensions you should install for VS Code.**





