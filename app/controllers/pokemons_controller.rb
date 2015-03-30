class PokemonsController < ApplicationController
  
  def capture
    @poke = Pokemon.find(params[:id])
    @poke.trainer = current_trainer
    @poke.save
    redirect_to root_path
  end

  def damage
    @poke = Pokemon.find(params[:id])
    @poke.health = @poke.health - 10
    # if @poke.health <= 0
    #   @poke.destroy
    # else
    #   @poke.save
    # end
    @poke.save
    redirect_to :back
  end

  def heal
    @poke = Pokemon.find(params[:id])
    @poke.health = @poke.health + 10
    @poke.save
    redirect_to :back
  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.create(pokemon_params)
    @pokemon.level = 1
    @pokemon.health = 100
    @pokemon.trainer = current_trainer
    if @pokemon.save
      redirect_to current_trainer
    else
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to :back
    end
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:name)
  end

end