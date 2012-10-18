class CalendarController < ApplicationController
  before_filter :signed_in_user, only: [:show, :all]
  

  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @first_day_of_week = 1
    @event_strips = Event.event_strips_for_month(@shown_month, @first_day_of_week)
    #@event_strips = Event.event_strips_for_month(@shown_month)
  end

  def show
    @user = User.find(params[:id])
    #@events = @user.events.paginate(page: params[:page])


    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)
    @first_day_of_week = 1
    @event_strips = @user.events.event_strips_for_month(@shown_month, @first_day_of_week)
  end

 private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
   end 
end  
