class TodoService
  def initialize(todo)
    @todo = todo
  end

  def update(params)
    return update_display_order(params[:display_order]) if params[:display_order]
    
    todo.update(params)
  end

  def destroy
    ApplicationRecord.transaction do 
      Todo.where(date: todo.date, user_id: todo.user_id).where('display_order > ?', todo.display_order).each do |todo|
        todo.display_order = todo.display_order - 1
        todo.save!
      end

      todo.destroy!
    end
  end

  attr_reader :todo

  private

  def invalid_display_order
    todo.errors[:base] << "올바르지 않은 display order입니다." 
    raise ActiveRecord::RecordInvalid
  end

  def update_display_order(display_order)
    prev_order, next_order = todo.display_order, display_order
    return invalid_display_order unless prev_order != next_order
    return invalid_display_order if next_order < 0

    ApplicationRecord.transaction do 
      if prev_order > next_order
        Todo.where(date: todo.date, user_id: todo.user_id, display_order: next_order...prev_order).each do |t|
          t.update!(display_order: t.display_order + 1)
        end
      else
        todos = Todo.where(date: todo.date, user_id: todo.user_id, display_order: (prev_order+1)..next_order)
        return invalid_display_order if todos.blank?

        todos.each do |t|
          t.update!(display_order: t.display_order - 1)
        end
      end

      todo.display_order = next_order
      todo.save!
    end
  end
end