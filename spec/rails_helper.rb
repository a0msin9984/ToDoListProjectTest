require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/db/'
  add_filter '/spec/'
end

puts "Coverage report generated in #{SimpleCov.coverage_dir}"
