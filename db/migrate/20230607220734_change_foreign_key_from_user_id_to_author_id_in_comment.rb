class ChangeForeignKeyFromUserIdToAuthorIdInComment < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :user_id, :author_id
    add_foreign_key :comments, :users, column: :author_id
  end
end
