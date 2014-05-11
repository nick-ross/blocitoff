class InsecureUserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name

  def first_name
    object.first_name
  end
end