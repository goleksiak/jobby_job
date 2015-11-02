class Admin::JobsController < SecureController

  before_action :find_job, only: [:edit, :update]

  def new
    @job = Job.new
  end

  def create
    @job = Job.new job_params

    if @job.save
      flash_after_successful_create
      redirect_to jobs_path
    else
      flash_after_error
      render :new
    end
  end

  def edit
  end

  def update
    if @job.update_attributes job_params
      flash_after_successful_update
      redirect_to jobs_path
    else
      flash_after_error
      render :edit
    end
  end

  private

  def find_job
    @job = Job.find params[:id]
  end

  def flash_after_error
    flash[:danger] = @job.errors.full_messages.first
  end

  def flash_after_successful_update
    flash[:success] = I18n.t :success, scope: 'controllers.admin.job.update'
  end

  def flash_after_successful_create
    flash[:success] = I18n.t :success, scope: 'controllers.admin.job.create'
  end

  def job_params
    params.
      require(:job).
      permit(:title, :description)
  end
end
