RSpec.describe Event do
  it do
    is_expected.to validate_presence_of(:description).
      with_message("can't be blank")
  end

  it do
    is_expected.to validate_presence_of(:start_date).
      with_message("can't be blank")
  end

  it do
    is_expected.to validate_presence_of(:end_date).
      with_message("can't be blank")
  end

  describe '#event_between' do
    it 'return events for dates' do
      create(:event, start_date: Date.today, end_date: 1.day.from_now.to_date)

      start_date = Date.today
      end_date = 7.days.from_now.to_date

      events = Event.event_between(start_date, end_date)

      expect(events.size).to be(1)
    end

    it 'not return events already happens' do
      create(:event, start_date: 2.days.ago, end_date: 1.day.ago)

      start_date = Date.today
      end_date = 7.days.from_now.to_date

      events = Event.event_between(start_date, end_date)

      expect(events.size).to be(0)
    end
  end
end