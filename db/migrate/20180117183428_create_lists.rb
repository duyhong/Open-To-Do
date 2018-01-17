class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.boolean :private
      t.text :description

      t.timestamps
    end
  end
end
