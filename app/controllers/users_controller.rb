class UsersController < ApplicationController

  def profile
    @userid = params[:user_id]
    @userinfo = User.find(params[:user_id])
    @posts = @userinfo.posts
    @usercount = @posts.count
  end

end
