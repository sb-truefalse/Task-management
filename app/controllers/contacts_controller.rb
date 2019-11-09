class ContactsController < Controller
  def index
    @contact = index_service.call
  end

  private

  def index_service
    ContactsIndexService.new
  end
end
