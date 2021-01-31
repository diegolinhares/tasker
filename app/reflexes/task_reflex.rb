class TaskReflex < StimulusReflex::Reflex
  before_reflex :find_task

  def toggle
    @task.update(completed_at: element.checked ? Time.current : nil)
  end

  def destroy
    @task.destroy
  end

  private

  def find_task
    @task = Task.find(element.dataset.id)
  end
end