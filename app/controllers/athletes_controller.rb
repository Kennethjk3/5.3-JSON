class AthletesController < ApplicationController

  def index
    @athletes = athlete.all
  end

  def show
    @athlete = athlete.find(params[:id])
  end

  def new
    @athlete = athlete.new
  end

  def create
    @athlete = athlete.new(athlete_parms)
    if @athlete.save
      puts "Saved"
    else
      puts "Try again"
    end
    redirect_to action: :index
  end

  def edit
    @athlete = athlete.find(params[:id])
  end

  def update
    @athlete = athlete.find(params[:id])
    @athlete.update_attributes(athlete_params)
    redirect_to action: :index
  end

  def destroy
    @athlete = athlete.find(params[:id])
    @athlete.destroy
    redirect_to action: :index
  end

  private

  def athlete_params
    params.require(:athlete).permit(:url, :title, :comment, :favorite)
  end

end
