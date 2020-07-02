class Plant < ApplicationRecord
    belongs_to :account
    validates :price, presence: :true 
end
