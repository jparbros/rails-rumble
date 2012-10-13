require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

Campaign.blueprint do
  name { "Campaign name" }
  description { "Campaign description" }
end

User.blueprint do
  email { Faker::Internet.email }
  password { "123456" }
  password_confirmation { "123456" }
end