class TaskReflex < StimulusReflex::Reflex
  def toggle
    Task.find(id).update(completed_at: checked ? Time.current : nil)
  end

  private

  def id
    element.dataset.id
  end
  
  def checked
    element.checked
  end
end