class ProjectsController < Controller
  def index
    @projects = index_service.call
  end

  def new
    @project = new_service.call
  end

  def create
    @project = create_service.call(params)
  end

  private

  def index_service
    ProjectsIndexService.new
  end

  def new_service
    ProjectsNewService.new
  end

  def create_service
    ProjectsCreateService.new
  end
end
