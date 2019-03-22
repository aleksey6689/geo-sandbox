namespace :geo do

  task overlap: :environment do

    pol2 = Polygon.find(2)

    # sql = <<-SQL
    #   BEGIN
    #     FOR polygon in SELECT * FROM polygons LOOP
    #       -- Run this statement whenever the trigger is called:
    #       UPDATE polygon SET polygon.area = ST_Difference(polygon.area, :area)
    #           WHERE ST_Intersects(polygon.area, :area);
    #       -- Run this after clipping to remove any polygons that were completely
    #       -- covered by the new polygon
    #       -- DELETE FROM residential WHERE ST_IsEmpty(the_geom);
    #
    #     END LOOP;
    #   END
    # SQL


    # Polygon.select('area AS "c_area"').where("ST_Intersects(c_area, ?::geometry)", pol2.area)
    # Polygon.select('area AS "c_area"').where { st_intersects(:area, Polygon.find(2).area) }
    # Polygon.select('area AS "c_area"').where('ST_Intersects(polygons.area, :area)', {area: pol2.area.to_s})
    # sql = <<-SQL
    #   --SELECT "polygons"."area" as c_area,
    #   --UPDATE polygons SET area = ST_Differene(c_area, $1)
    #   UPDATE polygons SET title = 'test'
    #     WHERE  (id != ?)
    # SQL

    # ActiveRecord::Base.connection.execute(sanitize_sql(sql, 2))
    # Polygon.where('ST_Intersects("polygons"."area", :area) AND ("polygons"."id" != :id)',  { area: pol2.area, id: pol2.id } )


  end

end