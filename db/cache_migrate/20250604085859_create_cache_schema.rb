class CreateCacheSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :cache_entries do |t|
      t.string :key
      t.text :value
      t.datetime :expires_at
      t.timestamps
    end
    add_index :cache_entries, :key
    add_index :cache_entries, :expires_at
  end
end
