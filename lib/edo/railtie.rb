module Edo
  class Railtie < Rails::Railtie
    rake_tasks do
      require 'tasks/edo/reports.rb'
    end
  end
end