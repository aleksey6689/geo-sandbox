class Polygon < ApplicationRecord

  include GeoOverlap
  include GeometryHumanize

  geo_humanize_for :area

  has_many :addresses

end
