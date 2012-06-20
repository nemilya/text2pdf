require "rubygems"

require "sinatra"
require "yaml"
require "prawn"

require "fix_ttfunk.rb"
require "helpers.rb"

get '/' do
  @fonts = get_fonts
  erb :index
end

post '/' do
  pdf = get_pdf(params)
  attachment(get_file_name)
  content_type 'application/pdf'
  pdf.render  
end