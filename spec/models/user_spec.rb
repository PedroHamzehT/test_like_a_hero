require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Tests without FactoryBot' do
    it 'is invalid if the level is not between 1 and 99' do
      nickname = FFaker::Name.first_name
      kind = %i[knight wizard].sample
      level = FFaker::Random.rand(100..9999)

      user = User.new(nickname: nickname, kind: kind, level: level)
      expect(user).to_not be_valid
    end

    it 'returns the correct hero title' do
      nickname = FFaker::Name.first_name
      kind = %i[knight wizard].sample
      level = FFaker::Random.rand(1..99)

      user = User.create(nickname: nickname, kind: kind, level: level)
      expect(user.title).to eq("#{kind} #{nickname} ##{level}")
    end
  end

  context 'Tests with FactoryBot' do
    it 'is invalid if the level is not between 1 and 99' do
      user = build(:user, level: FFaker::Random.rand(100..9999))
      expect(user).to_not be_valid
    end

    it 'returns the correct hero title' do
      nickname = FFaker::Name.first_name
      kind = %i[knight wizard].sample
      level = FFaker::Random.rand(1..99)

      # The difference between the test without FactoryBot is in the keyword create -> That is a FactoryBot's keyword
      user = create(:user, nickname: nickname, kind: kind, level: level)
      expect(user.title).to eq("#{kind} #{nickname} ##{level}")
    end
  end
end