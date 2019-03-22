class CreatePolygons < ActiveRecord::Migration[5.2]

  def change
    create_table :polygons do |t|
      t.multi_polygon :area
      t.string        :color,      null: false, default: "#1e2ab7"
      t.timestamps
    end
  end

end