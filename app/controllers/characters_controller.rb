class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @characters = Characters.all
  end

  def show
    @character = Character.find[params[:id]]
  end

  def new
    @character = Character.new
  end

  def create

  end

  private
  def character_params
    params.require(:character).permit(:name, :description, :age, :attributes, :background)

  end
end
