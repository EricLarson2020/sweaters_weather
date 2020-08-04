class TripPlannerSerializer
  include FastJsonapi::ObjectSerializer
  attributes :to, :from, :temperature, :description, :travel_time, :id
end
