# frozen_string_literal: true

class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :user, null: false, index: true, foreign_key: true
      t.references :group, null: false, index: true, foreign_key: true

      t.timestamps
    end
  end
end
