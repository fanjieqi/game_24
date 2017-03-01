require "rails_helper"

RSpec.describe WelcomesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/welcomes").to route_to("welcomes#index")
    end

  end
end
