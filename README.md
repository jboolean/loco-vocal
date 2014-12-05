# About Loco Local Vocal Local

Local government has been behind the curve when integrating technology.  The idea of this product is to offer a place for people to stay on top of local politics, as well as find out more about topics they are passionate about.
The user can register to the system with optional demographic information that may be used anonymously in statistical analyses. Currently, only the Political Party field is used.
The system will contain Towns and Issues within each Town. Towns can be sub-localities of other Towns. For example, one might have a State and a City.
The user can register themselves to their Town as a bookmark to follow activity in that town. A user may find any Issue of intetrest in the system, read its content, and vote up or down. Basic statistics on voting behaviour by party can be viewed. 
It is the plan to allow issues to assume different formats depending on what they represent (bills, news items, candidates), but that is not in this prototype.

## Scope of Prototype

### Implemented
- Basic issues
- Voting up/down on issues
- User accounts
- Basic towns
- Inherited towns
- Joining a town
- Very rudimentary search
- Temporary, unsecured administrative functions

### Not implemented
- Good search
- Any real administrative functions
- Varying issue types
- More statistics


# Loco Local Vocal Local prototype

The is a prototype of the Loco Local Vocal Local application. It demonstrates the basic functionality specififed in the requirements. As a prototype, it is not intended to be fully functional, secure, bug-free, or to run at scale.

A version of this application is deployed at [localvocal.herokuapp.com](http://localvocal.herokuapp.com)

## Running in development

This is a Ruby on Rails 4 application. Questions involving the structure of the framework should be directed at the [Rails guides](http://guides.rubyonrails.org). Suffice to say the application can be setup as follows.

First, you must have a working version of Ruby. Ruby can be installed via your package manager on *nix, or from [rubyinstaller.org](http://rubyinstaller.org) on Windows. However, on Windows, it's recommended to install a Linux VM due to the difficulty of installing Ruby directly on Windows. 
You must also install the `bundler` gem. Run: `gem install bundler`

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
- The News feature is not implemented or needed for this prototype.
- Login will be moved into the navigation bar, as per the requirements.
- Search will have autocomplete.
- Location field on user account will autocomplete town names and link a town.
