class Thing::Cell < Cell::Concept
  include ActionView::Helpers::DateHelper
  include Rails::Timeago::Helper

  property :name
  property :created_at

  def show
    render
  end

  private

  def name_link
    link_to name, thing_path(model)
  end

  def created_at
    timeago_tag super
  end

  def classes
    classes = %w( columns large-3 )
    classes.push 'end' if options[:last] == model
    classes
  end

end
