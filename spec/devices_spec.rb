require "test_helper"

describe "Devices" do
  let(:client) { Sensibo.new }

  it "has a collection of devices" do
    expect(client.devices.all).to be_a(Sensibo::Devices)
  end

  context "with a device" do
    let!(:device)   { client.devices.first }

    it "changes the device fan speed" do
      original = device.fan_level

      expect { device.update(fan_level: "strong") }.to change { device.fan_level }.from(original).to("strong")

      device.update(fan_level: original)
    end
  end
end
