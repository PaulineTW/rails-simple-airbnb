class FlatsController < ApplicationController
  before_action :find_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.where.not(latitude: nil, longitude: nil)
        # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window: render_to_string(partial: "info_window", locals: { flat: flat }),
        image_url: helpers.asset_url("flat_1.jpg")
      }
    end
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(params[:flat])
  end

  def destroy
    @flat.destroy
    redirect_to flats_path
  end

    private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

  def find_flat
    @flat = Flat.find(params[:id])
  end

end
