class Account < ApplicationRecord
    has_many :plants
    validates :name, :balance, presence: true 

    def update_balance(plant)
        if plant.kind == "gift"
            self.balance = self.balance + plant.price
            self.save 
        elsif plant.kind == 'gifted'
           if self.balance >= plant.price
            self.balance = self.balance - plant.price
            self.save
           else 
                return 'Balance too Low'
           end
        end 
    end 

    
end


