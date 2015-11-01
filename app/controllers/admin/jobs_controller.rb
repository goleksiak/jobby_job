class Admin::JobsController < SecureController

  def index
  end

  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params

    if @job.save
      flash_after_success
      redirect_to admin_jobs_path
    else
      flash_after_error
      render :new
    end
  end

  private

  def flash_after_error
    flash[:danger] = @job.errors.full_messages.first
  end

  def flash_after_success
    flash[:success] = I18n.t :success, scope: 'controllers.admin.job.create'
  end

  def job_params
    params.
      require(:job).
      permit(:title, :description)
  end
end
