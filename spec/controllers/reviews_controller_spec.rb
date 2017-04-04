require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe 'GET #index' do
    before :each do
      FactoryGirl.create(:resturant)
    end
    it 'shows all reviews' do
      review = FactoryGirl.create(:review, resturant_id: Resturant.first.id)
      get :index, resturant_id: Resturant.first.id
      assigns(:reviews).should eq ([review])
    end

    it 'renders the :index view' do
      get :index, resturant_id: Resturant.first.id
      response.should render_template :index
    end
  end

  describe 'GET #show' do
    before :each do
      FactoryGirl.create(:resturant)
    end
    it 'assigns the correct review to @review' do
      review = FactoryGirl.create(:review, resturant_id: Resturant.first.id)
      get :show, id: review, resturant_id: Resturant.first.id
      assigns(:review).should eq(review)
    end

    it 'renders the #show view' do
      get :show, id: FactoryGirl.create(:review, resturant_id: Resturant.first.id), resturant_id: Resturant.first.id
      response.should render_template :show
    end
  end

  describe 'GET #new' do
    before :each do
      FactoryGirl.create(:resturant)
    end
    it 'renders the :new template' do
      get :new, resturant_id: Resturant.first.id
      response.should render_template :new
    end
  end

  describe 'POST #create' do
    before :each do
      FactoryGirl.create(:resturant)
    end
    context 'with valid attributes' do
      it 'saves the new resturant in the database' do
        expect{
          post :create, review: FactoryGirl.attributes_for(:review), resturant_id: Resturant.first.id
        }.to change(Review, :count).by(1)
      end
      it 'redirects to the review page' do
        post :create, review: FactoryGirl.attributes_for(:review), resturant_id: Resturant.first.id
        response.should redirect_to [Resturant.first, Review.last]
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new resturant in the database' do
        expect{
          post :create, review: FactoryGirl.attributes_for(:review_invalid_rating), resturant_id: Resturant.first.id
        }.to_not change(Review,:count)
      end

      it 're-renders the :new template' do
        post :create, review: FactoryGirl.attributes_for(:review_invalid_rating), resturant_id: Resturant.first.id
        response.should render_template :new
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      FactoryGirl.create(:resturant)
      @review = FactoryGirl.create(:review, reviewer: 'Yarden', rating: 3, resturant_id: Resturant.first.id)
    end

    context 'valid attributes' do
      it 'located the requested @review' do
        put :update, id: @review, review: FactoryGirl.attributes_for(:review), resturant_id: Resturant.first.id
        assigns(:review).should eq(@review)
      end

      it 'changes @review\'s attributes' do
        put :update, id: @review,
            review: FactoryGirl.attributes_for(:review, reviewer: 'Yariv', rating: 1), resturant_id: Resturant.first.id
        @review.reload
        @review.reviewer.should eq('Yariv')
        @review.rating.should eq(1)
      end

      it 'redirects to the updated review' do
        put :update, id: @review, review: FactoryGirl.attributes_for(:review), resturant_id: Resturant.first.id
        response.should redirect_to [Resturant.first, @review]
      end
    end

    context 'invalid attributes' do
      it 'locates the requested @review' do
        put :update, id: @review, review: FactoryGirl.attributes_for(:review_invalid_rating),
                                                                     resturant_id: Resturant.first.id
        assigns(:review).should eq(@review)
      end

      it 'does not change @review\'s attributes' do
        put :update, id: @review,
            review: FactoryGirl.attributes_for(:review, reviewer: nil, rating: 0), resturant_id: Resturant.first.id
        @review.reload
        @review.reviewer.should eq('Yarden')
        @review.rating.should_not eq(0)
      end

      it 're-renders the edit method' do
        put :update, id: @review, review: FactoryGirl.attributes_for(:review_invalid_rating),
                                                                     resturant_id: Resturant.first.id
        response.should render_template :edit
      end
    end
  end
end

