get '/' do
" Hello from #{ENV['RACK_ENV']}
 My secret is: #{ENV['SUPER_SECRET']}
 My not so secret is: #{ENV['NOT_SECRET']}
"
end
