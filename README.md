# lm_pdf

## Contexto

`lm_pdf` es una gema Ruby (compatible con Rails 4.0.5) para generar HTML dinámico a partir de plantillas simples y datos tipo Hash.

No utiliza ERB ni ejecuta código Ruby dentro de los templates. El sistema se basa en reemplazo directo de placeholders.

---

## Concepto

El sistema se compone de 3 piezas:

- **TemplateLoader** → registra y recupera templates
- **Renderer** → reemplaza placeholders `[key]`
- **API LmPdf** → punto de entrada público

---

## Cómo funciona

### 1. Registro de template

```ruby
LmPdf::TemplateLoader.register(:invoice, "<h1>[name]</h1><p>[title]</p>")
```

---

### 2. Carga de template

```ruby
template = LmPdf::TemplateLoader.load(:invoice)
```

---

### 3. Render

```ruby
output = LmPdf.render(
  template: template,
  data: {
    name: "ACME",
    title: "Factura"
  }
)
```

```ruby
output = LmPdf.load_render(
  :invoice,
  data: {
    name: "ACME",
    title: "Factura"
  }
)
```

---

### 4. Resultado

```html
<h1>ACME</h1><p>Factura</p>
```

---

## API

### Registrar template

```ruby
LmPdf::TemplateLoader.register(name, template)
```

- `name`: Symbol o String
- `template`: String HTML con placeholders `[key]`

---

### Cargar template

```ruby
LmPdf::TemplateLoader.load(name)
```

---

### Renderizar

```ruby
LmPdf.render(template:, data: {})
```

```ruby
LmPdf.render(name, data: {})
```

---

## Reglas

- No ERB
- No Ruby en templates
- Reemplazo literal `[key]`

---

## Ejemplo completo

```ruby
LmPdf::TemplateLoader.register(:test, "<h1>[name]</h1>")

template = LmPdf::TemplateLoader.load(:test)

puts LmPdf.render(
  template: template,
  data: { name: "ACME" }
)
```

---

## Arquitectura

Rails App → TemplateLoader → Renderer → HTML final
