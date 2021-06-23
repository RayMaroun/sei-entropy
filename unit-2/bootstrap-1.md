# Bootstrap

## Bootstrap and the Asset Pipeline

### What are the objectives?

_You will be able to:_

* Implement class-based CSS
* Use a CDN to import Bootstrap into your project
* Effectively use a grid system to space elements across your page
* Improve the design of your HTML pages with the aid of Bootstrap & mockups

### Where should we be now?

_You should already be able to:_

* Write custom HTML & CSS
* Include external stylesheets

### What is Class-based CSS?

Create modular classes that _encapsulate_ a certain behavior and name them semantically.

**Note:** Semantic naming is describing but not specifying the content it encloses.

How would you style CSS for these elements?

* `.shout`  

  Hint make all of the characters uppercase in the element's text

* `.shadow` 

  Hint add a drop-shadow to text inside the element

* `.invert` 

  Hint flip an element upside-down

Example solution 

```markup
.shout {
	text-transform: uppercase;
}

.shadow {
	text-shadow: 1px 1px 2px black;
}

.invert {
	transform: rotate(180deg);
}
```

### What is Responsive Design?

"Responsive web design \(RWD\) is an approach to web design aimed at crafting sites to provide an optimal viewing and interaction experience— easy reading and navigation with a minimum of resizing, panning, and scrolling—across a wide range of devices \(from desktop computer monitors to laptops to cellphones\).

A site designed with RWD adapts the layout to the viewing environment by using fluid, proportion-based grids, flexible images, etc..."

Source: [Wikipedia](https://en.wikipedia.org/wiki/Responsive_web_design)

![image](https://cloud.githubusercontent.com/assets/6520345/20849406/63b6290e-b88b-11e6-91d6-ab998c89a87d.png)

&lt;/br&gt;

### Questions

* What's the difference between a framework and a library?

### CSS Frameworks

A framework is a standardized set of **concepts, practices and criteria** for dealing with a common type of problem.

In the world of web design, to give a more straightforward definition, a framework is defined as **a package made up of a structure of files and folders of standardized code \(HTML, CSS, JS documents etc.\) which can be used to support the development of websites**, as a basis to start building a site.

Most websites share a very similar \(not to say identical\) structure. The aim of frameworks is to provide a common structure so that developers don’t have to redo it from scratch and can reuse the code provided. In this way, frameworks allow us to cut out much of the work and save a lot of time.

To summarize: **there’s no need to reinvent the wheel.**

### Example Frameworks & Libraries

* [Foundation](http://foundation.zurb.com/) - another CSS-library, similar to Bootstrap
* [Bulma](https://bulma.io/) - Bulma is a free, open source CSS framework based on Flexbox.
* [Materlize](https://materializecss.com/) - A modern responsive front-end framework based on Google's Material Design.
* [Skeleton](http://getskeleton.com/) - a lovely, minimal, unopinionated CSS library
* [Animate.css](https://daneden.github.io/animate.css/) - animate.css is a bunch of cool, fun, and cross-browser animations for you to use in your projects.
* [NES.css](https://nostalgic-css.github.io/NES.css/) - NES.css is a NES-style \(8bit-like\) CSS Framework.
* [Paper css](https://www.getpapercss.com/) -  A CSS Library with a paper style.



### Intro to Bootstrap

![bootstrap example](https://upload.wikimedia.org/wikipedia/commons/thumb/6/66/Twitter_Bootstrap_Under_Firefox_32.png/1200px-Twitter_Bootstrap_Under_Firefox_32.png)

* [Bootstrap](http://getbootstrap.com/) is a **CSS framework** created by a small team of developers at Twitter and maintained by a much larger community of contributors.
* The framework consists of one main CSS file, an optional theme CSS file, and a main JS file.
* Parts of Bootstrap require [jQuery](https://code.jquery.com/) to work.
* To apply bootstrap styles, you just add classes to your HTML elements. The Bootstrap CSS files style these classes in complex ways.
* It has excellent documentation!

Bootstrap comes with a ton of features, including:

* [Responsive Grid System](https://getbootstrap.com/docs/4.0/examples/grid/)
* CSS library for quick and easy styling
* UI components - HTML + CSS
  * buttons
  * forms
  * etc.
* Javascript widgets to make your page interactive \(e.g. a nav bar\)
* Icons
* & more!

### Notable Sites Using Bootstrap

* [NBA.com](http://www.nba.com/)
* [Bloomberg](http://www.bloomberg.com/)
* [CodeAcademy](https://www.codecademy.com/)

### Including Bootstrap with HTML

* To use Bootstrap, we need to include Bootstrap's CSS and Javascript libraries \(or an optional Bootstrap-Theme CSS file\).
* We also need to include jQuery, as Bootstrap's JS plug-ins depend on it.  
* There are a few different ways to accomplish this, listed below. In this class, we'll keep it simple and stick with the CDN.
* CDN \(Content Delivery Network - someone else hosts the library/framework and you access it via a URL\): [http://getbootstrap.com/getting-started/\#download-cdn](http://getbootstrap.com/getting-started/#download-cdn). Where do we include these in our HTML file?
* Download the actual CSS and JS files and link to them on your local computer - better for offline/local development.

Sample code \`\`\`htmlHello, world!

## Hello, world!

 \`\`\`

### Responsive Grid System

**Page layout using the Grid System**

![grid](https://raw.githubusercontent.com/sf-wdi-26/modules/master/w02/d03/m3-bootstrap/imgs/grid.png)

**Note:** There's an error in the image above. Can you find it? Maybe after you have a bit more background on the 12 column layout system.

Bootstrap's grid system is based on the idea that a page layout for any given screen size is represented with 12 fluid **columns**. Columns are always horizontally contained in **rows**, which in turn are contained inside of a larger `container` \(container &gt; row &gt; column\). But why 12?

**12 is the best number**

12 is divisible by 2, 3, 4, and 6 \(meaning we can have columns that are: half-width, third-width, quarter-width, and sixth-width aka 50%, ~33.3%, 25%, and ~16.7%\):

```text
12/2  = 6
12/3  = 4
12/4  = 3
12/6  = 2
12/12 = 1

6 + 6 = 12
4 + 4 + 4 = 12
3 + 3 + 3 + 3 = 12
2 + 2 + 2 + 2 + 2 + 2 = 12
1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 + 1 = 12
```

We can also create the typical two column layout \(main content area + sidebar\):

```text
8 + 4 = 12
9 + 3 = 12
```

**Start with a container**

To ensure all your Bootstrap styles behave properly, always put your content inside an element with a class "container" \(usually `<div class="container">`\). This will center your content and leave a small margin on the sides of the page. If you would like to use the full width of the screen \(no margin\) use `class="container-fluid"`

**Add a row**

To use the grid system we must put a row in our container:

```markup
   <div class="row"> ... </div>
```

**Specify your columns**

* Columns are written in the following format as a class: `col-(breakpoint)-(width)`
* For example: `col-sm-4`

  Then select what screen size we'll want it to display on:

  * `col-` &lt; 768px \(e.g. smartphones\)
  * `col-sm-` ≥ 992px \(e.g. tablets\)
  * `col-md-` ≥ 1200px \(e.g. laptops, desktops\)
  * `col-lg-` ≥ 1200px \(e.g. large desktops, smart TVs\)

* At screen sizes smaller than the specified screen sizes, the columns will default to filling the width of the screen.
* Pick a fraction of `12` that will determine how much of the row it will take up.
* You then use the above choices to determine the exact class you will add to an element in the row \(bootstrap has them all built in\).

For example the class: `col-lg-3` will take up `3/12` of the space at `1200px`. Feel free to add more classes to the same element to change how it will behave at other screen sizes. Let's checkout some more examples...

Here's an example of a two-column layout that spans the width of the page. Notice that the widths of the two columns add up to 12. The column content of any row must always be ≤12.

```markup
 <div class="row">
   <div class="col-md-6">
     <p>I'm a medium-sized column</p>
    </div>
   <div class="col-md-6">
     <p>Me too! We have SO much in common</p>
   </div>
 </div>
```

What will this code do?

```markup
 <div class="row">
   <div class="col-sm-12 col-md-6">
     <p>I take up the entire space when the screen is small, but share it when there's more room.</p>
    </div>
   <div class="col-sm-12 col-md-6">
     <p>Samesies...</p>
   </div>
 </div>
```

#### Challenge: Grid it!

1. How much of the page would elements with these classes take up?
   * `col-md-2`
   * `col-sm-1`
   * `col-lg-8`
   * `col-12`
2. Using the bootstrap grid, make a grid that is 3 Columns on Tablet \(sm\), Laptop \(md\), and Desktop \(lg\), 1 Column on Mobile\(xs\).

Sample code

```markup
<div class="row">
  <h3 class='text-center'>3 Columns on Tablet, Laptop, and Desktop, 1 Column on Mobile</h3>
  <div class="col-sm-4 col-12">Yao</div>
  <div class="col-sm-4 col-12">Hey</div>
  <div class="col-sm-4 col-12">Ola</div>
</div>
```

**For other examples, check out the** [**Bootstrap docs**](http://getbootstrap.com/css/#grid)**.**

### Offsets & Nesting

You can also offset and nest your columns. When you offset a column, you add a column of whitespace and push the column to the right. Example:

```markup
 <div class="row">
   <div class="col-md-3 offset-md-3">
     <p>This column occupies 1/4 of the page width and is moved to the right by 1/4 of the page width</p>
   </div>
 </div>
```

Here is an example of nesting columns \(putting one row inside another\):

```markup
 <div class="row">
   <div class="col-md-6">
     Level 1: Column takes 1/2 the width of the page
     <div class="row">
       <div class="col-md-4">
         Level 2: This column takes 1/3 the width of its parent column
       </div>
       <div class="col-md-8">
         Level 2: This column takes 2/3 the width of its parent column
       </div>
     </div>
   </div>
 </div>
```

### Typography

For a complete list: [Bootstrap Typography classes](http://getbootstrap.com/css/#type)

To align text, use these classes.

```markup
 <p class="text-left">Left aligned text.</p>
 <p class="text-center">Center aligned text.</p>
 <p class="text-right">Right aligned text.</p>
 <p class="text-justify">Justified text.</p>
 <p class="text-nowrap">No wrap text.</p>
```

More useful typography classes...

```markup
 <p class="lead">This text will stand out in a paragraph</p>
 <small>This line of text is meant to be treated as fine print.</small>
 <p class="text-lowercase">Lowercased text.</p>
 <p class="text-uppercase">Uppercased text.</p>
 <p class="text-capitalize">Capitalized text.</p>
```

**Icons**

Bootstrap recommends several external icon libraries that can be included in your page. Check out those options [here](https://getbootstrap.com/docs/4.0/extend/icons/)

**Buttons**

Bootstrap provides a wide selection of button sizes and colors. Button classes can be applied not just to `<button>` elements, but also `<a>` and `<input>` elements

Sometimes you need to provide multiple classes to an element in order for Bootstrap to style it. The button classes are an example of this:

```markup
 <!-- Standard button -->
 <button type="button" class="btn btn-default">Default</button>

 <!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
 <button type="button" class="btn btn-primary">Primary</button>

 <!-- Contextual button for informational alert messages -->
 <button type="button" class="btn btn-info">Info</button>

 <!-- Indicates caution should be taken with this action -->
 <button type="button" class="btn btn-warning">Warning</button>
```

... and so on. See the [docs](http://getbootstrap.com/css/#buttons) for a comprehensive list of options. Note you can add a third class denoting size to any of the above: `.btn-lg`, `.btn-sm`, `.btn-xs`

#### Images

Bootstrap helps you format images using `class="img-rounded"` \(rounds the corners\), `class="img-circle"` \(makes the image a circle\) and `class="img-thumbnail"` \(adds a border\). You can also add a `class="img-responsive"` to your image to make it scale well when the screen size changes \(this sets its max-width to 100% of its parent element and the height to auto for maintaining aspect\)

#### Forms

Bootstrap is also very helpful when you need to style your forms. All textual `<input>`, `<textarea>`, and `<select>` elements with `class="form-control"` are set to width: 100% by default. Wrap labels and their associated controls \(inputs\) in `class="form-group"` for optimum spacing.

#### Javascript plug-ins

Bootstrap allows you to incorporate interactive behavior into your page with Javascript plug-ins. While you would ultimately have to write some JS in order for these components to provide actual functionality within the application, you don't have to write JS if you're simply mocking up a UI.

Some examples:

* [Responsive Nav bars](http://getbootstrap.com/components/#navbar)
* [Dropdowns](http://getbootstrap.com/javascript/#dropdowns)
* [Popovers](http://getbootstrap.com/javascript/#popovers)
* [Modals](http://getbootstrap.com/javascript/#modals)
* [Carousels](http://getbootstrap.com/javascript/#carousel)

### Question

* Give an example of a situation in which you might want to use Bootstrap \(or any other Framework/Library\), versus one in which you might not.

### React-Bootstrap

React-Bootstrap is a complete re-implementation of the Bootstrap components using React.

#### Installation

[How to use Bootstrap with React](https://www.techomoro.com/how-to-use-bootstrap-with-react/)

### Closing Thoughts

Bootstrap demonstrates good practices in terms of exemplifying class-based CSS and introducing the concept of a grid-system. It is useful for most projects where style is somewhat important but not the central to the product.

Be aware that critical users of the web know what bootstrap looks like; it’s all over the place! If you’re making a serious project or portfolio work, add some of your own stylings to stand out!

### Independent Study

1. [Materialize](https://materializecss.com/getting-started.html), [Bootswatch](https://bootswatch.com/)
2. Modals
3. Popovers, Dropdowns
4. Carousels
5. Responsive Nav Bars
6. Forms
7. Card
8. Progress Bar, Tooltip

### Homework

Bootstrapify \(or [Foundation](http://foundation.zurb.com)-ify or [Materialize](http://materializecss.com)-ify or [Picnic](http://picniccss.com)-ify or [Pure](http://purecss.io/)-ify or…\) something that you built earlier in the course.

​  


### Helpful References

* [Bootstrap Customize](http://getbootstrap.com/customize/)
* [Bootstrap Sass](https://github.com/twbs/bootstrap-sass)
* [Tutorials Point Bootstrap](http://www.tutorialspoint.com/bootstrap/)
* [Bootsnipp](http://bootsnipp.com/)
* [12 Time Saving Bootstrap Examples](http://tutorialzine.com/2015/06/12-time-saving-bootstrap-examples/)
* [Built with Bootstrap](http://builtwithbootstrap.com/)
* [Bootstrapbay](https://bootstrapbay.com/blog/built-with-bootstrap/)

### Additional Resources

* [Block Element Modifier methodology](http://getbem.com/introduction/)
* [Hipster Ipsum](http://hipsum.co/) - Dummy placeholder "hipster" text
* [Semantic Class Names](https://css-tricks.com/semantic-class-names/)

