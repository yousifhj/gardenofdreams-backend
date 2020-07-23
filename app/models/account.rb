class Account < ApplicationRecord
    has_many :plants
    validates :name, :balance, presence: true 

    def update_balance(plant)
      puts plant.to_json
        if plant.kind == 'gift'
            self.balance = self.balance - plant.price
            self.save 
        elsif plant.kind == 'gifted'
           if self.balance >= plant.price
            self.balance = self.balance + plant.price
            self.save
           else 
                return 'Balance too Low'
           end
        end 
    end 

    def update_balance_on_delete(plant)
        if plant.kind == 'gift'
          if self.balance >= plant.price
            self.balance = self.balance + plant.price
            self.save
          else
            return 'Balance too low.'
          end
        elsif plant.kind == 'gifted'
            self.balance = self.balance - plant.price 
            self.save
        end
      end

end


