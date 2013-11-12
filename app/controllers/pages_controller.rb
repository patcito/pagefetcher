class PagesController < ApplicationController
  def create
    if !current_user
      redirect_to '/'
      return
    end
    q = params[:q]
    if q
      page = Typhoeus.get("http://graph.facebook.com/"+q)
      if page.code != 404
        page = JSON.parse page.body
        new_page = Page.where(fbid: q).first
        new_page = Page.new(fbid: q) unless new_page
        new_page.cover_source = page["cover"]["source"]
        new_page.name = page["name"]
        new_page.save
      end
    end
    redirect_to new_page
  end

  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
    @posts = []
    if @page
      fb_client = RestGraph.new(access_token: current_user.oauth_token)
      @posts = fb_client.get(@page.fbid+'/feed')
    end
  end
end
