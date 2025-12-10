# My name is Thinh, I'm a software engineer intern
# I would like to share my knowdledge 

# 1. Introduction
- Rails is Server Side Redering
- Rails is a web framework built for the Ruby programming language.

# 2. Rails Philosophy
- Dry(Don't repeat Yourself): to ensure every logic, only write only one time
- Convention Over Configuration: use some available standard instead of config everything

# 3. Creating a New Rails App
- Install: https://guides.rubyonrails.org/install_ruby_on_rails.html

- Check version: rails --version

- To create our store application
rails new store 

*** Directory Structure
- /app : contains the models, controllers, views, helpers, mailers, jobs, assets
- /bin : contains script to set up, update, deploy, or run your app
- /config : contains routes, db, more
- config.ru : when type "rails server", this file to run rails server
- /db : contains database schema, database migrations
- Dockerfile: configurtion file for Docker.
- Gemfile: Dependencies for rails
- /lib : extended modules
- /log : log files
- /public : static files and compiled assets
- Rakefile : search and install all tasks
- /script : Contains one-off or general purpose scripts 
- /storage : contains SQLite databases and Active Storage files
- /test: 	Unit tests, fixtures, and other test apparatus. These are covered in Testing Rails Applications.

- /tmp : Temporary files
- /vendor : vendored gems

*** Model-View-Controller
- Model: manage the data
- View : Handles redering responses in different formats like HTML, Json, XML, ...
- Controller: Handles user interactions and the logic for each request

# 4. Hello, Rails!
- create database: bin/rails db:create
- install dependencies: bundle install
- run server: bin/rails server
- Rails auto reload

# 5. Create database model
-  bin/rails generate model Product name:string
- Database Migrations: change database to add, change, or remove tables, columns or other attributes of our database
- bin/rails db:migrate


# 6. Rails console
- bin/rails console

# 7. Active Record Model Basics
- **** Active Record interacting with database table
- Model don't have any code, because it will query database table for the column names and types

*** Create records:
- product = Product.new(name: "T-shirt")
- save into db: product.save
- create and save: Product.create(name: "Pants")

*** Querying Records
Product.all
Product.where(name: "Pants")
Product.order(name: :asc)
Product.find(1)

product = Product.find(1)
product.update(name: "Shoes") // save

product = Product.find(1)
product.name = "T-shirt"
product.save // save 

product.destroy

*** Validations
- validates :name, presence: true
- in rails console, i have to update 
- reload!

- product = Product.new
-  product.save
=> false

- product.errors.full_messages
 => ["Name can't be blank"] 

# 8. Routes 
- a route is the part of the URL that determines how an incoming HTTP request directed to the appropriate controller and action for processing

- https://example.org/products?sale=true&sort=asc

- In this URL, each part has a name:

https is the protocol
example.org is the host
/products is the path
?sale=true&sort=asc are the query parameters

*** Http Methods
- Get/ Post / Put/ Patch/ Delete
+ Index - Shows all the records
+ New - Renders a form for creating a new record
+ Create - Processes the new form submission, handling errors and creating the record
+ Show - Renders a specific record for viewing
+ Edit - Renders a form for updating a specific record
+ Update (full) - Handles the edit form submission, handling errors and updating the entire record, and typically triggered by a PUT request.
+ Update (partial) - Handles the edit form submission, handling errors and updating specific attributes of the record, and typically triggered by a PATCH request.
+ Destroy - Handles deleting a specific record

- shortcut CRUD: resources :products

- To display routes: bin/rails routes

# 9. Controllers & Actions

- bin/rails generate controller Products index --skip-routes

- Even though it's an empty method, Rails will default to redering a template with the matching name.

- For an example: index action render app/views/products/index.html.erb

- root "products#index" to direct index of product 

- "params" use for query in database

- These route prefixes : 
+ products_path generates "/products"
+ products_url generates "http://localhost:3000/products"
+ product_path(1) generates "/products/1"
+ product_url(1) generates "http://localhost:3000/products/1"

- filename starts: _ to denote this is a parital

# 10. Authentication
- To for someone who login into the app
- bin/rails generate authentication
- It create User and Session (MVC) to login
- bin/rails db:migrate

- caching data to improve efficiency: bin/rails dev:cache

# 11. Rich text Fields with Action Text 
- bin/rails action_text:install
- bundle install
- bin/rails db:migrate

# 12. File uploads with Active Storage
- Rails makes it easy to translate your app into other languages.
- config/locales/en.yml ...

# 13. Action Mailer and Email Notifications

- bin/rails generate migration AddInventoryCountToProducts inventory_count:integer

- bin/rails generate model Subscriber product:belongs_to email

- bin/rails g mailer Product in_stock

- Single Page Application is load entire the page at one time, then only reuse that page to install dynamic data.

# 14. Testing
- Fixtures
- When you generate a model using Rails, it automatically creates a corresponding fixture file in the test/fixtures directory.

- test/fixtures/products.yml 

- bin/rails test

# 15. Consistently Formatted Code with RuboCop

- bin/rubocop
- automatic fix offenses using the --autocorrect flag: bin/rubocop -a

# 16. Security
- vulnerabilities that can lead to attacks such as session hijacking, session fixation, or redirection.

- bin/brakeman

# 17. Continuous Integration with GitHub Actions
- Rails apps generate a .github folder that includes a prewritten GitHub Actions configuration that runs rubocop, brakeman, and our test suite.

- When we push our code to a GitHub repository with GitHub Actions enabled, it will automatically run these steps and report back success or failure for each. This allows us to monitor our code changes for defects and issues and ensure consistent quality for our work.

# 18. Deploying to Production
- deploy.yml
- export KAMAL_REGISTRY_PASSWORD=your-access-token

- bin/kamal setup

- bin/kamal deploy

- Adding user to production:

bin/kamal console

User.create!(email_address: "you@example.org", password: "s3cr3t", password_confirmation: "s3cr3t")

# 19. Background Jobs using Solid Queue
- Background jobs allow you to run tasks asynchronously behind-the-scenes in a separate process, preventing them from interrupting the user experience

# Adding Sign Up
- bin/rails g migration AddNamesToUsers first_name:string last_name:string
