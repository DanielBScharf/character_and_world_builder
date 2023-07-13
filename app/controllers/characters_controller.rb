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

    prompt = "Respond in JSON form and include no other commentary, JSON object should be as follows {'name': '', 'description': '', 'background': '' [] } . Give me the a name name, description, and background for a #{character_params.age} year old #{character_params.nationlity} person."
    response = OpenaiService.new(prompt).call
    @name = response.name
    @nationlity = character_params.nationlity
    @age = character_params.age
    @description = response.age
    @background = response.background
    @character.name = @name
    @character.age = @age
    @character.nationlity = @nationlity
    @character.description = @description
    @character.background = @background
  end

  def create
    @character = Character.new

    prompt = "Respond in JSON form and include no other commentary, JSON object should be as follows {'name': '', 'description': '', 'background': '' [] } . Give me the a name name, description, and background for a #{character_params.age} year old #{character_params.nationlity} person."
    response = OpenaiService.new(prompt).call
    @name = response.name
    @nationlity = character_params.nationlity
    @age = character_params.age
    @description = response.age
    @background = response.background
    @character.name = @name
    @character.age = @age
    @character.nationlity = @nationlity
    @character.description = @description
    @character.background = @background

    if @character.save
      redirect_to character_path(@character)
    else
      render :new, status: :unprocessable_entity
    end

  end

  private
  def character_params
    params.require(:character).permit(:age, :nationlity)

  end
end
