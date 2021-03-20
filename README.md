# README

#### R7	'Identification of the problem you are trying to solve by building this particular marketplace app.'

In Australia there is currently no dedicated marketplace for second hand board games. It is also incredibly difficult to find quality board games that you can buy directly from other people passionate about board games. Currently there is a huge risk buying games second hand, as pieces are often missing or damaged. Brand new board games are also very expensive, which deters some people from starting it as a hobby.

#### R8	'Why is it a problem that needs solving?'
This problem needs to be solved for people who enjoy playing board games. A dedicated second hand marketplace in Australia does not exist, and it would be filling a gap by allowing users to both buy and sell games with confidence. It also would allow users to search for and purchase games no longer in circulation and know that they are well looked after. It would also allow more people to start playing and enjoying board games as the price point for new games is sometimes extremely high.

#### R9	'A link (URL) to your deployed app (i.e. website)'
https://replay-marketplace.herokuapp.com/

#### R10	'A link to your GitHub repository (repo).'
https://github.com/kaprestridge/replay-marketplace

#### R11	'Description of your marketplace app (website), including:'

##### - Purpose
The purpose of the application is to connect and allow users to post board games for sale, and purchase them from other users. It will allow users to buy second hand board games with more confidence, and encourage people to start playing board games with less financial commitment.
##### - Functionality / features
User log in
User Sign up
A search function
Easy navigation on all pages
User permissions
##### - Sitemap
![img alt](app/assets/images/replay-sitemap.png 'Replay Marketplace sitemap')
##### - Screenshots
![img alt](app/assets/images/replay-landing-page.png 'Replay landing page')
![img alt](app/assets/images/replay-sign-in-page.png 'Replay log in page')
![img alt](app/assets/images/listings-page.png 'Replay listings page')
![img alt](app/assets/images/replay-item-page.png 'Replay item page')
![img alt](app/assets/images/replay-search-results-page.png 'Replay search results')


##### - Target audience
Replay's target audience is anyone who owns board games, plays board games, or wants to purchase board games. It is also for people just wanting to explore what is available and look at second-hand price points. This is a growing demographic, especially in recent years.
##### - Tech stack (e.g. html, css, deployment platform, etc)
The tech stack for Replay includes:
+ Ruby as the primary language
+ Ruby on rails framework
+ PostgreSQL database
+ Tailwind and CSS for styling
+ html and html.erb
+ Heroku deployment
+ Git version control
+ rspec testing
+ Devise user management
+ Cloudinary for image upload and storage


#### R12	'User stories for your app'
As a user I want to be able to sign up for the website
As a user I want to be able to log in and out of my user account using my credientials
As a user I want to be able to post items for sale
As a user I want to be able to edit and delete the listings, and not have others able to edit or delete my listings
As a user I want to be able to search listings
As a user I want to be able to see who posted listings
As a user I want to be able to easily navigate the site

#### R13	'Wireframes for your app'
![img alt](app/assets/images/landing-wireframe.png 'landing page wireframe')
![img alt](app/assets/images/listings-wireframes.png 'listings wireframe')
![img alt](app/assets/images/log-in-wireframe.png 'log-in wireframe')
![img alt](app/assets/images/create-listing-wireframe.png 'create listing wireframe')
![img alt](app/assets/images/help-wireframe.png 'help page wireframe')
#### R14	'An ERD for your app'
![img alt](app/assets/images/replay-erd.png 'help page wireframe')
#### R15	'Explain the different high-level components (abstractions) in your app'
 The main high level components in any rails app are Views, Controllers, Routes, Models and Databases.
 The views are everything the user sees in the browser. The user can then send requests, which pass through the controller. The controller handles these requests, communicates with the Models, and then returns information to be rendered by the views.
 Views can also render partials which stay the same and can be called on multiple pages, such as forms and navbar. This helps to keep the app DRY.
 Models are what interact with the database, they send requests and manage how the data is stored.
 Databases store data in tables and allow the app to access the stored information, and create, remove, update and delete data.



#### R16	'Detail any third party services that your app will use'
Replay marketplace will use a few third party services including:
+ Heroku- a website hosting service. It hosts the application online and can interact with github for auto-deployment. It also hosts the production DB (PostgreSQL)
+ PostgreSQL- An opensource database used by the app to store and manage user and listing data
+ Github- a version control application that allows for cloud storage of the app data and ability to track changes over time to the app. Also supports auto-deployment to heroku
+ Cloudinary- A cloud-based image hosting site. It allows for an app to interact with it to upload images, and also pull them to render on the apps views.
+ Tailwind - A service that allows for easy styling of applications.
#### R17	'Describe your projects models in terms of the relationships (active record associations) they have with each other'
The user model can have many listings attached and can have many photos through listings.
The Listing models must have one user, and can have one photo attached.
Photos must be attached to a listing.
#### R18	'Discuss the database relations to be implemented in your application'
Users to listings have a mandatory one to optional many relationship
Listings to photos have a mandatory one to optional one relationship
#### R19	'Provide your database schema design'
```ruby
ActiveRecord::Schema.define(version: 2021_03_20_035538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "price"
    t.boolean "sold"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_listings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "listings", "users"
end
```
#### R20	'Describe the way tasks are allocated and tracked in your project'
Tasks were allocated to me and tracked over the project through a Trello board. I used a number of Trello features such as cards, checklists and links to keep track of where I was in the project, how important tasks were, and what steps each task involves.
Link to trello board: https://trello.com/invite/b/dwzdBJDF/5d4d07e676ced13d267ba9b88478760e/t2a2-marketplace-app
![img alt](app/assets/images/trello.png 'Trello board')