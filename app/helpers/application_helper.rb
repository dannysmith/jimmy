# frozen_string_literal: true

module ApplicationHelper
  # Component Renderer
  def component(component_name, locals = {}, &block)
    name = component_name.split('_').first
    render("components/#{name}/#{component_name}", locals, &block)
  end
  alias c component
end
