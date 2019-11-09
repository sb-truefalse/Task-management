class Router
  attr_reader :routes, :routes_with_method

  def initialize(routes)
    @routes = routes
    @routes_with_method = nil
  end

  def resolve(env)
    http_method = env['REQUEST_METHOD']
    init_routes_with_method!(http_method)
    path = init_path(env['REQUEST_PATH'])
    params = init_params env['QUERY_STRING']
    if routes_with_method.key?(path)
      return send_assets(routes_with_method[path]) if assets?(env['REQUEST_PATH'])
      ctrl(routes_with_method[path], params: params).call
    else
      Controller.new.not_found
    end
  rescue Exception => error
    puts error.message
    puts error.backtrace
    Controller.new.internal_error
  end

  private

  def send_assets(path)
    OpenStruct.new(
      status: '200',
      headers: {},
      content: File.open("app/assets/#{path}", 'r').each_line.to_a
    )
  end

  def assets?(request)
    request.include?('assets')
  end

  def init_routes_with_method!(http_method)
    @routes_with_method = routes[http_method]
  end

  def ctrl(string, params: nil)
    ctrl_name, action_name = string.split('#')
    klass = Object.const_get "#{ctrl_name.capitalize}Controller"
    klass.new(name: ctrl_name, action: action_name.to_sym, params: params)
  end

  def init_path(request_path)
    request_path = request_path[-1] != '/' ? request_path : request_path[0..-2]
    if routes_with_method.key?(request_path)
      request_path
    else
      _request_path = request_path.split('/')
      request_path = _request_path[0..-2].join('/')
      @request_with_id = _request_path.last
      "#{request_path}/:id"
    end
  end

  def init_params(query_string)
    params = Hash[*query_string.split('=')]
    params.merge!(id: @request_with_id) if @request_with_id
    params
  end
end
