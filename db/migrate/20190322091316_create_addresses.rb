class CreateAddresses < ActiveRecord::Migration[5.2]

  def change
    create_table :addresses do |t|
      t.st_point :point, null: false
      t.references :polygon, null: false, index: true
      t.timestamps
    end
    add_foreign_key :addresses, :polygons
  end

end
