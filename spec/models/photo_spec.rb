require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe 'associations' do
    it { should belong_to(:user).class_name('User')}
    it { should have_many(:likes).class_name('Like')}
    it { should belong_to(:album).class_name('Album')}
  end
  describe 'validations' do
    it {should validate_presence_of(:title) and validate_length_of(:title).is_at_most(255)}
    it {should validate_length_of(:description).is_at_most(255)}
  end
end
