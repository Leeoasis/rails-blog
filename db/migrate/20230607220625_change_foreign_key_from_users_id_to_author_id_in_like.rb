class ChangeForeignKeyFromUsersIdToAuthorIdInLike < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :users_id, :author_id
    add_foreign_key :likes, :users, column: :author_id
  end
end
