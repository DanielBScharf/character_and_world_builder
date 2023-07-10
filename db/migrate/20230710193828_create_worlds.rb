class CreateWorlds < ActiveRecord::Migration[7.0]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :description
      t.string :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
