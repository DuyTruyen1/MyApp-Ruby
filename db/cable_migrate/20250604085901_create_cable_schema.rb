class CreateCableSchema < ActiveRecord::Migration[8.0]
  def change
    create_table :cable_subscriptions do |t|
      t.string :channel
      t.string :connection_identifier
      t.timestamps
    end
    add_index :cable_subscriptions, [ :channel, :connection_identifier ]
  end
end
