class TaskReflex < StimulusReflex::Reflex
  def toggle
    task.update(completed_at: checked ? Time.current : nil)
  end

  def destroy
    task.destroy
  end

  private

  def task
    Task.find(id)
  end

  def id
    element.dataset.id
  end
  
  def checked
    element.checked
  end
end