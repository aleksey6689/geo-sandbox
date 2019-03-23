module GeoOverlap

  extend ActiveSupport::Concern

  included do

    def update_overlap
      overlap_polygons = Polygon.where.not({ id: self.id }).where('ST_Overlaps(area::geometry, ?::geometry)', self.area.to_s)

      return unless overlap_polygons.exists?

      # update polygons
      sql = <<-SQL
        UPDATE polygons SET area = ST_Multi(ST_Difference(area::geometry, ?::geometry)) WHERE ( id IN (?) )
      SQL

      ActiveRecord::Base.connection.execute(self.class.sanitize_sql( [sql, self.area.to_s, overlap_polygons.pluck(:id) ]))

      # update addresses
      overlap_polygons.each do |overlap_polygon|
        overlap_addresses = overlap_polygon.addresses.where('ST_Contains(?::geometry, point::geometry)', self.area.to_s)
        overlap_addresses.update_all(polygon_id: self.id)
      end

    end

  end

end

