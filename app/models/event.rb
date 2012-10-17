class Event < ActiveRecord::Base
  attr_accessible :color, :end_at, :end_period, :name, :period, :period_id, :start_at, :user_id
end
