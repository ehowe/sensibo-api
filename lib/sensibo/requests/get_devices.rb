class Sensibo::GetDevices
  include Sensibo::Request

  def real
    cistern.request(:get, "/users/me/pods")
  end
end
