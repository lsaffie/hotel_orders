require File.dirname(__FILE__) + "/helper"

with_steps_for(:webrat, :database, :navigation) do
  run_local_story "menu_story", :type => RailsStory
end