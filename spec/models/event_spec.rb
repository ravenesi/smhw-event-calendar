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
end