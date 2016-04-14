RSpec.configure do |config|
  config.before do
    @path   = nil
    @params = {}
    @header = {}
  end
end

DOMAIN = 'static.aibou.moe'

step 'user_nameは :user_name' do |user_name|
  @path = user_name
end

step 'ブラウザは :browser' do |browser|
  @header ||= {}
  @header['User-Agent'] = browser
end

placeholder :browser do
  match(/(firefox|Firefox)/) do
    :firefox
  end

  match(/(chrome|Chrome)/) do
    :chrome
  end

  match(/(safari|Safari)/) do
    :safari
  end

  match(/(androidブラウザ|Androidブラウザ)/) do
    #:android_browser
    "Android"
  end

  match(/(opera|Opera)/) do
    :opera
  end

  default do
    :none
  end
end

step 'requestを投げる' do
  #params = Utility.params_to_query @params
  #header = @header.reject{|k,v| v.nil? }

  http = Net::HTTP.new DOMAIN, 80
  #http = Net::HTTP.new DOMAIN, 443
  #http.use_ssl = true
  #http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  @response = http.get "/#{@path}"
end

step 'HTTPステータスは :status' do |status|
  expect(@response.code).to eq status
end

