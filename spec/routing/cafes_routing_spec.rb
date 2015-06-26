require "spec_helper"

describe CafesController do
  describe "routing" do

    it "routes to #index" do
      get("/cafes").should route_to("cafes#index")
    end

    it "routes to #new" do
      get("/cafes/new").should route_to("cafes#new")
    end

    it "routes to #show" do
      get("/cafes/1").should route_to("cafes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/cafes/1/edit").should route_to("cafes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/cafes").should route_to("cafes#create")
    end

    it "routes to #update" do
      put("/cafes/1").should route_to("cafes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/cafes/1").should route_to("cafes#destroy", :id => "1")
    end

  end
end
