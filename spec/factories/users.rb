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
FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { name.downcase.gsub(/\s/, '-').concat('@avantsoft.com.br') }
    password { 'test123' }
    password_confirmation { 'test123' }
    confirmed { false }
    confirmed_at { nil }
    admin { false }

    trait :admin do
      name { "Renato Franco" }
      email { "renato.franco@avantsoft.com.br" }
      admin { true }
    end

    trait :confirmed do
      confirmed { true }
      confirmed_at { Date.today }
    end

    trait :with_talks do
      after(:create) do |user, evaluator|
        create_list(:talk, rand(3..5), user: user)
      end
    end
  end
end
