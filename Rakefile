# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'game_24[num1, num2, num3, num4]'
task :game_24, [:num1, :num2, :num3, :num4] do |task, args|
  require "game_24"
  puts Game24Calculator.new(array: [args[:num1], args[:num2], args[:num3], args[:num4]]).work.map{|tmp| tmp.gsub(".0","")+"=24"} || "无解"
end
