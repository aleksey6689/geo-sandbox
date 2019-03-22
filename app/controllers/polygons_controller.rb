class PolygonsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json do
        @polygons = Polygon.all
        render json: @polygons.as_json(only: [:id, :color], methods: [:geo_area])
      end
    end
  end

end
