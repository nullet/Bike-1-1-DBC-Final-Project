require 'rails_helper'

RSpec.describe "Events", :type => :request do
  describe "GET /events" do
    it "works! (now write some real specs)" do
      get events_path
      expect(response.status).to be(302)
    end
  end
end
