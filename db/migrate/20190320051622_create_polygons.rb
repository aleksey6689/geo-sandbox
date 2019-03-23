class CreatePolygons < ActiveRecord::Migration[5.2]

  def change
    create_table :polygons do |t|
      t.multi_polygon :area,       null: false
      t.string        :color,      null: false, default: "#1e2ab7"
      t.timestamps
    end
  end

end