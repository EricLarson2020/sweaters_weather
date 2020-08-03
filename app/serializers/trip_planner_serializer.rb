class TripPlannerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :trails, :id
end
