# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_index :comments, :author_id, name: 'index_comments_on_user_id'
    add_index :comments, :post_id, name: 'index_comments_on_post_id'
  end
end

class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_index :likes, :author_id, name: 'index_likes_on_author_id'
    add_index :likes, :post_id, name: 'index_likes_on_post_id'
  end
end

class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :text
      t.integer :comment_counter
      t.integer :likes_counter, default: 0
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.integer :comments_counter, default: 0

      t.timestamps
    end

    add_index :posts, :author_id, name: 'index_posts_on_author_id'
  end
end

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.string :bio
      t.integer :posts_counter
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false

      t.timestamps
    end
  end
end
