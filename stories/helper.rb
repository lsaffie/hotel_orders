ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'spec/rails/story_adapter'
require 'ruby-debug'

dir = File.dirname(__FILE__)
Dir[File.expand_path("#{dir}/steps/*.rb")].uniq.each do |file|
  require file
end

def run_local_story(filename, options={})
  run File.join(File.dirname(__FILE__), filename), options
end

# These allow exceptions to come through as opposed to being caught and hvaing non-helpful responses returned.
ActionController::Base.class_eval do
  def perform_action
    perform_action_without_rescue
  end
end

Dispatcher.class_eval do
  def self.failsafe_response(output, status, exception = nil)
    raise exception
  end
end


def instantize(string)
  instance_variable_get("@#{string}")
end