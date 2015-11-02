class Admin::SubmissionsController < SecureController

  def index
    if params[:job_id]
      @job         = Job.find params[:job_id]
      @submissions = @job.submissions
    else
      @submissions = Submission.all
    end
  end

  def show
    @submission = Submission.find params[:id]
  end
end
