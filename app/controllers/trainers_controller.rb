class TrainersController < ApplicationController
  before_filter :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @trainer = Trainer.find(params[:id])
    @pokemon = Pokemon.where(trainer: current_trainer).map{|p| [ p.name, p.id ] }
  end

end
