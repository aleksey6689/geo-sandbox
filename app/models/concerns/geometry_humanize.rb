module GeometryHumanize

  extend ActiveSupport::Concern

  included do

    def self.geo_humanize_for(filed)
      define_method "geo_#{filed}" do
        factory = RGeo::GeoJSON::EntityFactory.instance
        feature = factory.feature self.send(filed)
        RGeo::GeoJSON.encode(feature)
      end
    end

  end

end