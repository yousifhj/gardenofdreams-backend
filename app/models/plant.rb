class Plant < ApplicationRecord
    belongs_to :account
    validates :price, presence: :true 
    validates_inclusion_of :root, :in => ['gift', 'gifted']

end
