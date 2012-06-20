helpers do
  def get_fonts
    fonts = File.join("config", "fonts.yml")
    YAML.load(File.read(fonts))["fonts"]
  end

  def get_font_url(font_code)
    get_fonts.each do |f|
      return f["url"] if f["code"] == font_code
    end
    nil
  end
  
  def get_pdf(params)
    font_url = get_font_url(params[:font])
    return nil if font_url.nil?
    text = params[:text]

    pdf = Prawn::Document.new
    pdf.font font_url
    pdf.text text
    pdf
  end

  def get_file_name
    "text2pdf-#{Time.now.strftime('%Y%m%d-%H%M%S')}.pdf"
  end
end
