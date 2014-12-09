class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|

# this line adds an integer column called `device_id` user_id.
      t.connections :device, index: true
      t.connections :user, index: true

      t.timestamps
    end
    add_index :connections, :device_id
    add_index :connections, :user_id
  end
end
