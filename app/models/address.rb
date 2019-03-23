class Address < ApplicationRecord

  include GeometryHumanize
  geo_humanize_for :point

  belongs_to :polygon

  before_validation :determine_polygon, unless: -> (address) { address.polygon_id.present? }

  validates :point, presence: true



  def color
    polygon.color
  end

  private

  def determine_polygon
    self.polygon = Polygon.where('ST_Contains(area::geometry, ?::geometry)', self.point.to_s).first
  end

end
