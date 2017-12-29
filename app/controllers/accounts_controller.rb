class AccountsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @student = Student.new
    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.first} #{t.last}", t.id] }
  end

  def add_student
    @student = Student.new(student_params(params))
    @student.user = current_user
    @teachers = Teacher.order(:grade).all.map { |t| ["#{t.first} #{t.last}", t.id] }

    if @student.save
      redirect_to account_path, notice: {title: 'Success', msg: 'Added student successfully.'}
    else
      render :index
    end
  end

  private

  def student_params params
    params.require(:student).permit(:first, :last, :teacher_id)
  end

end
