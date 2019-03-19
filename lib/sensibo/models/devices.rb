class Sensibo::Devices
  include Sensibo::Collection

  model Sensibo::Device

  def all
    data = cistern.get_devices["result"]
    load(data)
  end
end
