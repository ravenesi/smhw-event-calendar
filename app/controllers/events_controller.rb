class EventsController < ApplicationController
  def index
    if request.format == 'json'
      @events = Event.event_between(start_date, end_date)
    end
  end

  def create
    @event = Event.new(event_create_params)
    if @event.valid?
      @event.save
      render nothing: true, status: :created
    else
      render nothing: true, status: :unprocessable_entity
    end
  end

  private

  def start_date
    time_to_date_for('start')
  end

  def end_date
    time_to_date_for('end')
  end

  def time_to_date_for(key)
    Time.at(events_params[key].to_i).utc.to_date
  end

  def events_params
    params.permit(:start, :end)
  end

  def event_create_params
    params.require(:event).permit(:start_date, :end_date, :description)
  rescue
    {}
  end
end
