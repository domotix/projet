class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :location
      t.string :description
      t.integer :ipaddress

      t.timestamps
    end
  end
end
