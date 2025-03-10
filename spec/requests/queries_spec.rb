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

  describe "POST queries/" do
    let(:params) { { query: { start: "2020-01-01", end: "2020-01-02", respondent: "PJM" } }  }

    it 'creates a query object' do
      expect {
        post "/queries", params: params
      }.to change(Query, :count).by(1)
    end

    context "query obj is valid" do
      it "redirects to show"
    end

    context "query obj is not valid" do
      it "renders the new page with errors"
    end
  end
end
