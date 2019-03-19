# Sensibo API Client

Rewrite of the sensibo API client using Cistern.

## Usage

### Installation
`gem install sensibo-api`

`require 'sensibo-api'`

###
1. Initialize the client

`client = Sensibo.new(api_key: API_KEY)`

2. Get a device

`device = client.devices.first`

3. Set a param

`device.update(fan_level: "strong")`
