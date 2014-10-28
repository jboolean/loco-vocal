class Town < ActiveRecord::Base
  has_many :issues
  belongs_to :parent, class_name: 'Town'
end
