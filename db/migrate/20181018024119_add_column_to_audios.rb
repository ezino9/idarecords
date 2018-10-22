class AddColumnToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios, :user_id, :integer
  end
end
