require 'spec_helper'

RSpec.describe EventsController do
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to be_ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }
  end
end