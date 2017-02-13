# Spreadsheet Widget

Use this Widget to access a Google Spreadsheet and print the Document in your own style on Dashboard.

## Dependencies
Using this widget to access Google spreadsheets requires you install the following gems separately.
Add this lines to your application's Gemfile:
```ruby 
gem install google_drive
gem install google-spreadsheet-ruby
```
And then execute:
```ruby
bundle
```

## Installation
Add all project files in the same folders of your project and customize your project.erb

## OAuth Token
To use the widget you have to create some Token on Google and generate an refresh Token.

### Acquiring API keys
1. Go to the [Google Developers Console](https://console.developers.google.com/project).
2. Select a project, or create a new one.
3. In the sidebar on the left, expand **APIs & auth**. Next, click **APIs**. Select the **Enabled APIs** link in the API section to see a list of all your enabled APIs. Make sure that the API is on the list of enabled APIs. If you have not enabled it, select the API from the list of APIs, then select the **Enable API** button for the API.
4. In the sidebar on the left, select **Credentials**.
5. Click **Create new Key** and create and use a **server key** if your application runs on a server.

### Create refreshToken
1. ```vi get_access_token.rb```
2. Set YOUR_CLIENT_ID and YOUR_CLIENT_SECRET which you have generate on Google Developers Console
3. ```ruby get_access_token.rb ``` and follow the steps
4. ```vi jobs/spread.rb```
5. Set YOUR_CLIENT_ID, YOUR_CLIENT_SECRET and YOUR_REFRESH_TOKEN
6. The DOCUMENT_ID is the bold part of the fileURL docs.google.com/spreadsheets/d/**1zlycWSOb4WhChhku7t8hiT6nzHzj_hv8kOS3X2PyIUc**/edit#gid=0
7. Save the file and start dashing ```dashing start```

## Demo
### Before
![before](https://github.com/mtempel/spreadsheetDemo/blob/master/images/spreadsheet.png)

### Result
![result](https://github.com/mtempel/spreadsheetDemo/blob/master/images/spreadWidget.png)
