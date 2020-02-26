README
===

Play with the sample services hosted in my dev box here:
---
* http://registration.xibcc.com/ for API documentation
* http://registration.xibcc.com/rspec for rspec test results
* http://registration.xibcc.com/console/emails is a developer's backdoor to data

Setup Your Dev Environment
---
* Install rvm and ruby 2.2.3 *(I tailored the app to this version so that I can have swagger in the api doc)*:  
Click https://rvm.io/rvm/install to install rvm, then run `rvm install 2.2.3`  
* Install mysql database or any database of your choice:  
* Start up your database server after successfully installing database and client on your system
* Create a database and its user to be used by the application, here is how I do it in mysql:  
`create database db1 DEFAULT CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci';`  
`grant all privileges on db1.* to user1@"%" identified by 'password';`  
`flush privileges;`  
* Checkout a copy of the source code and install proper gems(libs):  
`git clone git@github.com:mplstar/simply_core.git`  
`cd simply_core`  
`bundle install`  
* Edit the following files that has hardcoded *registration* in it, change it to the actual host and database you are using:  
*app/mailers/account_mailer.rb* (line 2)  
*app/views/account_mailer/registration_email.html.haml* (line 12)  
*config/environments/development.rb* (line 20 .. 30, can fake it if this module is fully tested)  
*spec/spec_helper.rb*  (line 57)  
*config/database.yml* (line 6 to 14 and line 25 to 26)  
* Run the following commands to install database tables:  
`rake db:setup`  
`rake db:migrate` 
* Setup and run rspec tests:  
`rake db:test:prepare`  
`rspec spec` 

Start Up Services in Your Dev Environment
---
* Fire up the dev application server: 
`unicorn -D`  
* Start the delayed job message queue server with workers: 
`rake jobs:work`
* Point your browser to http://yourhost.yourdomain.com and enjoy   
