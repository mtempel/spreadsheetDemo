require "rubygems"
require "google/api_client"
require "google_drive"

# Authorizes with OAuth and gets an access token.
client = Google::APIClient.new
auth = client.authorization
auth.client_id = "YOUR_CLIENT_ID"
auth.client_secret = "YOUR_CLIENT_SECRET"
auth.scope =
   "https://www.googleapis.com/auth/drive " +
   "https://spreadsheets.google.com/feeds/"
auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
print("1. Open this page:\n%s\n\n" % auth.authorization_uri)
print("2. Enter the authorization code shown in the page: ")
auth.code = $stdin.gets.chomp
auth.fetch_access_token!
access_token = auth.access_token

system'clear'
print "Save your access token\n\n"
print access_token
print "\nSave your refresh token\n\n"
print auth.refresh_token
print "\n\n"
