# Create diagrams using rails-erd

namespace :diagram do

  # rake diagram:all
  desc "diagram all models"
  task all: :environment do
    puts "Creating a diagram of all models ========================================================"
    puts `rake erd filename="db/diagrams/All Entity Relationship Diagram" title="All Entity-Relationships"`
  end

  # rake diagram:overview
  desc "diagram an overview of the system"
  task overview: :environment do
    puts "Creating a system overview diagram ========================================================"
    puts `rake erd filename="db/diagrams/Overview Entity Relationship Diagram" title="Overview of Entity-Relationships" only="User"`
  end

  # rake diagram:model[User]
  desc "diagram one model"
  task :model, [:model_name] => :environment do |_task, args|
    puts "Creating a diagram for one model ========================================================"
    puts `rake erd filename="db/diagrams/#{args.model_name} Model Entity Relationship Diagram" title="#{args.model_name} Model Entity-Relationships" only="#{args.model_name}" `
  end

end

# rake diagram
task :diagram do
  %w[all overview].each { |task| Rake::Task["diagram:#{task}"].invoke }
end
