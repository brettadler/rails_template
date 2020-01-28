def append_gemfile

append_to_file 'Gemfile' do
  <<-RUBY

# ================================================
# General Rails Gems
# ================================================

# Use HAML to generate html pages
# http://haml.info/
gem 'haml'

# ================================================
# PostgreSQL Database & Admin
# ================================================

# Builds ActiveRecord named scopes for full text search
# https://github.com/Casecommons/pg_search
# gem 'pg_search'

# Provides an easy-to-use interface for managing data
# https://github.com/sferik/rails_admin
# https://github.com/sferik/rails_admin/wiki/Fields
gem 'rails_admin'

# A performance dashboard for Postgres
# https://github.com/ankane/pghero
# https://github.com/ankane/pghero/blob/master/guides/Rails.md
# gem 'pghero'
# gem 'pg_query'

# ================================================
# jQuery
# ================================================

# Use jquery as the JavaScript library
# https://rubygems.org/gems/jquery-rails
gem 'jquery-rails'
# gem 'jquery_serialize_object_rails'
# gem 'jquery-ui-rails'
# gem 'lodash-rails'

# jQuery colorpicker
# https://github.com/kostia/jquery-minicolors-rails
# https://labs.abeautifulsite.net/jquery-minicolors/
# gem 'jquery-minicolors-rails'

# jQuery Validation plugin
# https://github.com/danryan/jquery-validation-rails
# https://jqueryvalidation.org/validate
# gem 'jquery-validation-rails'

# ================================================
# User authentication
# ================================================

# Flexible authentication solution for Rails
# https://github.com/plataformatec/devise
gem 'devise'

# Send Devise's emails in background
# https://github.com/mhfs/devise-async/
gem 'devise-async'

# Support OAuth2 login and registration
# https://github.com/omniauth/omniauth-oauth2
# gem 'omniauth-oauth2'
# gem 'omniauth-facebook'
# gem 'omniauth-google-oauth2'
# gem 'omniauth-linkedin-oauth2'
# gem 'omniauth-twitter'
# gem ‘omniauth-github’
# gem ‘omniauth-slack'

# https://github.com/gonzalo-bulnes/simple_token_authentication
gem 'simple_token_authentication'

# ================================================
# Files and Images
# ================================================

# The official AWS SDK for Ruby
# https://github.com/aws/aws-sdk-ruby
# gem 'aws-sdk'
gem 'aws-sdk-s3'
gem 'aws-sdk-rails'

# Provides drag’n’drop file uploads with image previews
# https://github.com/ncuesta/dropzonejs-rails
# http://www.dropzonejs.com/
# gem 'dropzonejs-rails'

# The Ruby cloud services library
# https://github.com/fog/fog
gem 'fog-aws'

# A ruby wrapper for ImageMagick
# https://github.com/minimagick/minimagick
# brew install imagemagick
# gem 'mini_magick

# ================================================
# Background Jobs
# ================================================

# Database based asynchronous priority queue system
# https://github.com/collectiveidea/delayed_job
gem 'delayed_job_active_record'

# Web interface for delayed job
# https://github.com/ejschmitt/delayed_job_web
gem 'delayed_job_web'

# ================================================
# Bootstrap & Styling
# ================================================

# Bootstrap 4 for Rails
# https://github.com/twbs/bootstrap-rubygem
gem 'bootstrap'

# An extended Bootstrap table(wenzhixin/bootstrap-table),
# https://github.com/bjevanchiu/bootstrap-table-rails
gem 'bootstrap-table-rails'

# A datepicker for Twitter Bootstrap
# https://github.com/Nerian/bootstrap-datepicker-rails
# gem 'bootstrap-datepicker-rails'

# Font-Awesome web fonts and stylesheets
# https://github.com/bokmann/font-awesome-rails
gem 'font-awesome-rails'

# ================================================
# Forms
# ================================================

# Automatically adjust textarea height to fit text
# https://www.rubydoc.info/gems/autosize/2.4.0.0
# gem 'autosize'

# Smart WYSIWYG HTML editor
# https://github.com/galetahub/ckeditor
# gem 'ckeditor'

# Handle nested forms
# https://github.com/nathanvda/cocoon
# gem "cocoon"

# https://github.com/stefanpenner/country_select
# gem 'country_select'

# Email validator for Rails
# https://github.com/balexand/email_validator
gem 'email_validator'

# jQuery Mask Plugin
# https://github.com/maurcarvalho/jquery_mask_rails
gem 'jquery_mask_rails'

# Rails gem for jquery.maskedinput
# https://github.com/caarlos0/maskedinput-rails
# gem 'maskedinput-rails'

# Select2 is a jQuery based replacement for select boxes
# https://select2.github.io/
# https://github.com/argerim/select2-rails
gem 'select2-rails'

# ==============================================
# Simple Form
# ==============================================

# https://github.com/plataformatec/simple_form
gem 'simple_form'

# Simple token authentication for Rails apps or API with Devise
# https://github.com/gonzalo-bulnes/simple_token_authentication
# gem 'simple_token_authentication'

# Library for validating urls in Rails
# https://github.com/perfectline/validates_url
gem 'validate_url'

# ================================================
# Charts
# ================================================

# Chart.js for use in Rails
# https://github.com/coderbydesign/chart-js-rails
# gem 'chart-js-rails'

# Create beautiful JavaScript charts with one line of Ruby
# https://github.com/ankane/chartkick
# gem 'chartkick'

# ================================================
# Security
# ================================================

# Encrypts and decrypts attributes transparently
# https://github.com/attr-encrypted/attr_encrypted
# gem 'attr_encrypted'

# Log all changes to your models
# https://github.com/collectiveidea/audited
# gem 'audited'

# Check password strength against several rules
# https://github.com/fnando/password_strength
# gem 'password_strength', '~> 1.1', '>= 1.1.4'

# https://github.com/paper-trail-gem/paper_trail
# gem 'paper_trail'

# Object oriented authorization for Rails applications
# https://github.com/elabs/pundit - Authorization
gem 'pundit'

# https://github.com/twitter/secure_headers
# gem 'secure_headers'

# ================================================
# 3rd Party API's
# ================================================

# Official ruby API library for MailChimp
# https://bitbucket.org/mailchimp/mailchimp-api-ruby
# gem 'mailchimp-api'

# Official ruby API library for Mixpanel
# https://github.com/mixpanel/mixpanel-ruby
# gem 'mixpanel-ruby'

# A slim ruby wrapper for posting to slack webhooks
# https://github.com/stevenosloan/slack-notifier
# gem 'slack-notifier'

# https://github.com/sendgrid/sendgrid-ruby
# gem 'sendgrid-ruby'

# Official ruby API library for Stripe
# https://github.com/stripe/stripe-ruby
# gem 'stripe'

# ================================================
# Utilities
# ================================================

# Abort requests that are taking too long
# https://github.com/heroku/rack-timeout
gem 'rack-timeout', '~> 0.5.1'

# State machines for Ruby classes
# https://github.com/aasm/aasm
# gem 'aasm'

# https://github.com/why-el/dragula-rails
# https://bevacqua.github.io/dragula/
# gem 'dragula-rails'

# Loan/Mortgage functions in Ruby language
# https://github.com/kolosek/finance_math
# gem 'finance_math'

# use strings instead of numeric ids in URLs
# https://github.com/norman/friendly_id
# gem 'friendly_id'

# Complete Ruby geocoding solution
# http://www.rubygeocoder.com/
# https://github.com/alexreisner/geocoder
# gem 'geocoder'

# Simple way to group temporal data
# https://github.com/ankane/groupdate
# gem 'groupdate'

# Display times and dates to users in their local time.
# https://github.com/basecamp/local_time
# gem 'local_time'

# https://github.com/derekprior/momentjs-rails
# gem 'momentjs-rails'

# Roo implements read access for all common spreadsheet types.
# https://github.com/roo-rb/roo
gem 'roo'

# Ruby module for reading and writing zip files
# https://github.com/rubyzip/rubyzip
# gem 'rubyzip'

# PDF generator for Ruby
# http://prawnpdf.org/api-docs/2.0/
# https://rubygems.org/gems/prawn
# gem 'prawn'

# https://github.com/magnusvk/counter_culture
# gem 'counter_culture'

# ==============================================
# Gems for Development
# ==============================================

group :development do

  # ================================================
  # Documentation
  # ================================================

  # Rails REST API documentation tool
  # https://github.com/Apipie/apipie-rails
  # gem 'apipie-rails'

  # Docs generator
  # https://github.com/zzak/sdoc
  # bundle exec rake doc:rails generates the API under doc/api.
  # gem 'sdoc'

  # Create RubyDoc style documentation with Yard. See https://yardoc.org/
  # gem 'yard'

  # ================================================
  # Developer Tools
  # ================================================

  # Pretty print your Ruby objects with style
  # https://github.com/awesome-print/awesome_print
  # gem 'awesome_print'

  # Guard is a command line tool to easily handle events on file system modifications.
  # https://guardgem.org and https://github.com/guard/guard
  gem 'guard'
  gem 'guard-minitest'

  # Opens a preview of an email in the browser
  # https://github.com/ryanb/letter_opener
  gem 'letter_opener'

  # Shell commands for development, staging, and production parity for Heroku apps
  # https://github.com/thoughtbot/parity
  # gem "parity"

  # A beautiful and powerful interactive command line promp
  # https://github.com/piotrmurach/tty-prompt
  # gem 'tty-prompt', '~> 0.18.1'

  # ================================================
  # Application Performance Tools
  # ================================================

  # Help kill N+1 queries and unused eager loading
  # https://github.com/flyerhzm/bullet
  gem 'bullet'

  # Benchmarks Rails apps
  # https://github.com/schneems/derailed_benchmarks
  # gem 'derailed_benchmarks'
  # gem 'stackprof'

  # ================================================
  # Bug Management Tools
  # ================================================

  # A better error page for Rails apps
  # https://github.com/charliesome/better_errors
  gem 'better_errors'
  gem "binding_of_caller"

  # ================================================
  # Linters
  # ================================================

  # A static analysis security vulnerability scanner
  # https://github.com/presidentbeef/brakeman
  gem 'brakeman'

  # Patch-level verification for Bundler
  # https://github.com/rubysec/bundler-audit
  # gem 'bundler-audit'

  # CoffeeScript linter
  # https://github.com/zmbush/coffeelint-ruby
  gem 'coffeelint'

  # Helps find  unused partials
  # https://github.com/vinibaggio/discover-unused-partials
  gem 'discover-unused-partials'

  # HAML linter
  # https://github.com/brigade/haml-lint
  gem 'haml_lint'

  # displays a list of columns that probably should be indexed
  # https://github.com/plentz/lol_dba
  gem "lol_dba"

  # Code smell detector for Ruby
  # https://github.com/troessner/reek
  gem 'reek'

  # Ruby linter
  # https://github.com/bbatsov/rubocop
  gem 'rubocop'

  # SCSS linter
  # https://github.com/brigade/scss-lint
  gem 'scss_lint', require: false

  # Searches for unused routes and unreachable action methods
  # https://github.com/amatsuda/traceroute
  gem 'traceroute'

  # ================================================
  # Other Tools
  # ================================================

  # Generates an entity-relationship diagram (ERD) for Rails models
  # # http://voormedia.github.io/rails-erd/
  # brew install graphviz
  gem "rails-erd"

  # Profiler for your development and production Ruby rack apps
  # https://github.com/MiniProfiler/rack-mini-profiler
  # gem 'rack-mini-profiler'

end

# ================================================
# Gems for Testing
# ================================================

group :test do

  # generatir fake data such as names, addresses, and phone numbers.
  # https://github.com/faker-ruby/faker
  gem 'faker'

  # Adds Minitest as the default testing library in Rails
  # http://blowmage.com/minitest-rails/
  gem "minitest-rails"

  # Exits running your test-suite as there is a test-failure
  # https://github.com/teoljungberg/minitest-fail-fast
  gem 'minitest-fail-fast'

  # focus on a few tests
  # https://github.com/seattlerb/minitest-focus
  gem 'minitest-focus'

  # https://github.com/blowmage/minitest-rails-capybara
  # gem 'minitest-rails-capybara'

  # Create customizable MiniTest output formats
  # https://github.com/kern/minitest-reporters
  gem 'minitest-reporters'

  # Mocking and stubbing library
  # https://github.com/freerange/mocha
  # gem 'mocha'

  # Simple one-liner tests for common Rails functionality
  # https://matchers.shoulda.io/
  # https://github.com/thoughtbot/shoulda-matchers
  # gem 'shoulda'
  # gem 'shoulda-matchers'

  # https://github.com/rails/rails-controller-testing
  # gem 'rails-controller-testing'

  # SimpleCov is a code coverage analysis tool for Ruby
  # https://github.com/colszowka/simplecov
  gem 'simplecov', require: false

  # https://github.com/travisjeffery/timecop
  # gem 'timecop', '~> 0.9'

  # stubbing and setting expectations on HTTP requests in Ruby.
  # https://github.com/bblimke/webmock/tree/v3.8.0
  # gem 'webmock', '~> 3.6', '>= 3.5.1'

end

# ================================================
# Gems for Development and Testing
# ================================================

group :test, :development do

  # Ruby debugger
  # https://github.com/deivid-rodriguez/byebug
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug'
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # A Ruby gem to load environment variables from `.env`.
  # https://github.com/bkeepers/dotenv
  gem 'dotenv-rails'

end

# ================================================
# Gems for Production
# ================================================

group :production do

  # manage google analytics tracking
  # https://github.com/bgarret/google-analytics-rails
  gem 'google-analytics-rails'

  # Official ruby API library for Informant
  # https://elements.heroku.com/addons/informant
  gem "informant-rails"

  # An attempt to tame Rails' default policy to log everything
  # https://github.com/roidrage/lograge
  gem "lograge"

  # Official ruby API library for New Relic
  # New Relic app monitoring
  gem 'newrelic_rpm'

  # Official ruby API library for Rollbar
  # https://rollbar.com/docs/notifier/rollbar-gem/
  # https://github.com/rollbar/rollbar-gem
  gem 'rollbar'
  gem 'oj'

  # # Official ruby API library for Scout
  # https://apm.scoutapp.com/apps/new?lang=ruby
  gem 'scout_apm'

  # Official ruby API library for Sentry
  # https://github.com/getsentry/raven-ruby
  # https://docs.sentry.io/clients/ruby/integrations/rails/
  gem "sentry-raven"

end

# ================================================
# Other possible gems
# ================================================

# https://github.com/rails/activerecord-session_store
# gem 'activerecord-session_store'

# https://github.com/brianhempel/active_record_union
# gem 'active_record_union'

# https://github.com/amatsuda/kaminari
# gem 'kaminari'

# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

RUBY
end

# run generate for gems
generate "simple_form:install --bootstrap"
generate "devise:install"
generate "devise User"
generate "delayed_job:active_record"

end
