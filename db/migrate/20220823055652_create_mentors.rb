class CreateMentors < ActiveRecord::Migration[7.0]
  def change
    create_table :mentors do |t|
      t.string :full_name
      t.string :image_url
      t.text :bio
      t.string :specialisation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
