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
class Talk < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged]

  # Uploader
  has_one_attached :thumbnail

  # Validations
  belongs_to :user
end
