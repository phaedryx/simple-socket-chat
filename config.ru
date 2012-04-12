require './chat'

use Rack::Static, :urls => ['/stylesheets', '/javascripts'], :root => 'public'
run Rack::URLMap.new(
  '/'       => Chat::IndexAction,
  '/socket' => Chat::UserSocket
)
