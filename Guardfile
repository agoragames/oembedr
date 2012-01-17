guard 'bundler' do
  watch('Gemfile')
  # Uncomment next line if Gemfile contain `gemspec' command
  # watch(/^.+\.gemspec/)
end


guard 'rspec', version: 2, cli: '--color --format nested', all_on_start: true, all_after_pass: true do
  watch('spec/spec_helper.rb')                        { "spec" }
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
end
