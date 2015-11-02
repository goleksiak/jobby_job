class Admin::SubmissionsController < SecureController

  def show
    @submission = Submission.find params[:id]
  end
end
