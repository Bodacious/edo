namespace :edo do

  task :report => :"report:all"

  namespace :report do

    REPORTS_DIR = ENV['REPORTS_DIR'] || 'doc'

    desc "Generates an HTML report on the current condition of your application's code"
    task :climate do
      system "bundle exec rubycritic app -p #{REPORTS_DIR}"
    end

    desc "Creates an HTML report of any security vulnerabilities in your code"
    task :security do
      system "bundle exec brakeman --output=#{REPORTS_DIR}/security.html -w1 --quiet"
    end

    desc "Creates an HTML report of the quality of the Ruby code, as specified in the " \
           "Ruby Style Guide"
    task :style do
      system "bundle exec rubocop --rails --format html -o #{REPORTS_DIR}/rubocop.html"
    end

    desc "Creates an HTML report of the complexity of the Ruby code based on Sandi "\
           "Metz's Rules"
    task :quality do
      system "bundle exec sandi_meter -o #{REPORTS_DIR} --graph -q"
    end

    desc "Run all of the reporting tasks"
    task :all do
      ["climate", 'security', "style", "quality"].each do |task|
        Rake::Task[:"edo:report:#{task}"].execute
      end
    end


  end

end