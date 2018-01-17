class ListSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :description, :created_at, :updated_at, :user_id
end
