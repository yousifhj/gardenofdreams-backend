class Plant < ApplicationRecord
    belongs_to :account
    validates :price, presence: :true 
    validates_inclusion_of :kind, :in => ['gift', 'gifted']

end
