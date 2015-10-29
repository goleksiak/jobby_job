class SubmissionsController < ApplicationController

  before_action :find_job, only: [:new]

  def new
    @submission = Submission.new(job: @job)
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      flash_after_success
      redirect_to root_path
    else
      flash_after_error
      render :new
    end
  end

  private

  def flash_after_success
    flash[:success] = I18n.t :success, scope: 'controllers.submission.create'
  end

  def flash_after_error
    flash[:danger] = @submission.errors.full_messages.first
  end

  def submission_params
    params.
      require(:submission).
      permit(:job_id, :name, :email, :phone_number)
  end

  def find_job
    if params[:job_id].present?
      @job = Job.find params[:job_id]
    else
      redirect_to root_path
    end
  end
end
