require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'faker'
require 'httparty'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'


$env = ENV['BROWSER']
$headless = ENV['HEADLESS']

if $headless
    Capybara.register_driver :selenium do |app|
        Capybara::Poltergeist::Driver.new(app, js_errors: false)
    end
end

Capybara.configure do |config|
    if $env == 'chrome'
        config.default_driver = :selenium_chrome
        elsif $env == 'chrome_headless'
            config.default_driver = :selenium_chrome_headless
        else
            config.default_driver = :selenium
    end
    config.app_host = 'http://webmotors.com.br/'
end

Capybara.default_max_wait_time = 50