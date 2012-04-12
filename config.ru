require './chat'

use Rack::Static, :urls => ['/stylesheets', '/javascripts', '/images'], :root => 'public'
run Rack::URLMap.new(
  '/'       => Chat::IndexAction,
  '/socket' => Chat::UserSocket
)
