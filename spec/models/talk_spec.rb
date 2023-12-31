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
require 'rails_helper'

RSpec.describe Talk, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
