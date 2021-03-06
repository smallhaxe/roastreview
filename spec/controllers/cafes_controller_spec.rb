require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe CafesController do

  # This should return the minimal set of attributes required to create a valid
  # Cafe. As you add validations to Cafe, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CafesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all cafess as @cafess" do
      cafe = Cafe.create! valid_attributes
      get :index, {}, valid_session
      assigns(:cafes).should eq([cafe])
    end
  end

  describe "GET show" do
    it "assigns the requested cafe as @cafe" do
      cafe = Cafe.create! valid_attributes
      get :show, {:id => cafe.to_param}, valid_session
      assigns(:cafe).should eq(cafe)
    end
  end

  describe "GET new" do
    it "assigns a new cafe as @cafe" do
      get :new, {}, valid_session
      assigns(:cafe).should be_a_new(Cafe)
    end
  end

  describe "GET edit" do
    it "assigns the requested cafe as @cafe" do
      cafe = Cafe.create! valid_attributes
      get :edit, {:id => cafe.to_param}, valid_session
      assigns(:cafe).should eq(cafe)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Cafe" do
        expect {
          post :create, {:cafe => valid_attributes}, valid_session
        }.to change(Cafe, :count).by(1)
      end

      it "assigns a newly created cafe as @cafe" do
        post :create, {:cafe => valid_attributes}, valid_session
        assigns(:cafe).should be_a(Cafe)
        assigns(:cafe).should be_persisted
      end

      it "redirects to the created cafe" do
        post :create, {:cafe => valid_attributes}, valid_session
        response.should redirect_to(Cafe.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved cafe as @cafe" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cafe.any_instance.stub(:save).and_return(false)
        post :create, {:cafe => { "name" => "invalid value" }}, valid_session
        assigns(:cafe).should be_a_new(Cafe)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Cafe.any_instance.stub(:save).and_return(false)
        post :create, {:cafe => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested cafe" do
        cafe = Cafe.create! valid_attributes
        # Assuming there are no other cafes in the database, this
        # specifies that the Cafe created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Cafe.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => cafe.to_param, :cafe => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested cafe as @cafe" do
        cafe = Cafe.create! valid_attributes
        put :update, {:id => cafe.to_param, :cafe => valid_attributes}, valid_session
        assigns(:cafe).should eq(cafe)
      end

      it "redirects to the cafe" do
        cafe = Cafe.create! valid_attributes
        put :update, {:id => cafe.to_param, :cafe => valid_attributes}, valid_session
        response.should redirect_to(cafe)
      end
    end

    describe "with invalid params" do
      it "assigns the cafe as @cafe" do
        cafe = Cafe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cafe.any_instance.stub(:save).and_return(false)
        put :update, {:id => cafe.to_param, :cafe => { "name" => "invalid value" }}, valid_session
        assigns(:cafe).should eq(cafe)
      end

      it "re-renders the 'edit' template" do
        cafe = Cafe.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Cafe.any_instance.stub(:save).and_return(false)
        put :update, {:id => cafe.to_param, :cafe => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested cafe" do
      cafe = Cafe.create! valid_attributes
      expect {
        delete :destroy, {:id => cafe.to_param}, valid_session
      }.to change(Cafe, :count).by(-1)
    end

    it "redirects to the cafes list" do
      cafe = Cafe.create! valid_attributes
      delete :destroy, {:id => cafe.to_param}, valid_session
      response.should redirect_to(cafes_url)
    end
  end

end
