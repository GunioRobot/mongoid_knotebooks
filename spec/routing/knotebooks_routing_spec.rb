require "spec_helper"

describe KnotebooksController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/knotebooks" }.should route_to(:controller => "knotebooks", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/knotebooks/new" }.should route_to(:controller => "knotebooks", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/knotebooks/1" }.should route_to(:controller => "knotebooks", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/knotebooks/1/edit" }.should route_to(:controller => "knotebooks", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/knotebooks" }.should route_to(:controller => "knotebooks", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/knotebooks/1" }.should route_to(:controller => "knotebooks", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/knotebooks/1" }.should route_to(:controller => "knotebooks", :action => "destroy", :id => "1")
    end

  end
end
