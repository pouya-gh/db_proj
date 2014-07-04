# encoding: utf-8

class Employee < ActiveRecord::Base
  has_secure_password

  after_save :regenerate_auth_token

  validates :email, uniqueness: true

  def regenerate_auth_token
    update_columns(auth_token: generate_token)
  end

  def generate_token
    salt = ";oafoijoajfosj owoeijfos ojfoajsofjoeifsoajol$#$$^%%*&}"
    text = salt + Time.new.to_s
    Digest::MD5.hexdigest(text)
  end
end
