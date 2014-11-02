class TownsController < ApplicationController

  def show
    @town = Town.find(params[:id])
    @title = @town.name
    @mdparser = @@mdparser

    cur_town = @town
    @featured_issues = []
    until cur_town.nil?
      @featured_issues.concat(cur_town.issues)
      cur_town = cur_town.parent
    end

    @featured_issues.sort_by!{|i| i.created_at}.reverse!
  end

  def new
    @town = Town.new
    @selectList = makeTownSelect
  end

  def create
    @town = Town.create(town_params)
    redirect_to @town
  end

  def edit
    @town = Town.find(params[:id])
    @selectList = makeTownSelect
  end

  def update
    @town = Town.find(params[:id])
   
    if @town.update(town_params)
      redirect_to @town
    else
      render 'edit'
    end
  end

  def search
    @results = Town.where('name LIKE ?', ["%#{params[:query]}%"])
    return render json: {:results => @results}.to_json if request[:format] == :json
  end

  private 
  def makeTownSelect
    townList = [['Top Level (No Parent)', nil]];
    townList.concat(Town.all.map{|t|[t.name, t.id]})
    townList.reject!{|t| t == @town}
    townList
  end

  def town_params
 
    params2 = params.require(:town).permit(:name, :intro, :image_url, :parent_id)
    # puts params2.inspect
    # if (params2['town'])
    #   params2['town'] = Town.find(params2['town'].to_i)
    # end
    params2
  end
end
