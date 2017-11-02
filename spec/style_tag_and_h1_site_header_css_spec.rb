RSpec.describe "Styling an <h1> with a <style> tag and Element Selector" do

  it 'includes a <style> tag within the <head> of index.html' do
    html = Nokogiri::HTML(File.read("./index.html")) do |config| 
      config.strict.dtdload.dtdvalid.noblanks
    end

    style_tag = html.search("head style").first

    expect(style_tag).to_not be_nil
  end

  context 'styling the <h1>' do
    it 'includes a rule for h1 using the h1 element selector' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h1_style = css["h1"]

      expect(h1_style).to_not be_nil      
    end

    it 'makes the font-size of <h1> 60px' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h1_style = css["h1"]
      font_size = h1_style["font-size"]

      expect(font_size).to match(/60\s*px/i)
    end
    
    it 'makes the font-weight of <h1> 300' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h1_style = css["h1"]
      font_size = h1_style["font-weight"]

      expect(font_size).to match(/300/i)
    end

    it 'makes the font-family of <h1> Helvetica, Arial, San-Serif' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h1_style = css["h1"]
      font_size = h1_style["font-family"]

      expect(font_size).to match(/Helvetica/i)
      expect(font_size).to match(/Arial/i)
      expect(font_size).to match(/sans-serif/i)
    end
  end

  context 'styling the <h3>' do
    it 'includes a rule for h3 using the h3 element selector' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h3_style = css["h3"]

      expect(h3_style).to_not be_nil      
    end

    it 'makes the font-size of <h3> 28px' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h3_style = css["h3"]
      font_size = h3_style["font-size"]

      expect(font_size).to match(/28\s*px/i)
    end

    it 'has a color of #868e96' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h3_style = css["h3"]
      color = h3_style["color"]

      expect(color).to match(/#868e96/i)
    end

    it 'has a text-decoration of underline' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h3_style = css["h3"]
      text_decoration = h3_style["text-decoration"]

      expect(text_decoration).to match(/underline/i)
    end
    
    it 'has a font-family of Verdana' do
      html = Nokogiri::HTML(File.read("./index.html")) do |config| 
        config.strict.dtdload.dtdvalid.noblanks
      end

      style = html.search("style").text
      parser = CssParser::Parser.new
      parser.load_string!(style)
      css = parser.to_h["all"]

      h3_style = css["h3"]
      font_family = h3_style["font-family"]

      expect(font_family).to match(/Verdana/i)
    end
  end
end