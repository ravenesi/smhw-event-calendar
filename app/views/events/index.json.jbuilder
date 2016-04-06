json.events @events do |event|
  json.title event.description
  json.start_date event.start_date.to_s(:db)
  json.end_date event.end_date.to_s(:db)
end