namespace :db do
  namespace :migrate do
    desc "Migrate cache database"
    task cache: :environment do
      config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "cache")
      ActiveRecord::Base.establish_connection(config)
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end

    desc "Migrate queue database"
    task queue: :environment do
      config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "queue")
      ActiveRecord::Base.establish_connection(config)
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end

    desc "Migrate cable database"
    task cable: :environment do
      config = ActiveRecord::Base.configurations.configs_for(env_name: Rails.env, name: "cable")
      ActiveRecord::Base.establish_connection(config)
      ActiveRecord::Tasks::DatabaseTasks.migrate
    end

    namespace :test do
      desc "Prepare test database including all auxiliary databases"
      task prepare: :environment do
        # Ensure test environment
        Rails.env = "test"
        
        # Prepare main database
        Rake::Task["db:test:prepare"].invoke
        
        # Prepare auxiliary databases
        ["cache", "queue", "cable"].each do |db|
          config = ActiveRecord::Base.configurations.configs_for(env_name: "test", name: db)
          ActiveRecord::Base.establish_connection(config)
          ActiveRecord::Tasks::DatabaseTasks.create(config)
          ActiveRecord::Tasks::DatabaseTasks.migrate
        end
      end
    end
  end
end
