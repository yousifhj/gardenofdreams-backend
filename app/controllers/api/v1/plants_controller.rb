class  Api::V1::PlantsController < ApplicationController

    defore_action :set_account

    def index
        @plant = Plants.all
        render json: @plants
    end 

    def show
        @plant = Plant.find(params[:id])
        render json: @plant
    end 

    def create 
        @plant = @account.plant.new(plant_params)

        @plant.date = DateTime.now
        if @account.update_balance(@plant) != 'Balance too low.'
          @plant.save
          render json: @account
        else
          render json: {error: 'Balance too low'}
        end
    end

    def destroy 
        @plant = Plant.find(params["id"])
        @account = Account.find(@plant.account_id)
        if @account.update_balance_on_delete(@plant)
          @plant.destroy
          render json: @account
        else
          render json: {error: 'Balance too low'}
        end
    end 

    private 

    def set_account 
        @account = Account.find(params[:account_id])
    end 

    def plant_params 
        params.require(:plant).permit(:price, :account_id, :root, :date, :description)
    end 

end 
