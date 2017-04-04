require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'validations' do
    it { should belong_to(:resturant) }
    it { should validate_presence_of(:reviewer) }
    it { should validate_presence_of(:rating) }
    it { should validate_numericality_of(:rating) }
    it { should validate_inclusion_of(:rating).in_range(0...4) }

  end
end
