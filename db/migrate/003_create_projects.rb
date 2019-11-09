class CreateProjects < ActiveRecord::Migration[4.2]
  def up
    create_table :projects do |t|
      t.string :title
      t.datetime :done

      t.datetime :created_at
    end
  end

  def down
    drop_table :projects
  end
end
