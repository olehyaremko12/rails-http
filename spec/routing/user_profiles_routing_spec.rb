require "rails_helper"

RSpec.describe UserProfilesController, type: :routing do
  describe "routing" do
    it "routes to #edit" do
      expect(:get => "/user_profiles/edit").to route_to("user_profiles#edit")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_profiles").to route_to("user_profiles#update")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_profiles").to route_to("user_profiles#update")
    end
  end
end
