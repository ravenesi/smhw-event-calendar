RSpec.describe 'events/index.json.jbuilder' do
  it 'display all events' do
    event = create(
      :event,
      description: 'Test event',
      start_date: Date.today,
      end_date: 1.day.from_now.to_date
    )
    assign(:events, [event])

    render

    json_response = JSON.parse(rendered)

    expect(json_response.keys).to include('events')

    events = json_response['events']

    expect(events.size).to eql(1)
    expect(events.first).to eq(
      'title' => 'Test event',
      'start' => Date.today.to_s(:db) + 'T00:00:00',
      'end' => 1.day.from_now.to_date.to_s(:db) + 'T23:59:59',
    )
  end
end