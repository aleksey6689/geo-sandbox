# README

Test app for checking behavior PostGIS extension pg for rails.
For resolving overlap problems for polygons just run update_overlap methods for the current polygon in rails console.

```
Example: Polygon.last.update_overlap
```

# Development Stack
___
[Ruby on Rails 5](http://rubyonrails.org/) - Ruby Framework
___
[PostgreSQL 9.5](https://www.postgresql.org/) - Most advanced open source relational database
___
[Postgis](https://postgis.net/) - Spatial and Geographic objects for PostgreSQL
___

# Install Application on Mac

Install [Brew](http://brew.sh/) and packages

```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Install [Install PG](https://www.postgresql.org/)

```
$ brew install postgresql
```

Install [Install postgis](https://postgis.net/)

```
$ brew install postgis
```



Install [RVM](https://github.com/rvm/rvm)

```
$ curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ruby
```

Install Ruby-2.6

```
$ rvm install 2.6.0
```

Create gemset for app ( where ruby-head - ruby version and "geo-sandbox" - gemset for this ruby version )

```
$ cd /<application_path>
$ rvm use ruby-head@geo-sandbox --create --default
```

Install gems for Gemfile

```
$ cd /<application_path>
$ gem install bundle
$ bundle install
```

Copy config/database_example.yml in directory config with name database.yml 

Crate db with seed data

```
$ cd /<application_path>
$ rails db:create
$ rails db:migrate
$ rails db:seed
```

Start Application

```
$ cd /<application_path>
$ rails s
```
