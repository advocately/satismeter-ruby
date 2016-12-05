# Satismeter API Ruby Client

Unofficial Ruby client for the [Satismeter API](https://github.com/satismeter/knowledge-base/wiki/API-for-export-CSV,-JSON).

## Installation

Add `gem 'satismeter'` to your application's Gemfile, and then run `bundle` to install.

## Configuration

To get started, you need to configure the client with your secret API key. If you're using Rails, you should add the following to new initializer file in `config/initializers/satismeter.rb`.

```ruby
require 'satismeter'
Satismeter.api_key = 'YOUR_API_KEY'
Satismeter.app_id = 'YOUR_APP_ID'
```

For further options, read the [advanced configuration section](#advanced-configuration).

**Note:** Your API key is secret, and you should treat it like a password. You can find your API key and App ID in your Satismeter account, under *Settings* > *Integrations* > *API Keys*. App ID is called *Project ID* on this screen.


Retrieving a survey response:

```ruby
# Retrieve an existing survey response
survey_response3 = Satismeter::SurveyResponse.retrieve('123')
```

Listing survey responses:

```ruby
# List all survey responses
survey_responses = Satismeter::SurveyResponse.all({
  startDate: 1.day.ago,
  page: {
    size: 100,
    number: 2
  }
})
```

## <a name="advanced-configuration"></a> Advanced configuration & testing

The following options are configurable for the client:

```ruby
Satismeter.api_key
Satismeter.app_id
Satismeter.api_base_url # default: 'https://app.satismeter.com/api'
Satismeter.http_adapter # default: Satismeter::HTTPAdapter.new
```

By default, a shared instance of `Satismeter::Client` is created lazily in `Satismeter.shared_client`. If you want to create your own client, perhaps for test or if you have multiple API keys, you can:

```ruby
# Create an custom client instance, and pass as last argument to resource actions
client = Satismeter::Client.new(:api_key => 'API_KEY', :app_id => 'APP_ID',
  :api_base_url => 'https://app.satismeter.com/api',
  :http_adapter => Satismeter::HTTPAdapter.new)
metrics_from_custom_client = Satismeter::SurveyResponse.retrieve({}, client)

# Or, you can set Satismeter.shared_client yourself
Satismeter.shared_client = Satismeter::Client.new(:api_key => 'API_KEY', :app_id => 'APP_ID',
  :api_base_url => 'https://app.satismeter.com/api',
  :http_adapter => Satismeter::HTTPAdapter.new)
metrics_from_custom_shared_client = Satismeter::SurveyResponse.retrieve
```

## Supported runtimes

- Ruby MRI (1.8.7+)
- JRuby (1.8 + 1.9 modes)
- RBX (2.1.1)
- REE (1.8.7-2012.02)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run the tests (`rake test`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
