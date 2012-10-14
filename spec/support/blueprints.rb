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

IncidentType.blueprint do
  name { "new incident" }
end

Incident.blueprint do
  title { "Incident name" }
  description { "Incident description" }
end


Organization.blueprint do
  name { "New Organization" }
end
Comment.blueprint do
  # Attributes here
end
