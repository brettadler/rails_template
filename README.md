SEE HERE: https://github.com/Quick-Rails-Apps/standard-app/blob/master/README.md

# rails_template
A template for creating a default rails app with some base configurations.

## How to Use

Create a rails app with:

```
rails new <app_name> -m rails_template/template.rb --database=postgresql
```

Create the database and run migrations

```
rails db:create
rails db:migrate
```

## Local Setup

Script - Run Setup as much as possible.


Set ENV Variables
* XXX
* XXX


## GitFlow

Create Repository on GitHub
Create via command line????

```
git init
git checkout origin master
git-flow init
git push origin develop
```

```
rails webpacker:install
```

Start the server
```
rails s
```

## Server Setup


Optional.

To make this the default Rails application template on your system, create a ~/.railsrc file with these contents:

-d postgresql
-m https://raw.githubusercon




## Reference


## Available commands and docs
* https://guides.rubyonrails.org/rails_application_templates.html
* https://apidock.com/rails/v6.0.0/Rails/Generators/AppGenerator
* https://www.rubydoc.info/github/wycats/thor/Thor/Actions
* https://guides.rubyonrails.org/generators.html
* https://github.com/rails/rails/blob/master/railties/lib/rails/generators/actions.rb
* https://github.com/rails/rails/blob/master/railties/lib/rails/generators/named_base.rb
