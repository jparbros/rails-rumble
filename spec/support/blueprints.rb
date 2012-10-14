require 'machinist/active_record'

Campaign.blueprint do
  name { "Campaign name" }
  description { "Campaign description" }
end

User.blueprint do
  email { Faker::Internet.email }
  password { "123456" }
  password_confirmation { "123456" }
end


State.blueprint do
  name {'Super Duper State'}
end
Incident.blueprint do
  # Attributes here
end
