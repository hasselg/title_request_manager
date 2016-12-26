class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :lockable

  validates :password, presence: true, allow_nil: true

  def locked
    if self[:locked_at] != nil
      return 1
    else
      return 0
    end
  end

  def locked=(val)
    locked_at_will_change!
    Rails.logger.debug("val: #{val}")

    if val.to_i == 1
      Rails.logger.debug("hit!")
      self[:locked_at] = Date.current
    else
      Rails.logger.debug("no hit :(")
      self[:locked_at] = nil
    end
  end

  def update_without_password(params, *options)
    Rails.logger.debug("update with no password called")
    params.delete(:email)
    params.delete(:password)
    params.delete(:password_confirmation)
    super(params)
  end
end
