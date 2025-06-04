namespace :db do
  namespace :migrate do
    desc "Migrate cache database"
    task cache: :environment do
      ActiveRecord::Base.establish_connection(:cache)
      ActiveRecord::Migrator.migrate("db/cache_migrate/")
    end

    desc "Migrate queue database"
    task queue: :environment do
      ActiveRecord::Base.establish_connection(:queue)
      ActiveRecord::Migrator.migrate("db/queue_migrate/")
    end

    desc "Migrate cable database"
    task cable: :environment do
      ActiveRecord::Base.establish_connection(:cable)
      ActiveRecord::Migrator.migrate("db/cable_migrate/")
    end
  end
end
