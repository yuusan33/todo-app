class TasksController < ApplicationController
  # indexアクション  一覧表示
  def index
    @tasks = Task.all
  end
end
