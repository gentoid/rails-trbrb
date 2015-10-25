class Thing::Cell < Cell::Concept
  property :name
  property :created_at

  def show
    render
  end

  private

  def name_link
    link_to name, thing_path(model)
  end

end
