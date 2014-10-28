class IssuesController < ApplicationController
  @@mdparser = Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(render_options = {}), extensions = {})

  def show
    @issue = Issue.find(params[:id])
    @title = @issue.title
    @mdparser = @@mdparser
  end

  def new
    @issue = Issue.new
  end

  def edit
    @issue = Issue.find(params[:id])
  end

  def update
    @issue = Issue.find(params[:id])
   
    if @issue.update(issue_params)
      redirect_to @issue
    else
      render 'edit'
    end
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
