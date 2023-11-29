# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  admin                  :boolean
#  confirmed              :boolean          default(FALSE)
#  confirmed_at           :date
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord

  # Relationships
  has_many :talks, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validations
  validate :valid_email_domain, on: :create

  # Validate if is a avansoft employee
  def valid_email_domain
    unless email.present? && email.ends_with?('@avantsoft.com.br')
      errors.add(:email, 'must be from avantsoft.com.br domain')
    end
  end
end
