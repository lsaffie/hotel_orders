namespace :db do
  
  namespace :fixtures do
    task :load  => ['db:reset', 'environment'] do 
      load RAILS_ROOT + '/spec/fixtures/fixtures.rb'
    end
  end
end