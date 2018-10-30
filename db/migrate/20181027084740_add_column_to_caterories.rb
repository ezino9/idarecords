class AddColumnToCaterories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :name, :string
    remove_column :categories, :post, :string
    remove_column :categories, :song, :string

  end
end
