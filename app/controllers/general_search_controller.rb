class GeneralSearchController < ApplicationController
  def search
    @query = params[:query]
    @towns = Town.where('name LIKE ?', ["%#{@query}%"])
    @issues = Issue.where('title LIKE ?', ["%#{@query}%"])

    return render json: {:results => {:towns => @towns, :issues => @issues}}.to_json if request[:format] == :json
  end
end