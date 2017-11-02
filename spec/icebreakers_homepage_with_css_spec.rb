RSpec.describe "A Styled IceBreakers Homepage" do
  it 'uses an external stylesheet via a <link> with rel and href attributes' do
    html = load_html("./index.html")

    link_tag = html.search("head link").first
    
    expect(link_tag).to_not be_nil
    expect(link_tag.attr("rel")).to eq("stylesheet")
    expect(link_tag.attr("href")).to eq("style.css")
  end

  context 'General' do
    it 'has a global selector to set font-family of "Helvetica", "Arial", "san-serif"' do
      css = parse_css_from_file("./style.css")
      global = css["*"]

      expect(global).to_not be_nil
      
      expect(global["font-family"]).to match(/Helvetica/i)
      expect(global["font-family"]).to match(/Arial/i)
      expect(global["font-family"]).to match(/san-serif/i)
    end

    it 'has a body selector to make the left and right padding of the page 30px' do
      css = parse_css_from_file("./style.css")
      body = css["body"]

      expect(body).to_not be_nil

      if body["padding"]
        expect(body["padding"]).to match(/0\s?30\s?px/i)
      else
        expect(body["padding-left"]).to match(/30\s?px/i)
        expect(body["padding-right"]).to match(/30\s?px/i)
      end
    end
  end

  context 'Navigation' do
    it 'sets the header to a height of 100px' do
      css = parse_css_from_file("./style.css")
      header = css["header"]

      expect(header).to_not be_nil
      
      expect(header["height"]).to match(/100\s?px/i)
    end

    it 'sets the bottom-border to 1px solid #cccccc' do
      css = parse_css_from_file("./style.css")
      header = css["header"]

      expect(header).to_not be_nil
      
      expect(header["border-bottom"]).to match(/1px\s?solid\s?#ccc/i)
    end

    it 'floats the nav to the right with a nested selector of "header nav"' do
      css = parse_css_from_file("./style.css")
      header_nav = css["header nav"]

      expect(header_nav).to_not be_nil
      
      expect(header_nav["float"]).to match(/right/i)
    end    

    it 'removes the padding from the nav ul with a nested selector of "nav ul"' do
      css = parse_css_from_file("./style.css")
      nav_ul = css["nav ul"]

      expect(nav_ul).to_not be_nil
      
      expect(nav_ul["padding"]).to match(/0/i)
    end    

    it 'resets the margin for the nav ul to a 40px top margin with a nested selector of "nav ul"' do
      css = parse_css_from_file("./style.css")
      nav_ul = css["nav ul"]

      expect(nav_ul).to_not be_nil
      
      if nav_ul["margin"]
        expect(nav_ul["margin"]).to match(/40px\s?0\s?0\s?0\s?/i)
      else
        expect(nav_ul["margin-top"]).to match(/40px/i)
        expect(nav_ul["margin-left"]).to match(/0/i)
        expect(nav_ul["margin-right"]).to match(/0/i)
        expect(nav_ul["margin-bottom"]).to match(/0/i)
      end
    end

    it 'resets the margin for the nav ul to a 40px top margin with a nested selector of "nav ul"' do
      css = parse_css_from_file("./style.css")
      nav_ul = css["nav ul"]

      expect(nav_ul).to_not be_nil
      
      if nav_ul["margin"]
        expect(nav_ul["margin"]).to match(/40px\s?0\s?0\s?0\s?/i)
      else
        expect(nav_ul["margin-top"]).to match(/40px/i)
        expect(nav_ul["margin-left"]).to match(/0/i)
        expect(nav_ul["margin-right"]).to match(/0/i)
        expect(nav_ul["margin-bottom"]).to match(/0/i)
      end
    end

    it 'sets the display of a navigation li to inline with a nested selector of "nav ul li"' do
      css = parse_css_from_file("./style.css")
      nav_ul = css["nav ul li"]

      expect(nav_ul).to_not be_nil
      

      expect(nav_ul["display"]).to eq("inline")
    end

     it "adds a 10px margin to the right of a nav li with a nested selector of 'nav ul li'" do
      css = parse_css_from_file("./style.css")
      nav_ul = css["nav ul li"]

      expect(nav_ul).to_not be_nil
      # This should also account for short hand syntax
      expect(nav_ul["margin-right"]).to match(/10\s?px/)
    end    
  end

  # it 'includes a <style> tag within the <head> of index.html' do
  #   html = load_html("./index.html")

  #   style_tag = html.search("head style").first

  #   expect(style_tag).to_not be_nil
  # end

  # context 'styling the <h1>' do
  #   it 'includes a rule for h1 using the h1 element selector' do
  #     html = load_html("./index.html")

      

  #     h1_style = css["h1"]

  #     expect(h1_style).to_not be_nil      
  #   end

  #   it 'makes the font-size of <h1> 60px' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h1_style = css["h1"]
  #     font_size = h1_style["font-size"]

  #     expect(font_size).to match(/60\s*px/i)
  #   end
    
  #   it 'makes the font-weight of <h1> 300' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h1_style = css["h1"]
  #     font_size = h1_style["font-weight"]

  #     expect(font_size).to match(/300/i)
  #   end

  #   it 'makes the font-family of <h1> Helvetica, Arial, San-Serif' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h1_style = css["h1"]
  #     font_size = h1_style["font-family"]

  #     expect(font_size).to match(/Helvetica/i)
  #     expect(font_size).to match(/Arial/i)
  #     expect(font_size).to match(/sans-serif/i)
  #   end
  # end

  # context 'styling the <h3>' do
  #   it 'includes a rule for h3 using the h3 element selector' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h3_style = css["h3"]

  #     expect(h3_style).to_not be_nil      
  #   end

  #   it 'makes the font-size of <h3> 28px' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h3_style = css["h3"]
  #     font_size = h3_style["font-size"]

  #     expect(font_size).to match(/28\s*px/i)
  #   end

  #   it 'has a color of #868e96' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h3_style = css["h3"]
  #     color = h3_style["color"]

  #     expect(color).to match(/#868e96/i)
  #   end

  #   it 'has a text-decoration of underline' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h3_style = css["h3"]
  #     text_decoration = h3_style["text-decoration"]

  #     expect(text_decoration).to match(/underline/i)
  #   end
    
  #   it 'has a font-family of Verdana' do
  #     html = Nokogiri::HTML(File.read("./index.html")) do |config| 
  #       config.strict.dtdload.dtdvalid.noblanks
  #     end

  #     style = html.search("style").text
  #     parser = CssParser::Parser.new
  #     parser.load_string!(style)
  #     css = parser.to_h["all"]

  #     h3_style = css["h3"]
  #     font_family = h3_style["font-family"]

  #     expect(font_family).to match(/Verdana/i)
  #   end
  # end
end