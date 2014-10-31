class Issue < ActiveRecord::Base
  belongs_to :town
  has_many :votes
end
