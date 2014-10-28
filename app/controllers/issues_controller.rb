class IssuesController < ApplicationController
  @@mdparser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})

  def show
    @issue = Issue.find(params[:id])
    @mdparser = @@mdparser
  end
  def new
  end
  def create
    @issue = Issue.create(issue_params)
    redirect_to @issue
  end

  private
  def issue_params
    params.require(:issue).permit(:title, :content)
  end
end
