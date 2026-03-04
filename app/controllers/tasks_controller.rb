class TasksController < ApplicationController
  # indexアクション  一覧表示
  def index
    @tasks = Task.all
  end

  # editアクション  タスク編集画面表示
  def edit
    @task = Task.find(params[:id])
  end

  # updateアクション  タスク更新
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path, notice: 'タスクを更新しました'
    else
      render :edit
    end
  end

  # destroyアクション  タスクを削除
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'タスクを削除しました'
  end

  private

  def task_params
    params.require(:task).permit(:title, :done)
  end
end
