class CreateTheTeams < ActiveRecord::Migration
  def change
    create_table :the_teams do |t|
      t.string :name
      t.string :position
      t.string :image
      t.string :bio

      t.timestamps null: false
    end
  end
end
