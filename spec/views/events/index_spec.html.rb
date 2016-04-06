RSpec.describe 'events/index.html.erb' do
  it 'display link for create events' do
    render

    expect(rendered).to match('href="/events/new')
  end
end