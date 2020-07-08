class PlantSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :root, :description, :date, :account_id
end
