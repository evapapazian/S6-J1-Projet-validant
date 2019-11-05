class EventsController < ApplicationController


  def index
  	@event = Event.all
  end

  def show
  	@event = Event.find(params[:id])
  end 

  def new
  	@event = Event.new
  end

  def create 
  	@event = Event.create(title: params[:title], description: params[:description], start_date: params[:start_date], duration: params[:duration], location: params[:location], price: params[:price],administrator_id: current_user.id)

  	if @event.save
  		redirect_to event_path(@event.id)
  end 
end 



end
