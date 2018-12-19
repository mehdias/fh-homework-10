module API
  class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :update, :destroy]

    # GET /api/players
    def index
      # implement your code here
      players = Player.all
      render json: players, status: 200
    end

    # GET /api/players/1
    def show
      if @player.present?
        render json: @player, status: 200
      else
        render plain: "unprocessible entity", status: 422
      end
    end

    # POST /api/players
    def create
      # implement your code here
      player = Player.new(player_params)
      if player.save
        render json: player, status: 201
      else
        render plain: 'unprocessible entity', status: 422
      end
    end

    # PATCH/PUT /api/players/1
    def update
      if @player.update_attributes(player_params)
        render json: @player, status: 200
      else 
        render plain: 'unprocessable entity', status: 422
      end
    end
    

    # DELETE /api/players/1
    def destroy
      if @player.blank?
        render plain: 'unprocessable_entity', status: 422
      else
        @player.destroy
        render json: {status: 200} 
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_player
      @player = Player.find_by(id: params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def player_params
      params.require(:player).permit(:first_name, :last_name, :email, :age, :position)
    end
    
  end
end
