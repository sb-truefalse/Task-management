require 'active_record'

class Database
  def initialize
	db_config_file = File.join(File.dirname(__FILE__), '../config/database.yml')
	raise "File database.yml don't exist" unless File.exist?(db_config_file)
	dbconfig = YAML.load(File.read(db_config_file))
	ActiveRecord::Base.logger = Logger.new(STDERR)
	ActiveRecord::Base.establish_connection(dbconfig)
  end
end
