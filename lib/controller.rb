class Controller
  attr_reader :name, :action, :params
  attr_accessor :status, :headers, :content

  def initialize(name: nil, action: nil, params: nil)
    @name = name
    @action = action
    @params = params
  end

  def call
    send(action)
    pack_response(200,
      headers: {'Content-Type' => 'text/html'},
      content: [template]
    )
  end

  def not_found
    pack_response(404,
      content: ['Nothing found']
    )
  end

  def internal_error
    pack_response(500,
      content: ['Internal error']
    )
  end

  private

  def pack_response(status, headers: {}, content: [])
    self.tap do |controller|
      controller.status = status
      controller.headers = headers
      controller.content = content
    end
  end

  def layouts
    ERB.new(
      File.read(
        File.join(
          Application.root, 'app', 'views',
          'layouts', 'application.html.erb'
          )
        ),
      trim_mode: '%<>'
    ).result(binding)
  end

  def template
    layouts {
      ERB.new(
        File.read(
          File.join(
            Application.root, 'app', 'views',
            "#{self.name}",
            "#{self.action}.html.erb"
            )
          ),
        trim_mode: '%<>'
      ).result(binding)
    }
  end
end
