class TasksController < ApplicationController
  before_action :set_task, except: [:new, :create]

  # GET /tasks/new
  def new
    @task = Task.new
    @users = User.all
    @projects = Project.all
  end

  # GET /tasks/1/edit
  def edit
    @users = User.all
    @projects = Project.all
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)
    @task.user = current_user unless @task.user

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.project, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    @users = User.all
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task.project, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task.project, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:user_id, :project_id, :status, :date, :description)
    end
end
