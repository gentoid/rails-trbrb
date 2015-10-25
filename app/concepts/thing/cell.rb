class Thing::Cell < Cell::Concept

  def show
    render
  end

  private

  def name_link
    link_to model.name, thing_path(model)
  end

  def created_at
    model.created_at
  end

end
