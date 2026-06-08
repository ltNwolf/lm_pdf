module LmPdf
  class TemplateLoader
    @templates = {}

    def self.register(name, template)
      @templates[name.to_sym] = template
    end

    class TemplateNotFound < StandardError; end

    def self.load(name)
      key = name.to_sym
      template = @templates[key]

      raise TemplateNotFound, "Template not found: #{key}" unless template
      
      template
    end
  end
end