class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create]

  def index
    @doses = Dose.all
  end

  def create
    @dose = Dose.new(params_dose)
    @cocktail = find_cocktail
    @dose.cocktail = find_cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    find_dose
    @cocktail = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def params_dose
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    Cocktail.find(params[:cocktail_id])
  end
end
