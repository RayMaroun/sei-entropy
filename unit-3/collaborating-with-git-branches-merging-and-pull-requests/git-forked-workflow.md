# Git Forking Workflow

  

![Git Forking Workflow](../../.gitbook/assets/image%20%2846%29.png)

### Some Notes:

* Steps 0 to 3 should only be done once.
* Steps 0, 10, and 11 should only be done by the project lead.
* The rest of the steps are done by contributors/teammates.

## Workflow Steps: 

### 0- The project lead should create a new repository and push to Github by doing the following:

* Go to the top right of Github and click on the "+" sign. Click on "New repository"

![New Repository](../../.gitbook/assets/image%20%2870%29.png)

* Write the name of the project. Make the project Public so your teammates can access it.

![Create a new repository](../../.gitbook/assets/image%20%2855%29.png)

* Follow the quick setup below depending on whether you have an existing repository or you're creating a new one.

![Quick setup](../../.gitbook/assets/image%20%2836%29.png)

### 1- Fork 

* Click the "Fork" button

![Fork button](../../.gitbook/assets/image%20%2844%29.png)

* After clicking the fork button, the following screen will show up:

![Forking screen](../../.gitbook/assets/image%20%2864%29.png)

* Once the forking is successful, you should see something like this on the top left of your screen:

![](../../.gitbook/assets/image%20%2852%29.png)

In place of "SEI-14", you should see your username. It should also tell you the project lead's username after "forked from".

### 2- Clone

![](../../.gitbook/assets/image%20%2838%29.png)

![](../../.gitbook/assets/image%20%2869%29.png)

### 3- Add upstream as a remote repository 

![](../../.gitbook/assets/image%20%2856%29.png)

![](../../.gitbook/assets/image%20%2843%29.png)

### 4- Create and checkout to a new feature branch

![](../../.gitbook/assets/image%20%2858%29.png)

### 5- Do some work on the new branch

### 6- Add your work to the staging area

![](../../.gitbook/assets/image%20%2873%29.png)

### 7- Save the staged changes via commit

![](../../.gitbook/assets/image%20%2839%29.png)

### 8- Push the new branch to origin

![](../../.gitbook/assets/image%20%2865%29.png)

### 9- Submit pull request

![](../../.gitbook/assets/image%20%2842%29.png)

![](../../.gitbook/assets/image%20%2834%29.png)

### 10- Check the pull request

### 11- If the pull request is acceptable, squash and merge

![](../../.gitbook/assets/image%20%2854%29.png)

![](../../.gitbook/assets/image%20%2847%29.png)

![](../../.gitbook/assets/image%20%2835%29.png)



### 12- Update the local master by pulling changes from Upstream master

![](../../.gitbook/assets/image%20%2872%29.png)

![](../../.gitbook/assets/image%20%2860%29.png)

### 13- Delete the feature branch that you created in step \#4

![](../../.gitbook/assets/image%20%2866%29.png)

### 14- Update origin master by pushing local master

![](../../.gitbook/assets/image%20%2863%29.png)

![](../../.gitbook/assets/image%20%2874%29.png)

### 15- Delete the feature branch from origin

![](../../.gitbook/assets/image%20%2871%29.png)

![](../../.gitbook/assets/image%20%2850%29.png)



## Resources

* [Forking Workflow by Atlassian](https://www.atlassian.com/git/tutorials/comparing-workflows/forking-workflow)

