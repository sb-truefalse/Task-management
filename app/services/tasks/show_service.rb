class TasksShowService
  def call(params = nil)
    Task.find(params[:id])
  end
end
