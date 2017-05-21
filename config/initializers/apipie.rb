Apipie.configure do |config|
  config.app_name                = "Hackernews-test API"
  config.app_info                = ""
  config.api_base_url            = ""
  config.api_base_url["1.0"]     = "/v1"
  config.doc_base_url            = "/docs"
  config.validate                = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.default_version = "1.0"
end
