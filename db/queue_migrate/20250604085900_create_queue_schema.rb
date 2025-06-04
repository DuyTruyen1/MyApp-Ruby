class CreateQueueSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :queue_jobs do |t|
      t.string :job_class
      t.text :arguments
      t.datetime :scheduled_at
      t.timestamps
    end
    add_index :queue_jobs, :scheduled_at
  end
end
