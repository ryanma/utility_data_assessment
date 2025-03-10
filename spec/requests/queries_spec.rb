require 'rails_helper'

RSpec.describe "Queries", type: :request do
  describe "GET /index" do
    it 'renders the index template' do
      get '/queries'
      expect(response).to render_template(:index)
    end
  end

  describe "GET /new" do
    it 'renders the new template' do
      get "/queries/new"
      expect(response).to render_template(:new)
    end
  end
end
