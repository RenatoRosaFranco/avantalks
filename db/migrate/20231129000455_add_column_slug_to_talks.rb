# frozen_string_literal: true

class AddColumnSlugToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :slug, :string
  end
end
