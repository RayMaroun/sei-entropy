# Rails Model Validations

## Objectives

By the end of this lesson you should be able to...

- Know, what is validation and why we need it
- Add validations to our models

## Introduction

Active Record allows you to validate the state of a model before it gets written
into the database. There are several methods that you can use to check your
models and validate that an attribute value is not empty, is unique and not
already in the database, follows a specific format and many more.

Validation is a very important issue to consider when persisting to database, so
the methods `create`, `save` and `update` take it into account when
running: they return `false` when validation fails and they didn't actually
perform any operation on database. All of these have a bang counterpart (that
is, `create!`, `save!` and `update!`), which are stricter in that
they raise the exception `ActiveRecord::RecordInvalid` if validation fails.

Let's look at how we might validate some things.

-   **Empty Values**

      To prevent empty values we'll use `validates <property>, presence: true`.
      This is a slightly more restrictive check than `null: false`;
       it disallows both empty values (`nil` in Ruby, `NULL` in the database),
       and it also disallows empty strings (for string properties).

      **EXAMPLE :**
      To set an empty-value validator in our Country model, you might write

      ```ruby
      class Country < ActiveRecord::Base
        has_many :citizenships
        has_many :people, through: :citizenships

        validates :name, presence: true
      end
      ```

-   **Uniqueness**

      To ensure that a property is unique,
       we'll use `validates <property>, uniqueness: true`.

      **EXAMPLE :**
      To set some uniqueness validators in my Person model, you might write

      ```ruby
      class Person < ActiveRecord::Base
        has_many :citizenships
        has_many :countries, through: :citizenships

        validates :phone_number, uniqueness: true
      end
      ```

-   **References**

      For referential integrity checks,
       we'll use `validates <model>, presence: true`,
       where `<model>` is the symbol we passed to `belongs_to`.

      **EXAMPLE :**
      You want to test that a Citizenship instance refers to
       an instance of Country and an instance of Person;
       in that case, you might write the following:

      ```ruby
      class Citizenship < ActiveRecord::Base
        belongs_to :country
        belongs_to :person

        validates :country, presence: true
        validates :person, presence: true
      end
      ```

`ActiveRecord::Base` comes with a slew of other validators we can use, as well as the mechanisms to create our own custom validators.


A quick example to illustrate:

```ruby
class Person < ActiveRecord::Base
  validates :first_name, presence: true
end

person = Person.new(last_name: "Bashir")
person.valid?  # => checks validations and returns a boolean
person.save    # => rollback db
person.save!   # => specifies failure

person.first_name = "Usman"
person.valid?
person.save
```

You can learn more about validations in the [Active Record Validations
guide](http://guides.rubyonrails.org/active_record_validations.html).

#### Validate Person Model

We set our [validations](http://guides.rubyonrails.org/active_record_validations.html) in our app/models/person.rb model.

Let's make sure each person definitely has a first name and a last name before they're saved.

```ruby
class Person < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
end
```

* Type `reload!` into the console to update your model validations.
* Try saving a person with no first or last name and see what error is thrown.
* Try calling `valid?` on a new person.
* Walk through the Rails Docs and show that you can add error messages to your validations (e.g.- `too_short: "must have at least %{count} words"`).

**WE DO:**

Add the following validation to `person.rb`:

```ruby
validates :hometown, :first_name, :last_name, length: { minimum: 3, too_short: "must have at least %{count} words" }
```

or add `numericality` to the age field:

```ruby
validates :age, numericality: true
```

**YOU DO:**

- Create a new `Person` table column named `age` and add a validation. 
- Attempt to create a new `Person` and make it fail. 
- Make the new `Person` pass.


<br>

## Migrations/Validations Exercise

[Can be found here](rails_active_record_migrations-and-validations_exercise.md)

## Further Reading

* [Active Record Overview - Rails Guides](http://guides.rubyonrails.org/active_record_basics.html)
* [Active Record Migrations - Rails Guides](http://edgeguides.rubyonrails.org/active_record_migrations.html)
* [Active Record Associations - Rails Guides](http://guides.rubyonrails.org/association_basics.html)
* [Active Record Validations - Rails Guides](http://guides.rubyonrails.org/active_record_validations.html)
