require "dropbox_api"

yourfile = "links.html"
pattern =["/take home fun/", "/nric/"]
token = "x97iCyS1eZ0AAAAAAAA8_MiBtE8-HUaUpwGH4WtXOdKbGDSZGwBVVauOxnmj7V47"
dropbox = DropboxApi::Client.new(token)
shared_links = dropbox.list_shared_links
array = []

shared_links.links.each do |file|
  pattern.each do |each_pattern|
    if file.path_lower.include?(each_pattern)
      puts file.name
      puts file.path_lower
      puts file.url
      array.push("<a href=#{file.url}>#{file.name}</a>")
      puts "--"
    end
  end
end

File.open(yourfile, 'w') { |file|
  array.each do |each_link|
    file.write(each_link)
    file.write("\n")
    file.write("<br>")
  end
}
