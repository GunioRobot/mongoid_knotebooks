require 'spec_helper'

describe KnotebooksController do

  def mock_knotebook(stubs={})
    @mock_knotebook ||= mock_model(Knotebook, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all knotebooks as @knotebooks" do
      Knotebook.stub(:all) { [mock_knotebook] }
      get :index
      assigns(:knotebooks).should eq([mock_knotebook])
    end
  end

  describe "GET show" do
    it "assigns the requested knotebook as @knotebook" do
      Knotebook.stub(:find).with("37") { mock_knotebook }
      get :show, :id => "37"
      assigns(:knotebook).should be(mock_knotebook)
    end
  end

  describe "GET new" do
    it "assigns a new knotebook as @knotebook" do
      Knotebook.stub(:new) { mock_knotebook }
      get :new
      assigns(:knotebook).should be(mock_knotebook)
    end
  end

  describe "GET edit" do
    it "assigns the requested knotebook as @knotebook" do
      Knotebook.stub(:find).with("37") { mock_knotebook }
      get :edit, :id => "37"
      assigns(:knotebook).should be(mock_knotebook)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created knotebook as @knotebook" do
        Knotebook.stub(:new).with({'these' => 'params'}) { mock_knotebook(:save => true) }
        post :create, :knotebook => {'these' => 'params'}
        assigns(:knotebook).should be(mock_knotebook)
      end

      it "redirects to the created knotebook" do
        Knotebook.stub(:new) { mock_knotebook(:save => true) }
        post :create, :knotebook => {}
        response.should redirect_to(knotebook_url(mock_knotebook))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved knotebook as @knotebook" do
        Knotebook.stub(:new).with({'these' => 'params'}) { mock_knotebook(:save => false) }
        post :create, :knotebook => {'these' => 'params'}
        assigns(:knotebook).should be(mock_knotebook)
      end

      it "re-renders the 'new' template" do
        Knotebook.stub(:new) { mock_knotebook(:save => false) }
        post :create, :knotebook => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested knotebook" do
        Knotebook.should_receive(:find).with("37") { mock_knotebook }
        mock_knotebook.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :knotebook => {'these' => 'params'}
      end

      it "assigns the requested knotebook as @knotebook" do
        Knotebook.stub(:find) { mock_knotebook(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:knotebook).should be(mock_knotebook)
      end

      it "redirects to the knotebook" do
        Knotebook.stub(:find) { mock_knotebook(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(knotebook_url(mock_knotebook))
      end
    end

    describe "with invalid params" do
      it "assigns the knotebook as @knotebook" do
        Knotebook.stub(:find) { mock_knotebook(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:knotebook).should be(mock_knotebook)
      end

      it "re-renders the 'edit' template" do
        Knotebook.stub(:find) { mock_knotebook(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested knotebook" do
      Knotebook.should_receive(:find).with("37") { mock_knotebook }
      mock_knotebook.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the knotebooks list" do
      Knotebook.stub(:find) { mock_knotebook }
      delete :destroy, :id => "1"
      response.should redirect_to(knotebooks_url)
    end
  end

end
