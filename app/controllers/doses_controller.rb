class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(cocktails_params)
    if @dose.save
      redirect_to cocktails_path(@dose)
    else
      render "new"
    end
  end
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to cocktails_path
  end

 def review_params
  params.require(:dose).permit(:description, :ingredient_id)
  end
end
