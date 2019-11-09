class TasksIndexService
  def call(params = nil)
    Task.all
  end
end
