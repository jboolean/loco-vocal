require 'digest'
class User < ActiveRecord::Base
  SALT = 'q7gDPzTpL9nyHoaBmtMVtO4+/MURRlFEGDXO2NcSGH0='
  # validates_acceptance_of :tos, message: 'Please read and agree to the Terms & Conditions'
  # validates_confirmation_of :email
  # validates_numericality_of :yob, only_integer: true
  validates_presence_of :email
  validates_presence_of :password
  validates_uniqueness_of :email

  belongs_to :my_town, class_name: 'Town'
  has_one :party

  def password=(value)
    write_attribute(:password, self.hash_password(value))
  end

  def pass_eql?(value)
    password == self.hash_password(value)
  end

  def self.find_by_email_pass(email, pass)
    User.find_by({email: email, password: hash_password(pass)})
  end

  private
  def self.hash_password(password)
    Digest::SHA256.base64digest(password+SALT)
  end
end
