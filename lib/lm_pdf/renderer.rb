module LmPdf
  class Renderer
    def initialize(template)
      @template = template.to_s
    end

    def render(data = {})
      result = @template.dup

      data.each do |key, value|
        result.gsub!("[#{key.upcase}]", value.to_s)
      end

      result
    end
  end
end