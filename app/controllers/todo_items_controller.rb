class TodoItemsController < ApplicationController
	before_action :set_todo_list
	before_action :set_todo_item, except: [:create]
	before_action :set_user

	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @user
	end

	def edit
		respond_to do |format|
			format.html
			format.js
		end
	end

	def update
		respond_to do |format|
		  if @todo_item.update(todo_item_params)
			format.html { redirect_to current_user }
			format.json { render :show, status: :ok, location: @todo_item }
		  else
			format.html { render :edit }
			format.json { render json: @todo_item.errors, status: :unprocessable_entity }
		  end
		end
	  end



	def destroy
		if @todo_item.destroy
			flash[:success] = "Todo List item was deleted."
		else
			flash[:error] = "Todo List item could not be deleted."
		end
		redirect_to @user
	end

	def complete
		@todo_item.toggle_completion
		redirect_to @user
	end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def set_user 
		@user = current_user
	end

	def set_todo_item
		@todo_item = @todo_list.todo_items.find(params[:id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end

end

