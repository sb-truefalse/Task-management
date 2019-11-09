class Application
  attr_reader :router

  def self.application
    @@application
  end

  def self.initialize!
    new.tap { |application| @@application = application }
  end

  def self.root
    File.join(File.dirname(__FILE__), '..')
  end

  def initialize
    Initializer.call
    @database = Database.new
    @router = Router.new(ROUTES)
  end

  def call(env)
    result = router.resolve(env)
    [result.status, result.headers, result.content]
  end
end
