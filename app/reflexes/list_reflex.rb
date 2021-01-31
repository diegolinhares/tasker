class ListReflex < StimulusReflex::Reflex
  before_reflex :find_list

  def create_task
    sleep 2
    @new_task = @list.tasks.create(task_params)
    @new_task = Task.new if @new_task.persisted?
  end

  private

  def find_list
    @list = List.find(element.dataset.list_id)
  end

  # StimulusReflex serializes and send as params from a form.
  def task_params
    params.require(:task).permit(:name)
  end
end