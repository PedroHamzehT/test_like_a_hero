FactoryBot.define do
  factory :weapon do
    name { FFaker::Name.first_name }
    description { FFaker::Lorem.words(15).join(' ') }
    power_base { FFaker::Random.rand(1..20) }
    power_step { FFaker::Random.rand(1..20) }
    level { FFaker::Random.rand(1..20) }
  end
end
