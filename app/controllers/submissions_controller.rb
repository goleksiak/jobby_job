class SubmissionsController < ApplicationController

  before_action :find_job, only: [:new]

  def new
    @submission = Submission.new(job: @job,
                                  cover_letter: Document.new,
                                  resume: Document.new)
  end

  def create
    @submission = Submission.new(submission_params)

    if @submission.save
      flash_after_success
      redirect_to root_path
    else
      flash_after_error
      reset_submission_documents
      render :new
    end
  end

  private

  def reset_submission_documents
    @submission.cover_letter  = Document.new
    @submission.resume        = Document.new
  end

  def flash_after_success
    flash[:success] = I18n.t :success, scope: 'controllers.submission.create'
  end

  def flash_after_error
    flash[:danger] = @submission.errors.full_messages.first
  end

  def submission_params
    params.
      require(:submission).
      permit(:job_id,
              :name,
              :email,
              :phone_number,
              cover_letter_attributes: [:file],
              resume_attributes: [:file])
  end

  def find_job
    if params[:job_id].present?
      @job = Job.find params[:job_id]
    else
      redirect_to root_path
    end
  end
end
