class TasksController < ApplicationController
	before_action :get_event
	# before_action :logged_in?, :authorized_user?, only: [:index, :new, :show, :edit]

	def index
		@tasks = @event.tasks.all



		# @task.find(task_id).user.name
		# user_id = params[:user_id]
		# @user = User.find(user_id)
		# render :index
		respond_to do |format|
			format.html { render :index}
			format.json { render json: @tasks }
		end
	end

	def new
		@event = Event.find(params[:event_id])
		@task = Task.new
		render :new
	end

	def create
		new_task = params.require(:task).permit(:content, :name, :cost, :complete)
		@task = @event.tasks.create(new_task)
		respond_to do |format|
			
			format.html { redirect_to user_event_tasks_path(current_user.id, @event.id) }
			format.json { render json: @task }
		end
	end

	def show
		task_id = params[:id]
		@task = @event.tasks.find(task_id)
		respond_to do |format|
			format.html
			format.json { render json: @tasks }
		end
	end

	def edit
		task_id = params[:id]
		@task = @event.tasks.find(task_id)
		render :edit
	end

	def update
		task_id = params[:id]
		task = @event.tasks.find(task_id)
		updated_attrs = params.require(:task).permit(:content, :name, :cost, :complete)
		task.update_attributes(updated_attrs)
		# redirect_to task_path

		respond_to do |format|
			format.html { redirect_to user_event_tasks_path(current_user.id, @event.id) }
			format.json { render json: @tasks }
		end
	end

	def destroy
		task_id = params[:id]
		@task = @event.tasks.find(task_id)
		@task.destroy

		respond_to do |format|
			format.html { redirect_to user_event_tasks_path(current_user.id, @event.id) }
			format.json { render json: @tasks }
		end
	end

	private
	
		def get_event
			event_id = params[:event_id]
			@event = Event.find(event_id)
		end


end

