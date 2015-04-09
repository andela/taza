class CreateFellows < ActiveRecord::Migration
  def change
    create_table :fellows do |t|
      t.text :bio

      t.timestamps null: false
    end
  end
end
