class UserSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :name, :email, :updated_at

  # Delegate the practical definition of `name` to
  # the User model, where it belongs, rather than
  # (re)defining it here.
  def name
    object.name
  end

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end

  def updated_at
    object.updated_at.strftime('%B %d, %Y')
  end
end
