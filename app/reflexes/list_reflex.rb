class ListReflex < StimulusReflex::Reflex
  def create_task
    list.tasks.create(task_params)
  end

  private

  def list
    List.find(list_id)
  end

  def list_id
    element.dataset.list_id
  end

  # StimulusReflex serializes and send as params from a form.
  def task_params
    params.require(:task).permit(:name)
  end
end