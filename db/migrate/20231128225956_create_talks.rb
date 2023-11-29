# frozen_string_literal: true

class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table   :talks do |t|
      t.string     :title
      t.text       :description
      t.string     :speaker
      t.string     :youtube_embedded_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
