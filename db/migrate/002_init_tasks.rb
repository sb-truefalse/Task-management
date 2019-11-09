class InitTasks < ActiveRecord::Migration[4.2]
  def up
    Task.create(title: 'Read Ruby',
    			done: Time.now,
    			created_at: Time.now)
    Task.create(title: 'Read SQL',
    			created_at: Time.now)
    Task.create(title: 'Read Ruby on Rails',
    	    	created_at: Time.now)
  end

  def down
    Task.destroy_all
  end
end
