class EventsController < ApplicationController
	# before_action :logged_in?, :authorized_user?, only: [:index, :new, :show, :edit]

	def index
		@events = Event.all
	end

	def new
		@event = Event.new
		render :new
	end

	def show
		#byebug
		event_id = params[:id]
		@event = Event.find(event_id)
		respond_to do |format|
			format.html 
			format.json { render json: @tasks }
		end
	end

	def create
		event = Event.create(event_params)
		respond_to do |format|
			format.html { redirect_to user_events_path(current_user.id, @event) }
			format.json { render json: @event }
		end
	end

	def edit
		event_id = params[:id]
		@event = Event.find(event_id)
		render :edit
	end

	def update
		event_id = params[:id]
		@event = Event.find(event_id)
		@event.update_attributes(event_params)
		
		respond_to do |format|
			format.html { redirect_to user_events_path(current_user.id) }
			format.json { render json: @events }
		end
	end

	def destroy
		event_id = params[:id]
		@event = Event.find(event_id)
		@event.destroy

		respond_to do |format|
			format.html { redirect_to user_events_path(current_user.id) }
			format.json { render json: @events }
		end
	end

private
	
	def event_params
		params.require(:event).permit(:title, :description, :start_date, :end_date, :start_time, :end_time, :user_id, :task_id)	
	end

end
