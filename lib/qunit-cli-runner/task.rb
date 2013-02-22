require 'colored'

module QunitCliRunner
  class Task
    def initialize(name_or_opts=nil, opts=nil)
      if name_or_opts.is_a?(Hash)
        opts = name_or_opts
      else
        name = name_or_opts
      end

      name ||= "test"
      opts ||= {}
      opts[:path] ||= File.join(Dir.pwd, "tests", "index.html")
      opts[:test_args] ||= ['']

      Rake::Task.define_task(name) do
        success = true

        puts "Running Tests..."

        opts[:test_args].each do |args|
          puts args
          cmd = "phantomjs \"#{QunitCliRunner.path}\" \"file://localhost#{opts[:path]}?#{args}\""
          system(cmd)

          # A bit of a hack until we can figure this out on Travis
          tries = 0
          while tries < 3 && $?.exitstatus === 124
            tries += 1
            puts "\nTimed Out. Trying again...\n"
            system(cmd)
          end

          success &&= $?.success?
        end

        if success
          puts "\nTests Passed".green
        else
          puts "\nTests Failed".red
          exit(1)
        end
      end
    end
  end
end