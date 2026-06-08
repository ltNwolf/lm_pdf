module LmPdf
  class TemplateLoader
    @templates = {}

    def self.register(name, template)
      @templates[name.to_sym] = template
    end

    def self.load(name)
      @templates[name.to_sym]
    end
  end
end