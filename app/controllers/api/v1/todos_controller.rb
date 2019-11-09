module Api
  module V1
    class TodosController < ::ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]

      # GET /todos
      def index
        condition = {user_id: @current_user_id}
        if params[:day]
          condition[:date] = "#{params[:year]}/#{params[:month]}/#{params[:day]}".to_date
        elsif params[:month]
          date = "#{params[:year]}/#{params[:month]}/01}".to_date
          condition[:date] =(date)...(date + 1.month)
        elsif params[:year]
          date = "#{params[:year]}/01/01}".to_date
          condition[:date] =(date)...(date + 1.year)
        end
        @todos = Todo.where(condition)

        render json: @todos
      rescue
        raise TodoError
      end

      # GET /todos/1
      def show
        render json: @todo
      end

      # POST /todos
      def create
        @todo = Todo.new(todo_params)
        @todo.user_id = @current_user_id
        
        if @todo.save
          p  @todo.reload
          render json: @todo.reload, status: :created
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /todos/1
      def update
        if @todo.update(todo_params)
          render json: @todo
        else
          render json: @todo.errors, status: :unprocessable_entity
        end
      end

      # DELETE /todos/1
      def destroy
        @todo.destroy
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def set_todo
          @todo = Todo.where(user_id: @current_user_id).find(params[:id])
        end

        # Only allow a trusted parameter "white list" through.
        def todo_params
          params.require(:todo).permit(:text, :date, :checked, :kind, :display_order)
        end
    end
  end
end