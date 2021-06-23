---
description: we will do this lab one time using DOM and one time using jQuery a
---

# Lab: CRUD Operations

## Steps:

1- Create a folder call it **01\_DOM-Lab** \(if you are using DOM\) \|\| **02\_jQuery-Lab** \(if you are using jQuery\).

2- Create a **style.css** file.

3- Create a **main.js** file and **put this code inside it.**

```javascript
console.log('DOM || jQuery LAB');

// ==== WRITE THE CODE FOR [Q1] UNDER THIS LINE ====

// ==== WRITE THE CODE FOR [Q2] UNDER THIS LINE ====

// ==== WRITE THE CODE FOR [Q3] UNDER THIS LINE ====

// ==== WRITE THE CODE FOR [Q4] UNDER THIS LINE ====

// ==== WRITE THE CODE FOR [Q5] UNDER THIS LINE ====

```

4- Create an **index.html** file and **put this code inside it.**

```markup
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DOM LAB</title>
  <link rel="stylesheet" href="style.css">
</head>

<body>
  <h1>DOM LAB</h1>

  <!-- Q1 -->
  <h2>Q1</h2>

  <p id="p_color">change the COLOR && BACKGROUND COLOR of THIS paragraph</p>

  <span>Change the COLOR to:</span>
  <button id='red_color'>RED</button>
  <button id='blue_color'>BLUE</button>

  <span>Change BACKGROUND COLOR to:</span>
  <button id='green_bg_color'>GREEN</button>
  <button id='yellow_bg_color'>YELLOW</button>

  <hr>
  <hr>


  <!-- Q2 -->
  <h2>Q2</h2>

  <p id="p_size">change the SIZE of THIS paragraph</p>

  <span>Change the SIZE to:</span>
  <button id='size_10px'>10 px</button>
  <button id='size_20px'>20 px</button>
  <button id='size_30px'>30 px</button>
  <button id='size_40px'>40 px</button>

  <hr>
  <hr>


  <!-- Q3 -->
  <h2>Q3</h2>

  <p id="p_text">change the TEXT of THIS paragraph</p>
  <input type="text" id="new_p_text" placeholder="write new p text ...">
  <button id='change_p_text'>Change P TEXT</button>

  <hr>
  <hr>


  <!-- Q4 -->
  <h2>Q4</h2>

  <input id="new_img_link" type="text" placeholder="write new img link ...">
  <button id='change_img_link'>Change IMG link</button>
  <br>

  <span>Change the image WIDTH to:</span>
  <button id='width_200px'>200 px</button>
  <button id='width_400px'>400 px</button>
  <br>

  <span>Change the image HEIGHT to:</span>
  <button id='height_200px'>200 px</button>
  <button id='height_400px'>400 px</button>
  <br>

  <img id='photo' src="http://www.placekitten.com/300/300">

  <hr>
  <hr>


  <!-- Q5 -->
  <h2>Q5</h2>
  <input id="new_item_title" type="text" placeholder="write new item title ...">

  <button id='add_new_item'>Add NEW list-item</button>

  <button id='delete_last_item'>Delete LAST list-item</button>

  <ol id='list'>
    <!-- <li class='list-item'>title</li> -->
  </ol>

  <hr>
  <hr>

  <script src="main.js"></script>
</body>

</html>
```



5- You should be able to:

1. Change **the color** and **the background color** of a **`p`** tag using **`buttons`**.
2. Change  **the size** of a **`p`** tag using **`buttons`**.
3. Change  **the text** of a **`p`** tag using **`input`**and **`button`**.
4. Change  **the src** of an **`img`**tag using **`input`**and **`button`** && Change **the width** and **the height** of an **`img`** using **`buttons`**.
5. Add a new **`li`**tag with **specific text** **the text** using **`input`**and **`button`** && **Delete** the last**`li`**tag using **`button`**.

## Your result should be something like this:

![Result](../../.gitbook/assets/todo%20%282%29%20%281%29.gif)

