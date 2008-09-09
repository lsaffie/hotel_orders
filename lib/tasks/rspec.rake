# # In rails 1.2, plugins aren't available in the path until they're loaded.
# # Check to see if the rspec plugin is installed first and require
# # it if it is.  If not, use the gem version.
rspec_base = File.expand_path(File.dirname(__FILE__) + '/../../vendor/plugins/rspec')
if File.exist?(rspec_base)
  require rspec_base + '/lib/spec/rake/spectask'
  require rspec_base + '/lib/spec/rake/verify_rcov'
else
  require 'spec/rake/verify_rcov'
  require 'spec/rake/spectask'
end

spec_prereq = File.exist?(File.join(RAILS_ROOT, 'config', 'database.yml')) ? "db:test:prepare" : :noop

namespace :spec do

  application_filelist = FileList['spec/models/**/*_spec.rb',
    'spec/controllers/**/*_spec.rb',
    'spec/handlers/**/*_spec.rb',
    'spec/helpers/**/*_spec.rb',
    'spec/views/**/*_spec.rb',
    'spec/lib/**/*_spec.rb',    
    'lib/**/spec/**/*_spec.rb']
    
  application_filelist.delete('lib/authenticated_system.rb')
  application_filelist.delete('lib/authenticated_test_helper.rb')
  application_filelist.delete('db/example_data.rb')

  desc 'Run all application-specific specs'
  Spec::Rake::SpecTask.new(:app => spec_prereq) do |t|
    t.spec_files = application_filelist
  end

  desc "Run all application-specific specs and output html"
  Spec::Rake::SpecTask.new(:app_with_html => spec_prereq) do |t|
    t.spec_opts = ['-f h:spec_report.html']
    t.spec_files = application_filelist
  end

  desc "Run all application-specific specs and rcov as well"
  Spec::Rake::SpecTask.new(:app_with_rcov) do |t|
    t.rcov = true
    t.rcov_opts = ["--rails", "--text-report",  "--exclude", "spec,.*gems.*,db.*,lib/authenticated_system.rb,lib/authenticated_test_helper.rb" ]
    t.spec_files = application_filelist
  end

  desc "Make sure your test coverage is 80% or higher"
  RCov::VerifyTask.new(:verify_rcov => :spec) do |t|
    t.threshold = 98 # Make sure you have rcov 0.7 or higher!
    t.index_html = "#{RAILS_ROOT}/coverage/index.html"
  end
end
