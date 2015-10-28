class JobsController < ApplicationController

  before_action :find_jobs, only: [:index]
  before_action :find_job,  only: [:show]

  def index
  end

  def show
  end

  private

  def find_jobs
    @jobs = Job.all
  end

  def find_job
    @job = Job.find params[:id]
  end
end
