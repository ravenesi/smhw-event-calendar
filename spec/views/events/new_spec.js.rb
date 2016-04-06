RSpec.describe 'events/new.js.erb' do
  it 'render form to div with id #form' do
    render

    expect(rendered).to include("$('#form').html(")
  end
end