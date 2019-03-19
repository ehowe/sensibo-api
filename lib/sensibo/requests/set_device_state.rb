class Sensibo::SetDeviceState
  include Sensibo::Request

  def real(id, body)
    cistern.request(:post, "/pods/#{id}/acStates", body: body)
  end
end
