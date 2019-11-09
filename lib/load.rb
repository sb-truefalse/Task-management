# Include all framework classes
Dir[File.join(File.dirname(__FILE__), './', '*.rb')].each {|file| require file }
# Include all framework application
Dir[File.join(File.dirname(__FILE__), '../app', '**', '*.rb')].each {|file| require file }
ROUTES = YAML.load(File.read(File.join(File.dirname(__FILE__), '../config', 'routes.yml')))