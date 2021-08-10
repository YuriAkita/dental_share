require 'rails_helper'

RSpec.describe "ReviewComments", type: :system do
  describe "GET /create" do
    it "returns http success" do
      get "/review_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
