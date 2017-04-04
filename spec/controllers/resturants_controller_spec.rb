require 'rails_helper'

RSpec.describe ResturantsController, type: :controller do
  describe 'GET #index' do
    it 'shows all resturants' do
      resturant = FactoryGirl.create(:resturant)
      get :index
      assigns(:resturants).should eq ([resturant])
    end

    it 'renders the :index view' do
      get :index
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the correct resturant to @resturant' do
      resturant = FactoryGirl.create(:resturant)
      get :show, id: resturant
      assigns(:resturant).should eq(resturant)
    end

    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:resturant)
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      FactoryGirl.create(:cuisine)
    end
    context 'with valid attributes' do
      it 'saves the new resturant in the database' do
        expect{
          post :create, resturant: FactoryGirl.attributes_for(:resturant, cuisine_id: Cuisine.first.id)
        }.to change(Resturant, :count).by(1)
      end
      it 'redirects to the home page' do
        post :create, resturant: FactoryGirl.attributes_for(:resturant, cuisine_id: Cuisine.first.id)
        response.should redirect_to root_url
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new resturant in the database' do
        expect{
          post :create, resturant: FactoryGirl.attributes_for(:invalid_resturant)
        }.to_not change(Resturant,:count)
      end

      it 're-renders the :new template' do
        post :create, resturant: FactoryGirl.attributes_for(:invalid_resturant)
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @resturant = FactoryGirl.create(:resturant, name: 'Resturant', max_delivery_time: 40)
    end

    context 'valid attributes' do
      it 'located the requested @resturant' do
        put :update, id: @resturant, resturant: FactoryGirl.attributes_for(:resturant)
        assigns(:resturant).should eq(@resturant)
      end

      it 'changes @resturant\'s attributes' do
        put :update, id: @resturant,
            resturant: FactoryGirl.attributes_for(:resturant, name: 'Zorik', max_delivery_time: 50)
        @resturant.reload
        @resturant.name.should eq('Zorik')
        @resturant.max_delivery_time.should eq(50)
      end

      it 'redirects to the updated resturant' do
        put :update, id: @resturant, resturant: FactoryGirl.attributes_for(:resturant)
        response.should redirect_to @resturant
      end
    end

    context 'invalid attributes' do
      it 'locates the requested @resturant' do
        put :update, id: @resturant, resturant: FactoryGirl.attributes_for(:invalid_resturant)
        assigns(:resturant).should eq(@resturant)
      end

      it 'does not change @resturant\'s attributes' do
        put :update, id: @resturant,
            resturant: FactoryGirl.attributes_for(:resturant, name: nil, max_delivery_time: 30)
        @resturant.reload
        @resturant.name.should eq('Resturant')
        @resturant.max_delivery_time.should_not eq(30)
      end

      it 're-renders the edit method' do
        put :update, id: @resturant, resturant: FactoryGirl.attributes_for(:invalid_resturant)
        response.should render_template :edit
      end
    end
  end
end
