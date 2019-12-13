require 'rails_helper'

RSpec.describe Weapon, type: :model do
  it 'Weapon Title' do
    name = FFaker::Name.first_name
    level = FFaker::Random.rand(1..20)

    weapon = create(:weapon, name: name, level: level)
    expect(weapon.title).to eq("#{name} ##{level}")
  end

  it 'Invalid level' do
    level = 0
    weapon = build(:weapon, level: level)

    expect(weapon).to_not be_valid
  end

  it 'Invalid power_base' do
    power_base = 0
    weapon = build(:weapon, power_base: power_base)

    expect(weapon).to_not be_valid
  end

  it 'Invalid power_step' do
    power_step = 0
    weapon = build(:weapon, power_step: power_step)

    expect(weapon).to_not be_valid
  end

  it 'Valid current power' do
    weapon = create(:weapon)
    current_power = weapon.power_base + ((weapon.level - 1) * weapon.power_step)

    expect(weapon.current_power).to eq(current_power)
  end
end
