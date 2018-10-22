class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :song
      t.string :post

      t.timestamps
    end
  end
end
