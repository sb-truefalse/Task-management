class CreateTasks < ActiveRecord::Migration[4.2]
  def up
    create_table :tasks do |t|
      t.string :title
      t.datetime :done

      t.datetime :created_at
    end
  end

  def down
    drop_table :tasks
  end
end
