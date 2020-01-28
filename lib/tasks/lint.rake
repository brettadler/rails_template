# rake tasks to make it easy to run linters

namespace :lint do

  # ===================================================
  # Front End
  # ===================================================

  # rake lint:scss
  desc 'Execute scss-lint'
  task scss: :environment do
    puts "Running scss-lint ========================================================"
    puts `scss-lint . --config .scss-lint.yml`
  end

  # rake lint:coffee
  desc 'Execute coffee-lint'
  task coffee: :environment do
    puts "Running coffee-lint ========================================================"
    puts `coffeelint.rb -f .coffeelint.json -r app/assets/javascripts`
  end

  # rake lint:haml
  desc 'Execute haml-lint'
  task haml: :environment do
    puts "Running HAML-LINT ========================================================"
    puts `haml-lint . --config .haml-lint.yml --color`
  end

  # rake lint:front
  desc 'Run front-end lints'
  task front: :environment do
    puts "Running front-end lints ========================================================"
    %w[scss coffee haml].each { |task| Rake::Task["lint:#{task}"].invoke }
  end

  # ===================================================
  # Back End
  # ===================================================

  # rake lint:ruby
  desc 'Execute rubocop'
  task ruby: :environment do
    puts "Running rubocop ========================================================"
    puts `rubocop -R --config .rubocop.yml`
  end

  # rake lint:reek
  desc 'Execute reek'
  task reek: :environment do
    puts "Running Reek ========================================================"
    puts `reek . --config .config.reek`
  end

  # rake lint:brakeman
  desc 'Execute brakeman'
  task brakeman: :environment do
    puts "Running brakeman ========================================================"
    puts `brakeman -q -i brakeman.ignore`
  end

  # rake lint:unused
  desc 'Execute discover-unused-partials'
  task unused: :environment do
    puts "Running discover-unused-partials ========================================================"
    puts `discover-unused-partials`
  end

  # rake lint:routes
  desc 'Execute traceroute'
  task routes: :environment do
    puts "Running traceroute ========================================================"
    puts `rake traceroute`
  end

  # rake lint:bundler
  # desc 'Execute bundle audit'
  # task bundler: :environment do
  #   puts "Running bundle audit ========================================================"
  #   puts `bundle audit check --update`
  # end

  # rake lint:indexes
  desc 'Execute lol_dba'
  task indexes: :environment do
    puts "Running lol_dba ========================================================"
    puts `rake db:find_indexes`
  end

  # rake lint:back
  desc 'Run back-end lints'
  task back: :environment do
    puts "Running back-end lints ========================================================"
    %w[ruby reek unused routes bundler indexes brakeman].each { |task| Rake::Task["lint:#{task}"].invoke }
  end

end

# rake lint
task :lint do
  %w[front back].each { |task| Rake::Task["lint:#{task}"].invoke }
end
