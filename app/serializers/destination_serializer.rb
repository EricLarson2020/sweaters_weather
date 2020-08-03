class DestinationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :url
end
