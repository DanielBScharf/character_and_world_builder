class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :description
      t.integer :age
      t.string :attributes
      t.string :background
      t.references :user, null: false, foreign_key: true
      t.references :world, foreign_key: true

      t.timestamps
    end
  end
end
