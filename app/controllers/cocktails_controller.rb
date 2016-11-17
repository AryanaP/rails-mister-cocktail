class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to new_cocktail_dose_path(@cocktail)
    else
      render new_cocktail_path
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end

end
