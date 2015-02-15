class CreateFellows < ActiveRecord::Migration
  def change
    create_table :fellows do |t|
      t.string :bio
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
