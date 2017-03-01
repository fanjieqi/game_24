# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

desc 'game_24[num1, num2, num3, num4]'
task :game_24 do |task, args|
  require "game_24"
  value = ENV["value"] || 24
  ans = Game24Calculator.new(array: args.to_a, value: ENV["value"], size: ENV["size"]).work.map{|tmp| tmp.gsub(".0","")+"=#{value}"}
  puts ans.empty? ? "无解" : ans
end
