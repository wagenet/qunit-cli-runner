module QunitCliRunner
  def self.path
    File.expand_path("../../support/run-qunit.js", __FILE__)
  end
end

require "qunit-cli-runner/task"