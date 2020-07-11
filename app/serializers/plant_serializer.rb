class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :kind, :description, :date, :account_id
end
