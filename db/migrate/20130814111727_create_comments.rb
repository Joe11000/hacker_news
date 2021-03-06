class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body, :presence => true
      t.belongs_to :user
      t.belongs_to :post

      t.timestamps
    end
  end
end
