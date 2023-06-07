class ChangeForeignKeyFromUsersIdToAuthorIdInPost < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :users_id, :author_id
    add_foreign_key :posts, :users, column: :author_id
  end
end
