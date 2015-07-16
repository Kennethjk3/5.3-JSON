class AthletesController < ApplicationController

  def index
    @athletes = athlete.all
    responds_to :html, :json
  end

  def show
    @athlete = find_athlete
  end

  def create
    @athlete = athlete.new(athlete_parms)

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to action: :index }
        format.json { render :index }, status: 201
      else
        format.html { render :index }
        format.json { render json: @athlete.errors }, status: 400
      end
    end
  end

  def update
    @athlete = find_athlete
    @athlete.update_attributes(athlete_params)
    redirect_to action: :index
  end

  def destroy
    @athlete = find_athlete
    @athlete.destroy
    respond_to do |format|
      format.html { redirect_to action: :index, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }, status: 202
    end
    redirect_to action: :index
  end

    # def new
    #   @athlete = athlete.new
    # end

    # def edit
    #   @athlete = find_athlete
    # end

  private

  def find_athlete
    Athlete.find(params[:id])
  end

  def athlete_params
    params.require(:athlete).permit(:nome, :nascita, :sport, :squadra, :altezza, :peso, :retired)
  end

end
