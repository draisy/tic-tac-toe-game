require_relative './tictactoe_controller.rb'

class RootController < TictactoeController

  get '/' do
    erb :'index'
  end

  get '/start' do
    Game.new
  end

  get '/:val' do
    @choice = params[:position]
    binding.pry
  end

end
