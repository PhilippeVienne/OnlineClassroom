class GroupsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  skip_authorization_check :only => [:index,:update_user_associations]

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
    @groups = Group.all
    respond_to do |format|
      format.json do
        render :json => @groups.to_json
      end
      format.html
    end
  end

  def update_user_associations
    unless params[:user] then return_bad_gateway end
    unless params[:user][:group_ids] then return_bad_gateway end
    current_user.group_ids = params[:user][:group_ids]
    unless current_user.save
      respond_to do |format|
        format.html do
          render :nothing => true, :status => :internal_server_error
        end
        format.json do
          render :json => {
              success: false,
              error: 500
          }, :status => :internal_server_error
        end
      end
    else
      flash[:notice] = t('groups.success.save')
      respond_to do |format|
        format.html do
          redirect_to groups_path
        end
        format.json do
          render :json => {
              success: true
          }
        end
      end
    end
  end

  def show
  end

  def join
    unless params[:id] then go_on_user_account_page end
    @user = current_user
    @group = Group.where(id: params[:id]).first!
    saved=false
    error=nil
    if @user.groups.include? @group then
      saved=false
      error = t('groups.errors.already_in_this_group')
    else
      @user.groups << @group
      saved = @user.save
      error = t('groups.errors.error_when_join', :name=>@group.name) unless saved
    end
    respond_to do |format|
      format.html do
        flash[:error]= error if error!=nil
        go_on_user_account_page
      end
      format.json do
        data={
            success: saved
        }
        data[:error] = error unless error == nil
        render :json => data
      end
    end
  end

  def leave
    unless params[:id] then go_on_user_account_page end
    @user = current_user
    @group = Group.where(id: params[:id]).first!
    saved=false
    error=nil
    if @user.groups.include? @group then
      @user.groups.delete @group
      saved=@user.save
      error = t('groups.errors.error_when_leave', :name=>@group.name) unless saved
    else
      saved = false
      error = t('groups.errors.not_in_this_group')
    end
    respond_to do |format|
      format.html do
        flash[:error]= error if error!=nil
        go_on_user_account_page
      end
      format.json do
        data={
            success: saved
        }
        data[:error] = error unless error == nil
        render :json => data
      end
    end
  end

  private

  def go_on_user_account_page
    redirect_to edit_registration_path(User)
  end

  def return_bad_gateway
    render :nothing => true, :status => :bad_gateway
  end
end
