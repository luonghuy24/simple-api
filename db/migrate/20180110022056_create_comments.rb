class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :note, foreign_key: true
      t.string :created_by

      t.timestamps
    end
  end
end
