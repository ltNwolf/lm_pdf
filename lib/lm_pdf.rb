require "lm_pdf/version"
require "lm_pdf/renderer"
require "lm_pdf/template_loader"

module LmPdf
  def self.render(template:, data: {})
    Renderer.new(template).render(data)
  end
end