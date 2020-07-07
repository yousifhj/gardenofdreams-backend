class Account < ApplicationRecord
    has_many :plants
    validates :name, :balance, presence: true 

    def update_balance(plants)
        if plant.root == "gift"
            self.balance = self.balance + plant.price
            self.save 
        elsif plant.root == 'gifted'
           if self.balance >= plant.price
            self.balance = self.balance - plant.price
            self.save
           else 
                return 'Balance too Low'
           end
        end 
    end 

    
end


