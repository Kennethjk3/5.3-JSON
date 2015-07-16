class AthletesController < ApplicationController

  def index
    @athletes = Athlete.all
    respond_to :html, :json
  end

  def show
    @athlete = find_athlete

    respond_to do |format|
      format.html action: :index
      format.json { render json: @athletes }
    end
  end

  def create
    @athlete = Athlete.new(athlete_params)

    respond_to do |format|
      if @athlete.save
        format.html { redirect_to action: :index }
        format.json { render json: @athletes }
      else
        format.html { render :index }
        format.json { render json: @athlete.errors }
      end
    end
  end


  def update
    @athlete = find_athlete
    u = @athlete.update_attributes(athlete_params)

    respond_to do |format|
      format.html {
        if u
          flash[:notice] = "Successfully updated Athlete."
          redirect_to action: :index
        else
          render action: :edit
        end
      }
      format.json {
        if u
          render json: :index
        else
          render json: :edit
        end
      }
    end
  end

  def destroy
    @athlete = find_athlete
    @athlete.destroy
    respond_to do |format|
      # format.html { redirect_to action: :index, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
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
