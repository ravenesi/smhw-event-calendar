RSpec.describe 'Events' do
  describe 'List all events' do
    it 'return events based on start and end params from frontend' do
      events_params = {
        'start' => Date.today.beginning_of_week.to_time.to_i,
        'end' => Date.today.end_of_week.to_time.to_i
      }

      get '/events.json', events_params

      expect(response).to render_template(:index)
      expect(response).to be_ok
    end
  end

  describe 'Create new event' do
    describe 'create new event entry' do
      describe 'POST #create' do
        it 'create event' do
          events_create_params = {
              'description' => 'Text event',
              'start_date' => Date.today.beginning_of_week.to_time,
              'end_date' => Date.today.end_of_week.to_time
          }

          post '/events', event: events_create_params

          expect(response).to have_http_status(:created)
        end

        it 'fail to create event' do
          post '/events'

          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end
  end
end