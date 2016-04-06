class Event < ActiveRecord::Base
  validates :description, :start_date, :end_date, presence: true

  def self.event_between(start_date, end_date)
    where("start_date >= ? AND end_date <= ?", start_date, end_date )
  end
end
