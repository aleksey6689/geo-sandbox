class AddressesController < ApplicationController

  def index
    respond_to do |format|
      format.json do
        @addresses = Address.all
        render json: @addresses.as_json(only: [:id], methods: [:geo_point, :color])
      end
    end
  end

end
