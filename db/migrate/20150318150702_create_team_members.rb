class CreateTeamMembers < ActiveRecord::Migration
  def change
    create_table :team_members do |t|
      t.string :name
      t.string :position
      t.string :image
      t.string :bio

      t.timestamps null: false
    end
  end
end
