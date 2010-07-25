require 'spec_helper'

describe KnotesController do

  def mock_knote(stubs={})
    @mock_knote ||= mock_model(Knote, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all knotes as @knotes" do
      Knote.stub(:all) { [mock_knote] }
      get :index
      assigns(:knotes).should eq([mock_knote])
    end
  end

  describe "GET show" do
    it "assigns the requested knote as @knote" do
      Knote.stub(:find).with("37") { mock_knote }
      get :show, :id => "37"
      assigns(:knote).should be(mock_knote)
    end
  end

  describe "GET new" do
    it "assigns a new knote as @knote" do
      Knote.stub(:new) { mock_knote }
      get :new
      assigns(:knote).should be(mock_knote)
    end
  end

  describe "GET edit" do
    it "assigns the requested knote as @knote" do
      Knote.stub(:find).with("37") { mock_knote }
      get :edit, :id => "37"
      assigns(:knote).should be(mock_knote)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created knote as @knote" do
        Knote.stub(:new).with({'these' => 'params'}) { mock_knote(:save => true) }
        post :create, :knote => {'these' => 'params'}
        assigns(:knote).should be(mock_knote)
      end

      it "redirects to the created knote" do
        Knote.stub(:new) { mock_knote(:save => true) }
        post :create, :knote => {}
        response.should redirect_to(knote_url(mock_knote))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved knote as @knote" do
        Knote.stub(:new).with({'these' => 'params'}) { mock_knote(:save => false) }
        post :create, :knote => {'these' => 'params'}
        assigns(:knote).should be(mock_knote)
      end

      it "re-renders the 'new' template" do
        Knote.stub(:new) { mock_knote(:save => false) }
        post :create, :knote => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested knote" do
        Knote.should_receive(:find).with("37") { mock_knote }
        mock_knote.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :knote => {'these' => 'params'}
      end

      it "assigns the requested knote as @knote" do
        Knote.stub(:find) { mock_knote(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:knote).should be(mock_knote)
      end

      it "redirects to the knote" do
        Knote.stub(:find) { mock_knote(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(knote_url(mock_knote))
      end
    end

    describe "with invalid params" do
      it "assigns the knote as @knote" do
        Knote.stub(:find) { mock_knote(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:knote).should be(mock_knote)
      end

      it "re-renders the 'edit' template" do
        Knote.stub(:find) { mock_knote(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested knote" do
      Knote.should_receive(:find).with("37") { mock_knote }
      mock_knote.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the knotes list" do
      Knote.stub(:find) { mock_knote }
      delete :destroy, :id => "1"
      response.should redirect_to(knotes_url)
    end
  end

end
