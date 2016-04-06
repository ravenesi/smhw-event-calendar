json.events @events do |event|
  json.title event.description
  json.start event.start_date.to_s(:db) + 'T00:00:00'
  json.end event.end_date.to_s(:db) + 'T23:59:59'
end