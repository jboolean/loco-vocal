# Loco Local Vocal Local prototype

The is a prototype of the Loco Local Vocal Local application. It demonstrates the basic functionality specififed in the requirements. As a prototype, it is not intended to be fully functional, secure, bug-free, or to run at scale.

A version of this application is deployed at localvocal.herokuapp.com

## Running in development

This is a Ruby on Rails 4 application. Questions involving the structure of the framework should be directed at the [Rails guides](http://guides.rubyonrails.org). Suffice to say the application can be setup as follows.

All commands should be run from the directory containing this README.

First, download and install all dependencies for the application. 

`bundle install`

Then, setup a clean database. For ease of setup, sqlite3 is used in development. Postgresql is used in production.

`rake db:reset`

Then, the server can be run.

`rails server`

Navigate to the server in your browser at the port it started on, usually 3000.

## Limits of this prototype

### The following features have not yet been impliemented in this prototype.
- The News feature is static content right now. The backend has not been implemented.
- Search results are rudimentary and only searches town names. Will search issues in the future.
- CSS needed on search and login pages
- Login will be moved into the navigation bar, as per the requirements.
- Search will have autocomplete.
- Location field on user account will autocomplete town names and link a town.
- Icon font is broken on production
