require "awesome_print"
require "cistern"
require "excon"
require "faraday"
require "faraday_middleware"
require "oj"

require "dotenv/load" if File.exists?(".env")

class Sensibo
  include Cistern::Client.with(interface: :module)

  recognizes :url, :api_key

  require_relative "sensibo/real"

  require_relative "sensibo/models/device"
  require_relative "sensibo/models/devices"

  require_relative "sensibo/requests/get_devices"
  require_relative "sensibo/requests/set_device_state"
end
