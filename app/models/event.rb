class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :user
  attr_accessible :color, :end_at, :end_period, :name, :period, :period_id, :start_at, :user_id
  after_save :periodical_events

  def periodical_events   
    a = case period
        when "day" then :days
        when "week" then :weeks
        when "month" then :months
        when "year" then :years     
        else 0
        end
    if a != 0 
      i = 1
      while start_at.advance(a => i) <= end_period do
        eventd = Event.new(:name => name, 
                           :user_id => user_id,
                           :start_at => start_at.advance(a => i), 
                           :end_at => end_at.advance(a => i), 
                           :period_id => id,
                           :color => color,
                           :end_period => end_period)
        eventd.save!
        i +=1
      end
    end  
  end
end
