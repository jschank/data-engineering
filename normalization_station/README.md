README
======

Normalization Station is a rails app for uploading a tab separated data file, and importing it into a database. The requirements are:

Project Description
-------------------

Imagine that LivingSocial has just acquired a new company. Unfortunately, the company has never stored their data in a database and instead uses a plain text file. We need to create a way for the new subsidiary to import their data into a database. Your task is to create a web interface that accepts file uploads, normalizes the data, and then stores it in a relational database.

Here's what your web-based application must do:

Your app must accept (via a form) a tab delimited file with the following columns: purchaser name, item description, item price, purchase count, merchant address, and merchant name. You can assume the columns will always be in that order, that there will always be data in each column, and that there will always be a header line. An example input file named example_input.tab is included in this repo.
Your app must parse the given file, normalize the data, and store the information in a relational database.
After upload, your application should display the total amount gross revenue represented by the uploaded file.
Your application does not need to:

handle authentication or authorization (bonus points if it does, extra bonus points if authentication is via OpenID)
be written with any particular language or framework
be aesthetically pleasing
Your application should be easy to set up and should run on either Linux or Mac OS X. It should not require any for-pay software.

Details
-------

* Ruby Version: This app is using ruby-2.1.0, and uses RVM, with a project defined ruby-version and ruby-gemset, these should be compatible with rbenv as well.

* System: It has been tested on Mac OS X 10.9.2

* Configuration: use `bundle install` to retrieve and install all gems.

* Database creation: use `rake db:setup` to create the intial database

* How to run the test suite: use `rake test` to run tests. Or simply `rake` because the tests are the default rake task

* Deployment instructions: deploy as you would any rails app
