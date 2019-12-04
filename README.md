# README

U-M Library IT Cycle Planning Tool

For contribution to code development:

1. Fork and Clone the repo
2. bundle install --path=.bundle
3. Setup Postgres
  a. service postgresql start
  b. createuser -P -d tracc (Enter a password, and use the same password in the next step)
  c. echo 'export tracc_DATABASE_PASSWORD="PostgreSQL_Role_Password"' >> ~/.bash_profile
  d. source ~/.bash_profile
4. Create the db: bundle exec rails db:create
5. Run the migrations: bundle exec rails db:migrate
6. bundle exec solr_wrapper
7. Seed the data: bundle exec rake db:seed
8. Run the application: bundle exec rails s 


Once the app is running in the browser(localhost:3000/), upload a csv file from Qualtrics with the cards info to get the sample data.
