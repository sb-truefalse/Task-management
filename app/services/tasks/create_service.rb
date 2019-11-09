class TasksCreateService
  def call(params = nil)
    Task.create!(params)
  end
end
