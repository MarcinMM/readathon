class Rmgr::TeachersController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
    redirect_to :denied unless current_user.admin?
  end

  def index
    @teachers = Teacher.all
  end

  def new
    @teacher = Teacher.new
    @teacher.build_user
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(teacher_params(params))

    user = User.new(user_params(params[:teacher]))
    user.teacher = @teacher
    user.save

    if @teacher.save
      redirect_to rmgr_teachers_path, notice: {title: 'Success', msg: 'Added teacher successfully.'}
    else
      render :action => "new"
    end

    @teacher = user
  end

  def update
    @teacher = Teacher.find(params[:id])

    if @teacher.user.email != params[:teacher][:user][:email]
      #@teacher.user.update_attribute params[:teacher][:user][:email]
    end

    if params[:teacher][:user][:password].length > 0
Rails.logger.warn "!!!!!!!update password to #{params[:teacher][:user][:password].length}!!!!!!"
      #@teacher.user.update_attribute :email, params[:teacher][:user].email
    end

#    if @teacher.user.email != params[:teacher][:user].email || params[:teacher][:user].password.length > 0
#      unless @teacher.user.update_attributes(params[:teacher][:user])
#        render :action => "edit"
#      end
#    end

    if @teacher.update_attributes(teacher_params(params))
      redirect_to rmgr_teachers_path, notice: {title: 'Success', msg: 'User was successfully updated.'}
    else
      render :action => "edit"
    end
  end

  def destroy
    teacher = Teacher.find(params[:id])
    teacher.user.destroy
    teacher.destroy
    redirect_to rmgr_teachers_path
  end

  private

  def user_params params
    params.require(:user).permit(:email, :password)
  end

  def teacher_params params
    params.require(:teacher).permit(:first, :last, :grade)
  end

end

