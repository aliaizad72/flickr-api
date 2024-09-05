class PagesController < ApplicationController
  def index
    @flickr = Flickr.new
    if params[:username]
      begin
        @user = @flickr.people.findByUsername(username: params[:username])
        @photos_list = @flickr.people.getPublicPhotos(user_id: @user["id"])
      rescue Flickr::FailedResponse
        flash[:alert] = "No such username found"
        redirect_to root_path
      end
    end
  end
end
