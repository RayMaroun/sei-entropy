# Shops!

Create a class Shop that can help shop owners keep track of their products!

Our class should have multiple functionality:

- initialize your shop with a random ID.
---
- **add_product**
    should take the name, price and stock of your product. Stock should be optional otherwise it counts as 1.


---

- **sale**
    should print out new prices for all your products based on the percentage you pass 
    ```ruby
    sale(50) #applies a 50% sale
    ```

---
- **stock**
    show the stock of your products
---
- **purchase**
    should take the name and amount of the purchased item. Then subtracts the amount of items you purchase from your stock, if your stock is empty, it gives a warning.
---
- **show_products**
    Displays all products information!


## Bonus

- **remove_product**
    takes a product name and removes that product from your shop list

----
```ruby
    shop = Shop.new("Supermarket")
    shop.add_product("Apples", 10, 5)
    shop.add_product("Bananas", 6, 2)
    shop.add_product("Apples", 10)
    
    shop.show_products 
    # Our Products:
    # -------
    # Name: Apples
    # Price: 10
    # Stock: 6.
    # -------
    # Name: Bananas
    # Price: 6
    # Stock: 2.
    
    shop.sale(50)
    # Hooray! We have a 50% sale!
    # Apples is now 5
    # Bananas is now 3


    shop.purchase("Bananas")
    # Bananas purchased!
    # New stock is now 1

    shop.stock("Bananas")
    # Bananas has 1 in stock

    shop.remove_product("Bananas")
    
    shop.show_products
    # Our Products:
    # -------
    # Name: Apples
    # Price: 5
    # Stock: 6.
    # -------
```