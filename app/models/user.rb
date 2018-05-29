class User < ApplicationRecord
  before_save{email.downcase!}
  validates :name,  presence: true, length: {maximum: Settings.length_max.name}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:
    Settings.length_max.email},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum:
    Settings.length_max.password}
end
