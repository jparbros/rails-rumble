class Authentication < ActiveRecord::Base
  attr_accessible :organization_id, :provider, :secret, :token, :uid
end
