require 'rails_helper'

RSpec.describe Resturant, type: :model do
  describe 'validations' do
    it { should belong_to(:cuisine) }
    it { should have_many(:reviews) }
    it { should validate_presence_of(:name) }
  end

  describe '#average_rating' do
    let(:review_one) { FactoryGirl.build(:review, rating: 1) }
    let(:review_two) { FactoryGirl.build(:review, rating: 2) }
    let(:review_three) { FactoryGirl.build(:review, rating: 3) }
    it 'validates that resturant without reviews returns average rating 0' do
      resturant_a = FactoryGirl.create(:resturant)
      expect(resturant_a.average_rating).to eq 0
    end

    it 'validates resturant with one review of rating 1 to return average rating 1' do
      resturant_b = FactoryGirl.create(:resturant, reviews: [review_one])
      expect(resturant_b.average_rating).to eq 1
    end

    it 'validates correct average calculation with 2 reviews' do
      resturant_c = FactoryGirl.create(:resturant, reviews: [review_three, review_two])
      expect(resturant_c.average_rating).to eq 3
    end

  end
end
