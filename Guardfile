# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# guard 'livereload' do
#   watch("index.html")
#   watch(%r{assets/.+\.(css|js|html)})
#   #watch(%r{(app|vendor)/assets/\w+/(.+\.(css|js|html)).*})  { |m| "/assets/#{m[2]}" }
# end

guard 'shell' do
  watch(%r{assets/.+\.(css|js|html)}) {|_| `./generate_deck.R` }
  watch("index.Rmd") {|_| `./generate_deck.R` }
end
