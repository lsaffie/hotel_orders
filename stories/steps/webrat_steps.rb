steps_for(:webrat) do

	# note, this is not wrapping all of them...

  When "clicks on '$link'" do |link|
    clicks_link link
  end

  When "fills in $field with '$value'" do |field, value|
    fills_in field, :with => value
  end  

  When "selects $field as '$option'" do |field, option|
    selects option, :from => field
  end

  When "checks $checkbox" do |checkbox|
    checks checkbox
  end

  When "clicks the $button button" do |button|
    clicks_button button
  end

end