class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|

      t.belongs_to :user
      t.string :body
      t.string :status
      t.timestamps
    end
  end
end
