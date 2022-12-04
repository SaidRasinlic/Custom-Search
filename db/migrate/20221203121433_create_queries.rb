# frozen_string_literal: true

class CreateQueries < ActiveRecord::Migration[6.0]
  def change
    create_table :queries do |t|
      t.integer :user_id, limit: 8, index: true
      t.string :identifier, index: true
      t.string :query, index: true
      t.boolean :found
      t.integer :counter, default: 1

      t.timestamps
    end
  end
end
