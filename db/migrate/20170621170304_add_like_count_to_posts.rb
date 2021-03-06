# frozen_string_literal: true

class AddLikeCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :like_count, :integer, null: false, default: 0
  end
end
