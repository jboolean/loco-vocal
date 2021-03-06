class IssuesController < ApplicationController

  def show
    @issue = Issue.find(params[:id])
    @user_vote = Vote.find_by({:issue => @issue, :user => authenticated_user})
    @title = @issue.title
    @mdparser = @@mdparser
    @town = Town.find(params[:town_id])
    @votes = votes
  end

  def new
    @town = Town.find(params[:town_id])
    @issue = Issue.new
    @issue.town = @town
  end

  def edit
    @issue = Issue.find(params[:id])
    @town = Town.find(params[:town_id])
  end

  def update
    @issue = Issue.find(params[:id])
   
    if @issue.update(issue_params)
      redirect_to [@issue.town, @issue]
    else
      render 'edit'
    end
  end

  def create
    @issue = Issue.create(issue_params)
    redirect_to [@issue.town, @issue]
  end

  private
  def issue_params
 
    params2 = params.require(:issue).permit(:title, :content, :town)
    puts params2.inspect
    if (params2['town'])
      params2['town'] = Town.find(params2['town'].to_i)
    end
    params2
  end

  def votes
    {
      :up => Vote.where({:issue => @issue, :up => true}),
      :down => Vote.where({:issue => @issue, :up => false}),
    }
  end

  helper_method :statistics
  def statistics(votes)
    memo = Hash.new(0)
    votes.each do |vote|
      puts "TTTT"
      puts vote.inspect
      memo[vote.party]+=1
    end
    memo
  end

end
