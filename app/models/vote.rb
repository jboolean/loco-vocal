class Vote < ActiveRecord::Base
  belongs_to :issue
  belongs_to :user
  has_one :party, through: :user
end
