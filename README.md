# Icebreakers Homepage with Style

## Objectives

1. Style the Icebreaker Homepage

## Instructions

For this lab you will be combining all the knowledge you've learned of HTML and CSS to create a styled homepage of our Icebreaker application. By the end of this lab your homepage should look like:

![IMG](https://cl.ly/nV16/Image%202017-11-03%20at%202.18.47%20PM.png)

You must use the selectors specified below to style the elements however it is entirely possible to achieve the same results using different selectors. You are free to do so, the test suite will not pass, but all that matters is that your site looks right.

## Previewing in the Browser

As you add the styles to `style.css`, you should check your work visually by looking at `index.html` in the browser. When working on this lab in the Learn IDE, type `nohup httpserver &` in your IDE terminal. You will get an IP Address that you can open in your browser to see your site. You can learn more about this at the [Help Center](http://help.learn.co/the-learn-ide/common-ide-questions/viewing-html-pages-in-the-learn-ide).

## Style Requirements

This lab requires you to use specific selectors in your CSS to style the HTML.

### General

#### `*`

Use a global selector to set the font of the page to `"Helvetica", "Arial", "san-serif"`


#### `body`

Use a `body` selector to add a `30px` padding to the left and right of the site.

### Navigation

#### `header`

Use a `header` selector to set the height of the header to `100px` and give it a solid bottom border of `1px` of color `#CCC`.

#### `header nav`

Float the `header nav` to the right using a `header nav` selector.

#### `nav ul`

Reset the padding of the `nav ul` to `0` and set the top margin to `40px` with a `0` margin for everything else.

#### `nav ul li`

`li`s in the navigation should have a display of `inline` so they are side by side and a right margin of `10px`.

#### `nav a`

Make the links in the navigation have [no underline](https://www.w3schools.com/cssref/pr_text_text-decoration.asp) a color of `#007bff` and a font size of `18px`.

#### `nav a:hover`

Give the nav links a hover state with a text decoration of an underline and a color of `#0056b3`.

#### `h3#header`

Float the `h3` with an `id` of `header` to the left and make its font size `30px`.

#### `#header a`

Remove the underline from the link in the element with an `id` of `header` and make its color `#868e96`.

#### `#header a:hover`

Make the link in the `#header` have an underline on hover.

### `main`

Use the element selector for `main` to give the `main` element a top marign of `20px`.

### The Jumbotron

A "jumbotron" is a big marketing callout you often see on web pages. Follow the styles below to make yours.

#### `div.jumbotron`

Style the `div` with the `class` of `jumbotron` to have a [round border](https://www.w3schools.com/cssref/css3_pr_border-radius.asp) of `5px`, a background color of `#e9ecef`, a padding of `10px` and [align the text](https://www.w3schools.com/cssref/pr_text_text-align.asp) to the center.

#### `.jumbotron h1`

Make the font size of the `h1` in the `.jumbotron` `60px`.

#### `.jumbotron p`

Paragraphs in the `.jumbotron` should have a font size of `20px`, a `0` top and bottom padding, a `40px` left and right padding, and a [`line-height`](https://www.w3schools.com/cssref/pr_dim_line-height.asp) of `40px`.

### Questions

Style your questions to include a link that looks like a button (called a ["pill"](https://getbootstrap.com/docs/4.0/components/buttons/#button-tags)).

#### `div.questions`

Make the `div` with the `class` `questions` have a `0` top and bottom padding and a `20px` left and right padding.

#### `div.questions h4`

Make the `h4` that contains the question content within the `div.questions` have a font size of `30px` and a `10px` bottom margin.

#### `div.questions p`

Make the `p` contained within `div.questions` have a top margin of `30px`.

#### `div.questions a.btn`

`a` tags with a `class` of `btn` within the `div.questions` should have a `5px` rounded border, `#FFF` white text color, a background and border color of `#007bff`, no underline, an `18px` padding, and a `20px` font size.

#### `div.questions a.btn:hover`

On hover, our pill buttons should change background and border color to `#0069d9`.

### `footer`

Make the footer of the site have a `1px` `solid` `#CCC` top border, an `80px` top margin, a `20px` top padding, and a color of `#CCC`.

## Congratulations!!!

Once all these styles are applied to `style.css` you should have a beautiful homepage for your future Icebreakers application. The tests are pretty specific so if you don't use the exact selectors or styles as mentioned above, they might fail. That's okay, as long as you're happy with how the site looks. You are going to have many opportunities to update the styles and make the site pretty - so have fun, change some settings, experiment with the wonderful world of CSS.
