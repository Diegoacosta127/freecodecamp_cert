# Build a Product Landing Page

Objective: Build an app that is functionally similar to [https://product-landing-page.freecodecamp.rocks](https://product-landing-page.freecodecamp.rocks). **Do not copy this demo project.**

## User Stories:

1.    Your product landing page should have a `header` element with a corresponding `id="header"`
2.    You can see an image within the `header` element with a corresponding `id="header-img"` (A logo would make a good image here)
3.    Within the `#header` element, you can see a nav element with a corresponding `id="nav-bar"`
4.    You can see at least three clickable elements inside the `nav` element, each with the class `nav-link`
5.    When you click a `.nav-link` button in the `nav` element, you are taken to the corresponding section of the landing page
6.    You can watch an embedded product video with `id="video"`
7.    Your landing page has a `form` element with a corresponding `id="form"`
8.    Within the form, there is an `input` field with `id="email"` where you can enter an email address
9.    The `#email` input field should have placeholder text to let users know what the field is for
10.    The `#email` input field uses HTML5 validation to confirm that the entered text is an email address
11.    Within the form, there is a submit `input` with a corresponding `id="submit"`
12.    When you click the `#submit` element, the email is submitted to a static page (use this mock URL: `https://www.freecodecamp.com/email-submit`)
13.    The navbar should always be at the top of the viewport
14.    Your product landing page should have at least one media query
15.    Your product landing page should utilize CSS flexbox at least once

Fulfill the user stories and pass all the tests below to complete this project. Give it your own personal style. Happy Coding!

**Note:** Be sure to add `<link rel="stylesheet" href="styles.css">` in your HTML to link your stylesheet and apply your CSS

## Tests

- [✔] You should have a `header` element with an `id` of `header`.
- [✔] You should have an `img` element with an `id` of `header-img`.
- [✔] Your `#header-img` should be a descendant of the `#header`.
- [✔] Your `#header-img` should have a `src` attribute.
- [✔] Your `#header-img`’s `src` value should be a valid URL (starts with `http`).
- [✔] You should have a `nav` element with an `id` of `nav-bar`.
- [✔] Your `#nav-bar` should be a descendant of the `#header`.
- [✔] You should have at least 3 `.nav-link` elements within the `#nav-bar`.
- [✔] Each `.nav-link` element should have an `href` attribute.
- [✔] Each `.nav-link` element should link to a corresponding element on the landing page (has an `href` with a value of another element's id. e.g. `#footer`).
- [✔] You should have a `video` or `iframe` element with an `id` of `video`.
- [✔] Your `#video` should have a `src` attribute.
- [✔] You should have a `form` element with an `id` of `form`.
- [✔] You should have an `input` element with an `id` of `email`.
- [✔] Your `#email` should be a descendant of the `#form`.
- [✔] Your `#email` should have the `placeholder` attribute with placeholder text.
- [✔] Your `#email` should use HTML5 validation by setting its `type` to `email`.
- [✔] You should have an `input` element with an `id` of `submit`.
- [✔] Your `#submit` should be a descendant of the `#form`.
- [✔] Your `#submit` should have a `type` of `submit`.
- [✔] Your `#form` should have an `action` attribute of `https://www.freecodecamp.com/email-submit`.
- [✔] Your `#email` should have a `name` attribute of `email`.
- [✔] Your `#nav-bar` should always be at the top of the viewport.
- [✔] Your Product Landing Page should use at least one media query.
- [✔] Your Product Landing Page should use CSS Flexbox at least once.
