class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :post, index: true

      t.timestamps null: false
    end
    # is this neccesary?
    add_foreign_key :comments, :posts
  end
end
