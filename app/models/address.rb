class Address < ApplicationRecord

  include GeometryHumanize
  geo_humanize_for :point

  belongs_to :polygon

  def color
    polygon.color
  end

end
