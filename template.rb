# https://github.com/brettadler/rails_template

# ==============================================
# Variables
# ==============================================

template_root = File.dirname path
# app_name - snake case app name
# app_const_base - App name capitalized
# destination_root - path to the app

# Set the source path to be this repo rather than railties
# def source_paths
#   [__dir__]
# end

# ==============================================
# Load Template Files
# ==============================================

load "#{template_root}/templates/append_gemfile.rb"
load "#{template_root}/templates/add_migrations.rb"
load "#{template_root}/templates/update_environment_configs.rb"

# ==============================================
# Add and Replace Files
# ==============================================

# copy files to the root directory
remove_file "README.md"
remove_file ".gitignore"
directory "#{template_root}/templates/destination_root", destination_root

# assets
remove_file "app/assets/stylesheets/application.css"
remove_file "app/assets/javascripts/application.js"
directory "#{template_root}/app/assets", "app/assets"
directory "#{template_root}/vendor/assets", "vendor/assets"

# controllers
remove_file "app/controllers/application_controller.rb"
directory "#{template_root}/app/controllers", "app/controllers"

# views
remove_file "app/views/layouts/application.html.erb"
remove_file "app/views/layouts/mailer.html.erb"
remove_file "app/views/layouts/mailer.text.erb"
directory "#{template_root}/app/views/", "app/views"

# helpers
directory "#{template_root}/app/helpers/", "app/helpers"

# heroku
directory "#{template_root}/templates/heroku/", "public"

# rake tasks
directory "#{template_root}/lib/tasks", "lib/tasks"

# config
directory "#{template_root}/config/scripts", "config/scripts"
directory "#{template_root}/config/initializers", "config/initializers"
copy_file "#{template_root}/config/discover-unused-partials.yml", "config/discover-unused-partials.yml"

# Update Environment Configs
update_environment_configs

# Append to Gemfile
append_gemfile

# Add Migrations
add_migrations

# ==============================================
# Override files
# These need to happen here or there will be conflicts
# ==============================================

# Routes - this may need to reamin at the end.
run "cp -r #{template_root}/config/routes.rb config/routes.rb"

# tests
run "cp -r #{template_root}/test/* test/"

# ================================================
# Run after bundle
# ================================================

# brew install git-flow
# git-flow init
# git https://github.com/nvie/gitflow
# git :init
# git :add => "."
# git :commit => "-a -m 'Initial project commit'"

after_bundle do

  # switch to app directory
  # run "cd #{destination_root}"

  # Create database
  # rails_command("db:create")
  # rails_command("db:migrate")

end
