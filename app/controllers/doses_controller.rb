class DosesController < ApplicationController


  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
      # message erreur si l'ingredient y est deja
    end
  end


  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = @dose.cocktail
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
