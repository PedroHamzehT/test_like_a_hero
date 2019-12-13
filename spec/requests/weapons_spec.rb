require 'rails_helper'

RSpec.describe "Weapons", type: :request do
  describe "GET /weapons" do
    it 'return success status' do
      get weapons_path
      expect(response).to have_http_status(200)
    end

    it "weapon's name is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.name)
      end
    end

    it "weapon's current_power is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.current_power.to_s)
      end
    end

    it "weapon's title is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include(weapon.title)
      end
    end

    it "weapon's link is present" do
      weapons = create_list(:weapon, 3)
      get weapons_path
      weapons.each do |weapon|
        expect(response.body).to include("Detalhes - #{weapon.name}")
      end
    end
  end

  describe 'POST /weapons' do
    context 'when it has valid parameters' do
      it 'creates the weapon with correct attributes' do
        weapon_attributes = FactoryBot.attributes_for(:weapon)
        post weapons_path, params: { weapon: weapon_attributes }
        expect(Weapon.last).to have_attributes(weapon_attributes)
      end
    end

    context 'whent it has invalid parameters' do
      it 'does not create weapon' do
        expect {
          post weapons_path, params: {
            weapon: { name: '', description: '', power_base: '', power_step: '', level: '' }
          }
        }.to_not change(Weapon, :count)
      end
    end
  end

  describe 'DELETE /weapons/:id' do
    it 'deletes the weapon with correct id' do
      weapon = create(:weapon)
      get weapons_path
      expect(response.body).to include(weapon.title)

      delete weapon_path(weapon)
      expect(Weapon.count).to eq(0)
    end
  end

  describe 'GET /weapons/:id' do
    it "weapon's name is present" do
      weapon = create(:weapon)
      get weapon_path(weapon)
      expect(response.body).to include(weapon.name)
    end

    it "weapon's current_power is present" do
      weapon = create(:weapon)
      get weapon_path(weapon)
      expect(response.body).to include(weapon.current_power.to_s)
    end

    it "weapon's description is present" do
      weapon = create(:weapon)
      get weapon_path(weapon)
      expect(response.body).to include(weapon.description)
    end

    it "weapon's title is present" do
      weapon = create(:weapon)
      get weapon_path(weapon)
      expect(response.body).to include(weapon.title)
    end
  end
end
