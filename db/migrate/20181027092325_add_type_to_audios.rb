class AddTypeToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :type_id, :integer
    add_column :videos, :type_id, :integer
    remove_column :videos, :category_id, :integer
    remove_column :audios, :category_id, :integer
  end
end
