class AddColumnToBlog < ActiveRecord::Migration
  def change
  add_column :blogs, :image_user_id, :string
  end
end
