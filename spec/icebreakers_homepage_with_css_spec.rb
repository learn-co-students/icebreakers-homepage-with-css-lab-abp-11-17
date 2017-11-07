RSpec.describe "A Styled IceBreakers Homepage" do
  it 'uses an external stylesheet via a <link> with rel and href attributes' do
    html = load_html("./index.html")

    link_tag = html.search("head link").first

    expect(link_tag).to_not be_nil
    expect(link_tag.attr("rel")).to eq("stylesheet")
    expect(link_tag.attr("href")).to eq("style.css")
  end

  context 'General' do
    it 'has a global selector to set font-family of "Helvetica", "Arial", "sans-serif"' do
      css = parse_css_from_file("./style.css")
      global = css["*"]

      expect(global).to_not be_nil

      expect(global["font-family"]).to match(/Helvetica/i)
      expect(global["font-family"]).to match(/Arial/i)
      expect(global["font-family"]).to match(/sans-serif/i)
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

      if nav_ul["margin"]
        expect(nav_ul["margin"]).to match(/0\s?10\s?px/i)
      else
        expect(nav_ul["margin-right"]).to match(/10\s?px/i)
      end
    end

    it 'styles the navigation links with a nested selector of "nav a"' do
      css = parse_css_from_file("./style.css")
      nav_a = css["nav a"]

      expect(nav_a).to_not be_nil

      expect(nav_a["text-decoration"]).to match(/none/i)
      expect(nav_a["color"]).to match(/#007bff/i)
      expect(nav_a["font-size"]).to match(/18\s?px/i)
    end

    it 'adds a :hover pseudo selector for navigation links with "nav a:hover"' do
      css = parse_css_from_file("./style.css")
      nav_a_hover = css["nav a:hover"]

      expect(nav_a_hover).to_not be_nil

      expect(nav_a_hover["text-decoration"]).to match(/underline/i)
      expect(nav_a_hover["color"]).to match(/#0056b3/)
    end
  end

  context 'Header' do
    it 'floats the h3 with id of header to the left with a compound element and id selector of h3#header' do
      css = parse_css_from_file("./style.css")
      h3_header = css["h3#header"]

      expect(h3_header).to_not be_nil

      expect(h3_header["float"]).to match(/left/i)
    end

    it 'makes the font-size of h3 with id of header 30px with a compound element and id selector of h3#header' do
      css = parse_css_from_file("./style.css")
      h3_header = css["h3#header"]

      expect(h3_header).to_not be_nil

      expect(h3_header["font-size"]).to match(/30\s?px/i)
    end

    it 'styles the link in the header with a nested selected of #header a' do
      css = parse_css_from_file("./style.css")
      header_a = css["#header a"]

      expect(header_a).to_not be_nil

      expect(header_a["text-decoration"]).to match(/none/i)
      expect(header_a["color"]).to match(/#868e96/i)
    end

    it 'adds a pseudo selector for hover with an underline via #header a:hover' do
      css = parse_css_from_file("./style.css")
      header_a = css["#header a:hover"]

      expect(header_a).to_not be_nil

      expect(header_a["text-decoration"]).to match(/underline/i)
    end
  end

  context 'Main' do
    it 'has a top margin of 20px via an element selector of "main"' do
      css = parse_css_from_file("./style.css")
      main = css["main"]

      expect(main).to_not be_nil

      if main["margin"]
        expect(main["margin"]).to match(/^20px/i)
      else
        expect(main["margin-top"]).to match(/20px/i)
      end
    end
  end

  context 'Jumbotron' do
    it 'creates a rounded border of 5px with an element class selector of div.jumbotron' do
      css = parse_css_from_file("./style.css")
      div_jumbotron = css["div.jumbotron"]

      expect(div_jumbotron).to_not be_nil

      expect(div_jumbotron["border-radius"]).to match(/5px/i)
    end

    it 'adds a background color of #e9ecef, a 10px padding, and centers the text via an element class selector of div.jumbotron' do
      css = parse_css_from_file("./style.css")
      div_jumbotron = css["div.jumbotron"]

      expect(div_jumbotron).to_not be_nil

      expect(div_jumbotron["background-color"]).to match(/#e9ecef/i)
      expect(div_jumbotron["padding"]).to match(/10px/i)
      expect(div_jumbotron["text-align"]).to match(/center/i)
    end

    it 'makes the font-size of the h1 in a jumbotron 60px via a nested class element selector of ".jumbotron h1"' do
      css = parse_css_from_file("./style.css")
      jumbotron_h1 = css[".jumbotron h1"]

      expect(jumbotron_h1).to_not be_nil

      expect(jumbotron_h1["font-size"]).to match(/60\s?px/i)
    end

    it 'styles paragraphs in a jumbotron with a font of 20px, a 40px left right padding, and a line height of 40px via a nested class element selector of ".jumbotron p"' do
      css = parse_css_from_file("./style.css")
      jumbotron_p = css[".jumbotron p"]

      expect(jumbotron_p).to_not be_nil

      expect(jumbotron_p["font-size"]).to match(/20\s?px/i)
      expect(jumbotron_p["padding"]).to match(/0\s?40px\s?0\s?40px/i)
      expect(jumbotron_p["line-height"]).to match(/40\s?px/i)
    end
  end

  context 'Questions' do
    it 'pads the questions div with 20px left and right via an element class selector of "div.questions"' do
      css = parse_css_from_file("./style.css")
      div_questions = css["div.questions"]

      expect(div_questions).to_not be_nil

      if div_questions["padding"]
        expect(div_questions["padding"]).to match(/0\s?20px\s?0\s?20px/i)
      else
        expect(div_questions["padding-top"]).to match(/0/i)
        expect(div_questions["padding-left"]).to match(/20px/i)
        expect(div_questions["padding-right"]).to match(/20px/i)
        expect(div_questions["padding-bottom"]).to match(/0/i)
      end
    end

    it 'styles h4 in div.questions with a font-size of 30px and bottom margin of 10px via a nested selector of "div.questions h4"' do
      css = parse_css_from_file("./style.css")
      div_questions_h4 = css["div.questions h4"]

      expect(div_questions_h4).to_not be_nil

      expect(div_questions_h4["font-size"]).to match(/30\s?px/i)
      expect(div_questions_h4["margin-bottom"]).to match(/10\s?px/i)
    end

    it 'gives paragraphs in div.questions a top margin of 30px via a "div.questions p" selector' do
      css = parse_css_from_file("./style.css")
      div_questions_p = css["div.questions p"]

      expect(div_questions_p).to_not be_nil

      expect(div_questions_p["margin-top"]).to match(/30\s?px/i)
    end

    it 'makes links with class btn into blue button pills "div.questions a.btn"' do
      css = parse_css_from_file("./style.css")
      a_btn = css["div.questions a.btn"]

      expect(a_btn).to_not be_nil

      expect(a_btn["border-radius"]).to match(/5\s?px/i)
      expect(a_btn["color"]).to match(/#FFF/i)
      expect(a_btn["background-color"]).to match(/#007bff/i)
      expect(a_btn["border-color"]).to match(/#007bff/i)
      expect(a_btn["text-decoration"]).to match(/none/i)
      expect(a_btn["padding"]).to match(/18\s?px/i)
      expect(a_btn["font-size"]).to match(/20\s?px/i)
    end

    it 'gives links with class btn into blue button pills with a hover state via "div.questions a.btn:hover"' do
      css = parse_css_from_file("./style.css")
      a_btn = css["div.questions a.btn:hover"]

      expect(a_btn).to_not be_nil

      expect(a_btn["background-color"]).to match(/#0069d9/i)
      expect(a_btn["border-color"]).to match(/#0069d9/i)
    end
  end

  context 'Footer' do
    it 'styles the footer with a top border, a top margin, a top padding, and a #CCC color via element selector of "footer"' do
      css = parse_css_from_file("./style.css")
      footer = css["footer"]

      expect(footer).to_not be_nil

      expect(footer["border-top"]).to match(/1px/i)
      expect(footer["margin-top"]).to match(/80px/i)
      expect(footer["padding-top"]).to match(/20px/i)
      expect(footer["color"]).to match(/#ccc/i)
    end
  end
end
