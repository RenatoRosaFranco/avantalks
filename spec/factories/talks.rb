# == Schema Information
#
# Table name: talks
#
#  id                   :integer          not null, primary key
#  description          :text
#  slug                 :string
#  speaker              :string
#  thumbnail            :string
#  title                :string
#  youtube_embedded_url :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#
# Indexes
#
#  index_talks_on_user_id  (user_id)
#
FactoryBot.define do
  factory :talk do
    title { FFaker::Book.title }
    description { FFaker::Lorem.paragraphs(rand(3..5)).join('') }
    speaker { FFaker::Name.name }
    youtube_embedded_url { FFaker::Youtube.embed_url }
    user { association :user }
  end
end
