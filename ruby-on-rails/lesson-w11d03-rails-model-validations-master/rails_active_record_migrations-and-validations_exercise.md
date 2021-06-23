# Rails Active Record Migrations + Validations Exercise

We just learned about Rails Model migrations and validations. Let's get some more practice on what we covered by adding onto the app we just built during the lesson. You can follow along with the lesson plan to complete the steps below.
 
1.  Create a `Car` resource that has `make`, `model`, `year`, `moonroof`, `dealership` fields. Remember to designate the correct data type for each!

2. Run the command that will update our `schema.rb` and add the new model to our database.

3. Oops, we forgot to add a `color` field to `Car`. Go ahead and generate a migration to add that field to our schema.

4. We really don't care where we bought our vehicle so let's remove the `dealership` field from our schema.

5. Add validations to require that all of our fields are present in order for a record to be persisted to the database. 

6. Add a validation that `year` contains 4 digits and provide an error message if the year is too short.

7. Generate a migration that will rename the `moonroof` field to `sunroof`.

8. Enter `rails console` and add 4 cars to your database.

9. Update the color of the first `Car` in your database.

10. Delete the 3rd `Car` in your database.

### BONUS

Set up a relationship between `Person` and `Car` where a car `belongs_to` a person and a Person `has_many` cars. What steps are required?
