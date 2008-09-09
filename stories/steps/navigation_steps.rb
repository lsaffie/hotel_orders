steps_for(:navigation) do

  When "$actor goes to the home page" do |actor|
    get "/"
  end

  When "$actor goes to $path" do |actor, path|
    get path
  end
  
  Then "$actor should see the $resource show page" do |actor, resource|
    response.should render_template("#{resource.gsub(" ","_").pluralize}/show")
  end
    
  # Pass the params as such: ISBN: '0967539854' and comment: 'I love this book' and rating: '4'
  # this matcher will post to the resourcese default create action
  When "$actor submits $a_or_an $resource with $attributes" do |actor, a_or_an, resource, attributes|
    post_via_redirect "/#{resource.downcase.pluralize}", {resource.downcase => attributes.to_hash_from_story}
  end
  
  Then "page should include text: $text" do |text|
    response.should have_text(/#{text}/)
  end
  
  Then "page should include a notice '$notice_message'" do |notice_message|
    response.should have_tag("div.notice", notice_message)
  end
  
  Then "page should have the $resource's $attributes" do |resource, attributes|
    actual_resource = instantize(resource)
    attributes.split(/, and |, /).each do |attribute|
      response.should have_text(/#{actual_resource.send(attribute.strip.gsub(" ","_"))}/)
    end
  end
  
end
