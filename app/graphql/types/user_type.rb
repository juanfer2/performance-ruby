module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
    field :guid, String, null: true
    field :is_admin, Boolean, null: true
  end
end
