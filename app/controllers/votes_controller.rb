class VotesController < ApplicationController
  def create
    return render :empty, status: :not_authorized unless logged_in?

    @vote = Vote.find_or_create_by({
      :user_id => authenticated_user.id,
      :issue_id => params[:issue_id],
    })

    @vote.up = params[:up]
    @vote.save
    
    render json: {:success => true, :result => @vote}.to_json, status: :ok
  end

  def stats

    # render '_stats'
  end

end
