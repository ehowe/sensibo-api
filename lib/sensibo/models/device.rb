class Sensibo::Device
  include Sensibo::Model

  identity :id

  attribute :battery_voltage,                                       type: :float,   squash: ["measurements", "batteryVoltage"]
  attribute :config_group,       aliases: :configGroup
  attribute :fan_level,                                                             squash: ["acState", "fanLevel"]
  attribute :geofencing,         aliases: :isGeofenceOnExitEnabled, type: :boolean
  attribute :humidity,                                              type: :float,   squash: ["measurements", "humidity"]
  attribute :mac_address,        aliases: :macAddress
  attribute :mode,                                                                  squash: ["acState", "mode"]
  attribute :model,              aliases: :productModel
  attribute :native_temperature_unit,                                               squash: ["acState", "nativeTemperatureUnit"]
  attribute :power_on,                                              type: :boolean, squash: ["acState", "on"]
  attribute :swing,                                                                 squash: ["acState", "swing"]
  attribute :target_temperature,                                    type: :float,   squash: ["acState", "targetTemperature"]
  attribute :temperature,                                           type: :float,   squash: ["measurements", "temperature"]
  attribute :temperature_unit,                                                      squash: ["acState", "temperatureUnit"]

  def save
    requires :identity

    temp = if self.temperature_unit == self.native_temperature_unit
             self.target_temperature
           elsif self.temperature_unit == "F"
             c_to_f(f_to_c(self.target_temperature))
           elsif self.temperature_unit == "C"
             f_to_c(c_to_f(self.target_temperature))
           end

    body = {
      "acState" => {
        "fanLevel"          => self.fan_level,
        "mode"              => self.mode,
        "on"                => self.power_on,
        "swing"             => self.swing,
        "targetTemperature" => temp,
        "temperatureUnit"   => self.temperature_unit,
      }
    }

    body = cistern.set_device_state(self.id, body)["result"]

    raise RuntimeError.new("Save Failed") unless body["status"] == "Success"
  end

  def f_to_c(temp)
    ((temp - 32) * (5.0/9.0)).round
  end

  def c_to_f(temp)
    ((temp * (9.0/5.0)) + 32).round
  end
end
