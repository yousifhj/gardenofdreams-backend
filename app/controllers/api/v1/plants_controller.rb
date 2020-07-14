class  Api::V1::PlantsController < ApplicationController

   before_action :set_account

    def index
      @plants = Plant.all 
      render json: @plants
    end 

    def show
        @plant = Plant.find(params[:id])
        render json: @plant
    end 

    def create 
      puts params.to_json
      puts plant_params.to_json
        @plant = @account.plants.new(plant_params)
        if @account.update_balance(@plant) != 'Balance too low.'
          unless @plant.save
            puts @plant.errors.full_messages
          end
          
          render json: @account
        else
          puts @account.errors.full_messages
          puts "balance error"
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
        params.require(:plant).permit(:name, :price, :account_id, :kind, :date, :description)
    end 

end 
