class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :presence => true
      t.string :content
      t.belongs_to :user

      t.timestamps
    end
  end
end
