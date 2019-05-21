class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    find_cocktail
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params_cocktail)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/new'
    end
  end

  def edit
    find_cocktail
  end

  def update
    find_cocktail
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/:id/edit'
    end
  end

  def destroy
    find_cocktail
    @cocktail.destroy
    redirect_to cocktails_path
  end

  private

  def params_cocktail
    params.require(:cocktail).permit(:name)
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
