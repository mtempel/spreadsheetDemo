require "rubygems"
require "google/api_client"
require "google_drive"

client_id = "YOUR_CLIENT_ID"
client_secret = "YOUR_CLIENT_SECRET"
refresh_token = "YOUR_REFRESH_TOKEN"
doc_id = "DOCUMENT_ID"

SCHEDULER.every '15m', :first_in => 0 do |job|
  begin
    # initialize the connection to Google OAuth API
    client = Google::APIClient.new(:application_name => 'Ruby application', :application_version => '1.0.0')
        auth = client.authorization
        auth.client_id = client_id
        auth.client_secret = client_secret
        auth.scope = "https://docs.google.com/feeds/" + "https://www.googleapis.com/auth/drive " + "https://spreadsheets.google.com/feeds/"
        auth.redirect_uri = "urn:ietf:wg:oauth:2.0:oob"
        auth.refresh_token = refresh_token
        auth.refresh! 
    access_token = auth.access_token

    # Creates a session.
    session = GoogleDrive.login_with_oauth(access_token)

    ws = session.spreadsheet_by_key(doc_id).worksheets[0]

    # create an array to hold the lines
    rows = Array.new
    header = Array.new

    # other variables
    up = ws.updated.localtime
    up = up.strftime "%d.%m.%Y %H:%M"

    # fill lines
    for row in 1..ws.num_rows
      if row == 1
        header.push({ :c1 => ws[row, 1], :c2 => ws[row, 2], :c3 => ws[row, 3], :c4 => ws[row, 4], :c5 => ws[row, 5], :c6 => ws[row, 6]})
      else
        rows.push({ :c1 => ws[row, 1], :c2 => ws[row, 2], :c3 => ws[row, 3], :c4 => ws[row, 4], :c5 => ws[row, 5], :c6 => ws[row, 6]})
      end
    end 
    send_event('spread', :modified => up, :header => header, :rows => rows)
  rescue => err
    puts "Exception: #{err}"
  end
end
