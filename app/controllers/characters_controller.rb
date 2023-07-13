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

    prompt = "Respond in JSON form and include no other commentary, JSON object should be as follows {'name': '', 'description': '', 'background': '' [] } . Give me the a name name, description, and background for a #{character_params}."
    OpenaiService.new(prompt).call
  end

  def create

  end

  private
  def character_params
    params.require(:character).permit(:name, :age, :nationlity)

  end
end
