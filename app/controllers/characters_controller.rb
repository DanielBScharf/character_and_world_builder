class CharactersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :new]

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find[params[:id]]
  end

  def new
    @character = Character.new
    response = OpenaiService.new(prompt).call
    @world_id = 1
    @user_id = 1
    @character.name = response.name
    @character.age = input_params.age
    @character.nationlity = input_params.nationlity
    @character.description = response.description
    @character.background = response.background
  end

  def create
    @character = Character.new
    response = OpenaiService.new(prompt).call
    @world_id = 1
    @user_id = 1
    @character.name = response.name
    @character.age = input_params.age
    @character.nationlity = input_params.nationlity
    @character.description = response.description
    @character.background = response.background
    if @character.save
      redirect_to character_path(@character)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def response
    prompt = "Respond in JSON form and include no other commentary, JSON object should be as follows {'name': '', 'description': '', 'background': '' [] } . Give me the a name name, description, and background for a #{input_params.age} year old #{input_params.nationlity} person."
    return OpenaiService.new(prompt).call
  end

  private

  def input_params
    params.require(:input).permit(:age, :nationlity)
  end

  # def character_params
  #   params.require(:character).permit(:name, :description, :background)
  # end
end
