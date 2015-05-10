require 'rails_helper'

RSpec.describe "Songs", :type => :request do
  describe "GET /songs" do
    it "works! (now write some real specs)" do
      get songs_path
      expect(response.status).to be(200)
    end
  end
end
