class Account < ApplicationRecord
    has_many :plants
    validates :name, :balance, presence: true 
end
