require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe 'GET #index' do
    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end
end
