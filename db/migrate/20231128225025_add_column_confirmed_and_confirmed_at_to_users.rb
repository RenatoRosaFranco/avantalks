# frozen_string_literal: true

class AddColumnConfirmedAndConfirmedAtToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :confirmed, :boolean, default: false
    add_column :users, :confirmed_at, :date
  end
end
