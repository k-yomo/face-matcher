class CreateFaces < ActiveRecord::Migration
  def change
    create_table :faces do |t|
      t.string :self_face_url
      t.string :ideal_face_url
      t.references :user

      t.timestamps
    end
  end
end
