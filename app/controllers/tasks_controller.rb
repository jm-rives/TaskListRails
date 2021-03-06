class TasksController < ApplicationController

  def index
    @tasks = Task.all
    render "index"
    #consider adding @tasks = Task.where(done:false)
    #consider adding @tasks_done = Task.where(done:true)
  end

  #opens new form for user submits to create
  def new
    @task = Task.new
  end

  def create

    # render plain: params.inspect

    @task = Task.new

    @task.title = params[:task][:title]
    @task.description = params[:task][:description]
    # @task.completed_at = params[:task][:completed_at]
   
  
    @task.save

    redirect_to root_path
  end
  
  # #opens new form for user submits to update

  def edit 

    @task = Task.find(params[:id])

  end

  def update
    #@task = Task.find(params[:id])
    #@task.title = params[:task][:title]
    #@task.description = params[:task][:description]
    #@task.save

    Task.update(params[:id],
                title: params[:task][:title],
                description: params[:task][:description])

    redirect_to root_path

  end

  def completed_at

    @task = Task.find(params[:id])
    @task.completed_at = DateTime.now
    @task.save

    redirect_to root_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to root_path
  end

  def show
    @task = Task.find(params[:id])
  end


end
