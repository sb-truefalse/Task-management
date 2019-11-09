class ProjectsCreateService
  def call(params = nil)
    Project.create(params)
  end
end
