# encoding: utf-8

class LLVL < Sinatra::Application

  get '/issue/:issue' do |issue|
    erb :issue do
      erb issue.to_sym
    end
  end

  get '/*' do |page|
    path = File.join(settings.views, page+'.erb')
    pass unless File.exist?(path)

    @page = page.to_sym
    erb @page
  end
end