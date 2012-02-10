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

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create_orig
    status = sanitize(params[:user].delete(:status))
    @user = User.new(params[:user])
    @user.status = status

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
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
  
  def create_comment
    @comment = Comment.new( params[:comment] )
  
    if @comment.save
      respond_with do |format|
        format.html do
          if request.xhr?
            render :partial => "comments/show", :locals => { :comment => @comment }, :layout => false, :status => :created
          else
            redirect_to @comment
          end
        end
      end
    else
      respond_with do |format|
        format.html do
          if request.xhr?
            render :json => @comment.errors, :status => :unprocessable_entity
          else
            render :action => :new, :status => :unprocessable_entity
          end
        end
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def sanitize(status)
    # TODO
    status
  end
end
