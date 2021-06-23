# W04D03 - Shop Class



## Shops!

#### Create a class Shop that can help shop owners keep track of their products!

#### Our class should have multiple functionality:

#### Initialize your shop with a name and random ID.

#### Here is the list of functions your class should be able to perform.

#### There is a list of examples at the bottom, of proper outputs and how to call the functions.

1. **addProduct** should take the name, price and stock of your product. Stock should be optional otherwise it counts as 1.
2. **sale** should print out new prices for all your products based on the percentage you pass

   ```javascript
    sale(50) #applies a 50% sale
   ```

3. **stock** show the stock of your products
4. **purchase** should take the name and amount of the purchased item. Then subtracts the amount of items you purchase from your stock, if your stock is empty, it gives a warning.
5. **showProducts** Displays all products information!

### Bonus

1. **removeProduct**

    takes a product name and removes that product from your shop list

```javascript
    shop = new Shop("Supermarket")
    shop.addProduct("Apples", 10, 5)
    shop.addProduct("Bananas", 6, 2)
    shop.addProduct("Apples", 10)

    shop.showProducts() 
    # Our Products:
    # -------
    # Name: Apples, Price: 10, Stock: 6
    # Name: Bananas, Price: 6, Stock: 2


    shop.sale(50)
    # Hooray! We have a 50% sale!
    # Apples is now 5
    # Bananas is now 3


    shop.purchase("Bananas")
    # Bananas purchased! ,  New stock is now 1

    shop.stock("Bananas")
    # Bananas has 1 in stock

    shop.removeProduct("Bananas")
    # Bananas has been removed from the products

    shop.showProducts()
    # Our Products:
    # -------
    # Name: Apples, Price: 10, Stock: 6
```

