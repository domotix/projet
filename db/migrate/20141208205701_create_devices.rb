class CreateDevices < ActiveRecord::Migration
  def change
  	# drop_table :devices
    create_table :devices do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
