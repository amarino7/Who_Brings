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
		new_event = params.require(:event).permit(:title, :description, :start_date, :end_date, :start_time, :end_time)
		event = Event.create(new_event)
		respond_to do |format|
			format.html { redirect_to "/events#event.id" }
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
		updated_attrs = params.require(:event).permit(:title, :description, :start_date, :end_date, :start_time, :end_time)
		@event.update_attributes(updated_attrs)
		# redirect_to task_path

		respond_to do |format|
			format.html { redirect_to "/events#event.id" }
			format.json { render json: @events }
		end
	end

	def destroy
		event_id = params[:id]
		@event = Event.find(event_id)
		@event.destroy

		respond_to do |format|
			format.html { redirect_to "/events" }
			format.json { render json: @events }
		end
	end

end
