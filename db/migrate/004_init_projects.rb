class InitProjects < ActiveRecord::Migration[4.2]
  def up
    Project.create(title: 'Read Books',
                   done: Time.now,
                   created_at: Time.now)
    Project.create(title: 'Sport',
                   done: Time.now,
                   created_at: Time.now)
    Project.create(title: 'Work',
                   created_at: Time.now)
    Project.create(title: 'Games',
                   done: Time.now,
                   created_at: Time.now)
    Project.create(title: 'Math',
                   created_at: Time.now)
    Project.create(title: 'C++',
                   created_at: Time.now)
    Project.create(title: 'Design',
                   created_at: Time.now)
  end

  def down
    Project.destroy_all
  end
end
