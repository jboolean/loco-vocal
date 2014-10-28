class User < ActiveRecord::Base
  has_one :my_town
  has_one :party
end
