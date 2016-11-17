class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end


  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params_dose)
    @dose.cocktail = @cocktail
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    @dose.ingredient = @ingredient
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end


  def destroy
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.find(params[:id])
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
