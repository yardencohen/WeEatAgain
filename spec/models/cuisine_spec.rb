require 'rails_helper'

RSpec.describe Cuisine, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
    it { should validate_uniqueness_of(:title) }
    it { should allow_value('img.jpg').for(:image)}
    it { should_not allow_value('img.gif').for(:image)}
    it { should_not allow_value('img.jpg.gif').for(:image)}
  end

end