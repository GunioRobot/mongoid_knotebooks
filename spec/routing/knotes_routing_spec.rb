require "spec_helper"

describe KnotesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/knotes" }.should route_to(:controller => "knotes", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/knotes/new" }.should route_to(:controller => "knotes", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/knotes/1" }.should route_to(:controller => "knotes", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/knotes/1/edit" }.should route_to(:controller => "knotes", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/knotes" }.should route_to(:controller => "knotes", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/knotes/1" }.should route_to(:controller => "knotes", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/knotes/1" }.should route_to(:controller => "knotes", :action => "destroy", :id => "1")
    end

  end
end
