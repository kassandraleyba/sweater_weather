class UserSerializer
  include JSONAPI::Serializer

  attributes  :email, 
              :password, 
              :password_confirmation
end