class TasksController < ApplicationController

  def index
    # @tasks = Task.all
    @complete = Task.where(:status => "Complete")
    @incomplete = Task.where(:status => "Incomplete")
  end

  def show
    id = params[:id]
    @task = Task.find(id)
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    # @task.name = params[:task][:name]
    # @task.description = params[:task][:description]
    # @task.due_date = params[:task][:due_date]
    # @task.status = params[:task][:status]

    if @task.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    if @task.update(task_params)
    #
    # if @task.update(name: params[:task][:name],   description: params[:task][:description], due_date: params[:task][:due_date], status: params[:task][:status])

      redirect_to tasks_path
    else
      render :edit
    end

  end

  def destroy
    id = params[:id]
    @task = Task.find(id)

    if @task.destroy
      redirect_to tasks_path
    end

  end

  private

  def task_params
    return params.require(:task).permit(:name, :description, :due_date, :status)
  end

end
