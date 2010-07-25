require "spec_helper"

describe KopiesController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/kopies" }.should route_to(:controller => "kopies", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/kopies/new" }.should route_to(:controller => "kopies", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/kopies/1" }.should route_to(:controller => "kopies", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/kopies/1/edit" }.should route_to(:controller => "kopies", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/kopies" }.should route_to(:controller => "kopies", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/kopies/1" }.should route_to(:controller => "kopies", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/kopies/1" }.should route_to(:controller => "kopies", :action => "destroy", :id => "1")
    end

  end
end
