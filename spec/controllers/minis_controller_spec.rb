require 'rails_helper'

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

RSpec.describe MinisController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Mini. As you add validations to Mini, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { film_title: 'Camp Pirate', imdb_id: 'A659283498', rating: '3.5', }
  }

  let(:invalid_attributes) {
    { film_title: nil, imdb_id: nil, rating: 'Acid', }
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MinisController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all minis as @minis" do
      mini = Mini.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:minis)).to eq([mini])
    end
  end

  describe "GET #show" do
    it "assigns the requested mini as @mini" do
      mini = Mini.create! valid_attributes
      get :show, {:id => mini.to_param}, valid_session
      expect(assigns(:mini)).to eq(mini)
    end
  end

  describe "GET #new" do
    it "assigns a new mini as @mini" do
      get :new, {}, valid_session
      expect(assigns(:mini)).to be_a_new(Mini)
    end
  end

  describe "GET #edit" do
    it "assigns the requested mini as @mini" do
      mini = Mini.create! valid_attributes
      get :edit, {:id => mini.to_param}, valid_session
      expect(assigns(:mini)).to eq(mini)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Mini" do
        expect {
          post :create, {:mini => valid_attributes}, valid_session
        }.to change(Mini, :count).by(1)
      end

      it "assigns a newly created mini as @mini" do
        post :create, {:mini => valid_attributes}, valid_session
        expect(assigns(:mini)).to be_a(Mini)
        expect(assigns(:mini)).to be_persisted
      end

      it "redirects to the created mini" do
        post :create, {:mini => valid_attributes}, valid_session
        expect(response).to redirect_to(Mini.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved mini as @mini" do
        post :create, {:mini => invalid_attributes}, valid_session
        expect(assigns(:mini)).to be_a_new(Mini)
      end

      it "re-renders the 'new' template" do
        post :create, {:mini => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { film_title: 'Musical Goats', imdb_id: 'A659283666', rating: '1', }
      }

      it "updates the requested mini" do
        mini = Mini.create! valid_attributes
        put :update, {:id => mini.to_param, :mini => new_attributes}, valid_session
        mini.reload
      end

      it "assigns the requested mini as @mini" do
        mini = Mini.create! valid_attributes
        put :update, {:id => mini.to_param, :mini => valid_attributes}, valid_session
        expect(assigns(:mini)).to eq(mini)
      end

      it "redirects to the mini" do
        mini = Mini.create! valid_attributes
        put :update, {:id => mini.to_param, :mini => valid_attributes}, valid_session
        expect(response).to redirect_to(mini)
      end
    end

    context "with invalid params" do
      it "assigns the mini as @mini" do
        mini = Mini.create! valid_attributes
        put :update, {:id => mini.to_param, :mini => invalid_attributes}, valid_session
        expect(assigns(:mini)).to eq(mini)
      end

      it "re-renders the 'edit' template" do
        mini = Mini.create! valid_attributes
        put :update, {:id => mini.to_param, :mini => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested mini" do
      mini = Mini.create! valid_attributes
      expect {
        delete :destroy, {:id => mini.to_param}, valid_session
      }.to change(Mini, :count).by(-1)
    end

    it "redirects to the minis list" do
      mini = Mini.create! valid_attributes
      delete :destroy, {:id => mini.to_param}, valid_session
      expect(response).to redirect_to(minis_url)
    end
  end

end