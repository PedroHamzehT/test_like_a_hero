class WeaponsController < ApplicationController
  before_action :set_weapon, only: %i[show destroy]

  def index
    @weapons = Weapon.all
  end

  def create
    @weapon = Weapon.create(weapon_params)
    redirect_to users_path
  end

  def show; end

  def destroy
    @weapon.destroy
  end

  private

  def weapon_params
    params.require(:weapon).permit(:name, :description, :power_base, :power_step, :level)
  end

  def set_weapon
    @weapon = Weapon.find(params[:id])
  end
end
