class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :mac_address
end
