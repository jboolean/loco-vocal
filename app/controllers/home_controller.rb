class HomeController < ApplicationController
  def index
    @featured_issues = Issue.order(created_at: :desc).limit(10)
  end
end
