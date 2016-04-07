RSpec.describe 'Test feature' do
  describe 'Create and list events', :js => true do
    it 'success!' do
      visit '/events'
      click_link 'Create event'
      within("#form form") do
        fill_in 'Description', :with => 'Test event'
        fill_in 'Start date', :with => '2016-04-07'
        fill_in 'End date', :with => '2016-04-07'
        click_button 'Save Event'
      end
      within('#calendar') do
        expect(page).to have_content 'Test event'
      end
    end

    it 'failure!' do
      visit '/events'
      click_link 'Create event'
      within("#form form") do
        fill_in 'Description', :with => ''
        fill_in 'Start date', :with => '2016-04-07'
        fill_in 'End date', :with => '2016-04-07'
        message = accept_alert do
          click_button 'Save Event'
        end
        expect(message).to eq('Error!')
      end
    end
  end
end