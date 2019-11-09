class ProjectsIndexService
  def call(params = nil)
    Project.all
  end
end
