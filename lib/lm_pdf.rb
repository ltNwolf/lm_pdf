require "lm_pdf/version"
require "lm_pdf/renderer"
require "lm_pdf/template_loader"

module LmPdf
  def self.render(template:, data: {})
    Renderer.new(template).render(data)
  end

  def self.load_render(template_key, data: {})
    template = LmPdf::TemplateLoader.load(template_key)
  rescue KeyError, LoadError => e
    raise TemplateNotFoundError, "Template '#{template_key}' not found: #{e.message}"
  else
    Renderer.new(template).render(data)
  end
end