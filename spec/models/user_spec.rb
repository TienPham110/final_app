require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:photos).class_name('Photo')}
    it { should have_many(:albums).class_name('Album')}
    it { should have_many(:likes).class_name('Like')}
    it { should have_many(:followers).class_name('User')}
    it { should have_many(:followings).class_name('User')}
  end
  describe 'validations' do
    it { should validate_presence_of(:firstName) and validate_length_of(:lastName).is_at_most(25)}
    it { should validate_presence_of(:lastName) and validate_length_of(:firstName).is_at_most(25)}
    it { should validate_presence_of(:email) and validate_length_of(:email).is_at_most(255)}
    it { should validate_presence_of(:password) and validate_length_of(:password).is_at_least(8).is_at_most(64)}
  end
end
