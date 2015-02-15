class CreateMentors < ActiveRecord::Migration
  def change
    create_table :mentors do |t|
      t.string :job_title
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
