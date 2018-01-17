class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :created_at, :updated_at, :list_id
end
