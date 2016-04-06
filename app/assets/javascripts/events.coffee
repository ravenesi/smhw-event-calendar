$ ->
  $('#calendar').fullCalendar
    header:
      left: 'prev,next today'
      center: 'title'
      right: 'agendaWeek'
    defaultDate: window.currentDate
    editable: false
    eventLimit: true
    events: (start, end, timezone, callback) ->
      $.ajax
        url: '/events.json'
        dataType: 'json'
        data:
          start: start.unix()
          end: end.unix()
        success: (doc) ->
          events = []
          $(doc).find('event').each ->
            events.push
              title: $(this).attr('description')
              start: $(this).attr('start')
            return
          callback events
          return
  return