# Linux

### Chrome

### Installing Google Chrome on Ubuntu <a id="installing-google-chrome-on-ubuntu"></a>

Chrome is not an open-source browser, and it is not included in the standard Ubuntu repositories. Installing Chrome browser on Ubuntu is a pretty straightforward process. We’ll download the installation file from the official website and install it from the command-line.

Perform the following steps to install Chrome browser on your Ubuntu system:

#### 1. Downloading Google Chrome <a id="1-downloading-google-chrome"></a>

Open your terminal either by using the `Ctrl+Alt+T` keyboard shortcut or by clicking on the terminal icon.

Use [wget](https://linuxize.com/post/wget-command-examples/) to download the latest Google Chrome `.deb` package :

```text
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

#### 2. Installing Google Chrome <a id="2-installing-google-chrome"></a>

Installing packages on Ubuntu requires administrative privileges. Running the following command as a [user with sudo privileges](https://linuxize.com/post/how-to-create-a-sudo-user-on-ubuntu/) to install Chrome `.deb` package on your system:

```text
sudo apt install ./google-chrome-stable_current_amd64.deb
```

When prompted, enter your user password, and the installation will start.

At this point, you have Chrome installed on your Ubuntu system.

### **SLACK**

We will be using slack to communicate throughout the course. You should've received an invite to our channels via e-mail. You can login via the web browser, but downloading / installing the app is highly recommended.

[https://slack.com/downloads](https://slack.com/downloads)

### GIT

Before we do this process, please make sure you have signed up for an account on [Github](http://www.github.com). We will be installing a version of GIT from home brew and also configuring it.

To install GIT

```text
sudo apt-get install git-all
```

#### Configuring GIT <a id="configuring-git"></a>

Using your email credentials for GIT, run these commands with your user and email configured.

```text
git config --global user.name "YOUR-USERNAME"
git config --global user.email "YOUR-EMAIL-ADDRESS"
git config --global push.default simple
git config --global credential.helper cache
```

### VSCode

VSCode is the premier code editor on all platforms, you can download it from here:

[Download VSCode](https://code.visualstudio.com/download)

**WHEN you are done with this, check out the install-fest main page for a list of extensions you should install for VS Code.**

\*\*\*\*

