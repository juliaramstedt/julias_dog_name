# frozen_string_literal: true

class CreateNames < ActiveRecord::Migration[7.0]
  def change
    create_table :names do |t|
      t.string :name
      t.integer :votes, null: false, default: 0

      t.timestamps
    end
  end
end
