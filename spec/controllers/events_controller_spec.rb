require 'spec_helper'

RSpec.describe EventsController do
  describe 'GET #index' do
    subject { get :index }

    it { is_expected.to be_ok }
    it { is_expected.to render_with_layout :application }
    it { is_expected.to render_template :index }

    it "assigns @events" do
      event = create(:event)

      get :index

      expect(assigns(:events)).to eq([event])
    end
  end
end