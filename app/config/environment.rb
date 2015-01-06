require 'bundler/setup'
Bundler.require

ENV['SINATRA_ENV'] ||= "development"

Dir[File.join(File.dirname(__FILE__), "../models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../controllers", "*.rb")].each {|f| require f}