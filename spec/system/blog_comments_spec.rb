require 'rails_helper'

RSpec.describe "BlogComments", type: :system do
  describe "GET /create" do
    it "returns http success" do
      get "/blog_comments/create"
      expect(response).to have_http_status(:success)
    end
  end

end
