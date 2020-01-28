**WORK IN PROGRESS**
# Rails Template
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


SEE HERE: https://github.com/Quick-Rails-Apps/standard-app/blob/master/README.md


## Reference
* https://guides.rubyonrails.org/rails_application_templates.html
* https://apidock.com/rails/v6.0.0/Rails/Generators/AppGenerator
* https://www.rubydoc.info/github/wycats/thor/Thor/Actions
* https://guides.rubyonrails.org/generators.html
* https://github.com/rails/rails/blob/master/railties/lib/rails/generators/actions.rb
* https://github.com/rails/rails/blob/master/railties/lib/rails/generators/named_base.rb


## Contributors
* **Rose Wiegley** - *Initial work* - [Rails Template](https://github.com/rosew/rails_template)
* **Brett Adler** - Modified- [Rails Template](https://github.com/brettadler/rails_template)

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
