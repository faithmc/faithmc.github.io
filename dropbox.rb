require "dropbox_api"
token = "x97iCyS1eZ0AAAAAAAA8_MiBtE8-HUaUpwGH4WtXOdKbGDSZGwBVVauOxnmj7V47"
dropbox = DropboxApi::Client.new(token)
shared_links = dropbox.list_shared_links
shared_links.links.each do |file|
  puts file.name
  puts file.path_lower
  puts "--"
end #these are the links
