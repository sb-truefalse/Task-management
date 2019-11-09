class AddLikeToProjects < ActiveRecord::Migration[4.2]
  def change
    add_column :projects, :like, :integer
  end
end
