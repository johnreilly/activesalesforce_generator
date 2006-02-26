# Filters added to this controller will be run for all controllers in the application.
# Likewise, all the methods added will be available for all controllers.
class ApplicationController < ActionController::Base
  before_filter :asf_sid_authenticate
  
  def asf_sid_authenticate
    # Look to see if a SID was passed in the URL
    sid = params[:sid]
    if sid
      api_server_url = params[:api_server_url]
      api_server_url = 'http://na1-api.salesforce.com/services/Soap/u/7.0' unless api_server_url

      puts "asf_sid_authenticate(:sid => '#{sid}', :url => '#{api_server_url}')"
      Contact.establish_connection(:adapter => 'activesalesforce', :sid => sid, :url => api_server_url) if sid
    end
  end
end