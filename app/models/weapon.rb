class Weapon < ApplicationRecord
  validates :level, numericality: { greater_than: 0 }
  validates :power_base, numericality: { greater_than: 0 }
  validates :power_step, numericality: { greater_than: 0 }

  def current_power
    power_base + ((level - 1) * power_step)
  end

  def title
    "#{name} ##{level}"
  end
end
