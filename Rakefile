=begin
ServerApplication.application.load_tasks
=end

require_relative 'config/enviroment'

def migration_context
  ActiveRecord::Base.connection.migration_context
end

namespace :db do
  desc "Migrate the database"
  task :migrate do
    migration_context.migrate
  end
end

task :console do
  `irb -I . -r config/enviroment`
end
