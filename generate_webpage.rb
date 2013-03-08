require 'google_drive'
require 'csv'

class Talk
  attr_accessor :time, :speaker, :website, :abstract, :title, :length
  
  def initialize(*params)
    @time = params[3]
    @speaker = params[0]
    @website = params[4]
    @abstract = params[2]
    @title = params[1]
  end

end

session = GoogleDrive.login("krismicinski@gmail.com", gets)

key = '0ApKbWhwu9BSsdGZSNGFCWHJLMmU0QUc4VG1EM3NFeGc'
read_header = false

talks = []

CSV.parse(session.spreadsheet_by_key(key).export_as_string('csv')) do |row|
  if !read_header
    read_header = true
  else
    talks << Talk.new(row)
  end
end

p talks
