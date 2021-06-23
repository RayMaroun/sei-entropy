[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)


# Hospital App

Your homework for today is to practice! You're gonna create an app with one model `Patient`.

- Walk back through all the lessons so far. Create a new Rails app called `hospital-app`. Instead of `Todo` you'll create an `Patient` model. 

- You'll need to add your own  data for the Patients using a Seed file.

- Use what've learned in the class along with looking things up though the [Rails Guides](https://guides.rubyonrails.org/) and the [Rails API Docs](https://api.rubyonrails.org/) to help you complete the app.

- Complete all the user stories mentioned below.

### User Stories

- Version 1
  - As a user, I want to view a single patient
  - As a user, I want to view all patients
  - As a user, I want to create a patient with a first name, last name,
    diagnosis and born on
  - As a user, I want to edit a patient's first name, last name, diagnosis and
    born on
  - As a user, I want to delete a patient

### Entity Relationship Diagrams

#### Version 1

<table>
  <th colspan="2" style="text-align:center">Patients</th>
  <tr>
    <td>id</td>
    <td>primary key</td>
  </tr>
  <tr>
    <td>first_name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>last_name</td>
    <td>string</td>
  </tr>
  <tr>
    <td>diagnosis</td>
    <td>string</td>
  </tr>
  <tr>
    <td>born_on</td>
    <td>date</td>
  </tr>
  <tr>
    <td>created_at</td>
    <td>datetime</td>
  </tr>
  <tr>
    <td>updated_at</td>
    <td>datetime</td>
  </tr>
</table>

**Follow the same Error Driven Development steps as you did with todos!**

### CRUD for Patient

#### Read - index

- `PatientsController#index`

#### Read - show

- `PatientsController#show`

#### Destroy

- `PatientsController#destroy`

#### Update

- `PatientsController#update`

#### Create

- `PatientsController#create`

