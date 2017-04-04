class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates_presence_of :email, message: "E-mail can not be empty"
  validates_format_of :email, message: "The email format is not legal",
                      with: /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/,
                      if: proc { |user| !user.email.blank? }
  validates :email, uniqueness: true

  validates_presence_of :password, message: "password can not be blank",
                        if: :need_validate_password
  validates_presence_of :password_confirmation, message: "Password confirmation can not be empty",
                        if: :need_validate_password
  validates_confirmation_of :password, message: "The password is inconsistent",
                            if: :need_validate_password
  validates_length_of :password, message: "The password is at least 6 digits", minimum: 6,
                      if: :need_validate_password

  def username
    self.email.split('@').first
  end

  private
  def need_validate_password
    self.new_record? ||
        (!self.password.nil? || !self.password_confirmation.nil?)
  end
end
