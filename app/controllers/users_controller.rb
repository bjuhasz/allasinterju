class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @user = User.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end
  
  respond_to :html, :json
  
  def create
    status = sanitize(params[:user].delete(:status))
    @user = User.new(params[:user])
    @user.status = status
  
    if @user.save
      respond_with do |format|
        format.html do
          if request.xhr?
            render :partial => "users/show", :locals => { :user => @user }, :layout => false, :status => :created
          else
            redirect_to @user
          end
        end
      end
    else
      respond_with do |format|
        format.html do
          if request.xhr?
            render :json => @user.errors, :status => :unprocessable_entity
          else
            render :action => :new, :status => :unprocessable_entity
          end
        end
      end
    end
  end
  
  private
  
  def sanitize(status)
    # TODO
    status
  end
end
