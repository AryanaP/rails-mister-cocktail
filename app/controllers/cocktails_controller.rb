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
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def show
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:id])
    @doses = @cocktail.doses
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name, :photo, :photo_cache)
  end

end
