require File.expand_path(File.dirname(__FILE__) + "/../spec_helper")
require 'capybara/rspec'

require 'selenium-webdriver'
require 'steak/autocomplete'
Capybara.default_driver = :selenium if ENV["SELENIUM"]


Capybara.default_selector = :css
Capybara.server_port = 54544
Capybara.app_host = "http://localhost:54544"
if AppConfig.spec.custom_firefox.enabled
  Selenium::WebDriver::Firefox::Binary.path= AppConfig.spec.custom_firefox.path
end

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

