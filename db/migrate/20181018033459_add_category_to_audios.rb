class AddCategoryToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :category_id, :integer
  end
end
