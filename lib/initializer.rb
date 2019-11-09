class Initializer
  def self.call
    Dir[File.join(File.dirname(__FILE__), './../config/initializers', '*.rb')].each {|file| require file }
  end
end
