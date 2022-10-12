#### App Setup
* Created by Leo Chen for Expeditors/Koho take home exercise
* This app uses Ruby 3.0.4 and Rails 6.1.4
* The seed.rb file will load data from CSV files
* App runs on localhost:3000
* Database uses sqlite3
```
yarn
bundle
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
bin/rails s
```

#### Notes and future improvements
Notes:
* I added a belongs_to + has_many relationship between Rates and Carriers with a foreign key
* I used the suggested money-rails gem for currency conversion
* The Carrier model and Rates model will automatically convert and save rates to the common currency (USD) with the money-rails gem functionality
* Conversion rates are stored in config/initializers/money.rb
* Data is populated through CSV ingestion with logic in the db/seeds.rb file
* Rates data is exposed via the api/rates endpoint to be consumed by the Vue app. I am using jBuilder to format the json
* The Vue app allows inline updates to each rate. There is edit & save functionality
* RSpec tests were written for the Rate and Carrier models
* I had to update a few gems (bootsnap, rexml) to get past some errors when loading the original app


Future Improvements:
* Add data validation at the database level
* More data validation at the model level
* Refactor USD conversion logic into a common module
* Add CSRF protection for API interactions (I am skipping it at the controller level to save development time)
* Add better error handling and user flow in the Vue app. Currently it does not handle errors or cancels very well
* More robust unit testing for controllers and views
* Add CSS improvements for the front end
* Standardize the format of data being passed between Vue app and Rails app
