class AddColumnThumbnailToTalks < ActiveRecord::Migration[5.2]
  def change
    add_column :talks, :thumbnail, :string
  end
end
