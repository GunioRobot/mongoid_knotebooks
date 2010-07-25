require 'spec_helper'

describe KopiesController do

  def mock_kopy(stubs={})
    @mock_kopy ||= mock_model(Kopy, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all kopies as @kopies" do
      Kopy.stub(:all) { [mock_kopy] }
      get :index
      assigns(:kopies).should eq([mock_kopy])
    end
  end

  describe "GET show" do
    it "assigns the requested kopy as @kopy" do
      Kopy.stub(:find).with("37") { mock_kopy }
      get :show, :id => "37"
      assigns(:kopy).should be(mock_kopy)
    end
  end

  describe "GET new" do
    it "assigns a new kopy as @kopy" do
      Kopy.stub(:new) { mock_kopy }
      get :new
      assigns(:kopy).should be(mock_kopy)
    end
  end

  describe "GET edit" do
    it "assigns the requested kopy as @kopy" do
      Kopy.stub(:find).with("37") { mock_kopy }
      get :edit, :id => "37"
      assigns(:kopy).should be(mock_kopy)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created kopy as @kopy" do
        Kopy.stub(:new).with({'these' => 'params'}) { mock_kopy(:save => true) }
        post :create, :kopy => {'these' => 'params'}
        assigns(:kopy).should be(mock_kopy)
      end

      it "redirects to the created kopy" do
        Kopy.stub(:new) { mock_kopy(:save => true) }
        post :create, :kopy => {}
        response.should redirect_to(kopy_url(mock_kopy))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved kopy as @kopy" do
        Kopy.stub(:new).with({'these' => 'params'}) { mock_kopy(:save => false) }
        post :create, :kopy => {'these' => 'params'}
        assigns(:kopy).should be(mock_kopy)
      end

      it "re-renders the 'new' template" do
        Kopy.stub(:new) { mock_kopy(:save => false) }
        post :create, :kopy => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested kopy" do
        Kopy.should_receive(:find).with("37") { mock_kopy }
        mock_kopy.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :kopy => {'these' => 'params'}
      end

      it "assigns the requested kopy as @kopy" do
        Kopy.stub(:find) { mock_kopy(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:kopy).should be(mock_kopy)
      end

      it "redirects to the kopy" do
        Kopy.stub(:find) { mock_kopy(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(kopy_url(mock_kopy))
      end
    end

    describe "with invalid params" do
      it "assigns the kopy as @kopy" do
        Kopy.stub(:find) { mock_kopy(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:kopy).should be(mock_kopy)
      end

      it "re-renders the 'edit' template" do
        Kopy.stub(:find) { mock_kopy(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested kopy" do
      Kopy.should_receive(:find).with("37") { mock_kopy }
      mock_kopy.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the kopies list" do
      Kopy.stub(:find) { mock_kopy }
      delete :destroy, :id => "1"
      response.should redirect_to(kopies_url)
    end
  end

end
