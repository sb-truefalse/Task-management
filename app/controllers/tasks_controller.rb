class TasksController < Controller
  def index
    @tasks = index_service.call
  end

  def show
    @task = show_service.call(params)
  end

  def new
  end

  def create
    task = create_service.call(create_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  protected

  def create_params
  end

  private

  def index_service
    TasksIndexService.new
  end

  def show_service
    TasksShowService.new
  end

  def create_service
    TasksCreateService.new
  end
end
