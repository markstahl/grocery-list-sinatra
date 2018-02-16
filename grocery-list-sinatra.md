### Instructions

Write a web application to manage a grocery list. It should display the groceries currently on the list and provide a form for adding a new item to buy.

### Getting Set Up

* Run `et get grocery-list-sinatra`
* Install the necessary dependencies by running `bundle install` at the command line.

### Meeting Expectations Requirements

Acceptance tests have been written for you to build this grocery list app. **These tests are not to be modified.** Run the test suite with `rspec` and let the test errors guide your development and code implementation. Your first submission should satisfy the following requirements:

* Visiting `GET /` should redirect the user to `GET /grocery-list`.
* Visiting `GET /grocery-list` should display a list of groceries to purchase as well as a form for adding a new grocery item.
* The name of each grocery item must be in [an `<li>` element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/li).
* The form to add a new grocery item requires the grocery name to be specified.
* The list of groceries is read from the `grocery_list.csv` file which stores each item on a new line.
* The form submits to `POST /grocery-list` which saves the new item to the `grocery_list.csv` file.
* Submitting an empty form does not modify the `grocery_list.csv` file.
* All acceptance tests pass.

### Learning Goals

* Generate a dynamic web page in response to a `GET` request.
* Persist information from a user submitted via a `POST` request.
* Implement code based on acceptance tests.

### Sample Output

Below is an example of what the application should look like:

![Grocery List][sample-app]

### Tips

* To avoid losing past information you'll probably want to **append** to a file rather than overwrite. You can open a file for appending and write a new line to it with the following snippet of code (the second argument, `"a"`, passed to the `CSV`'s `open` method, specifies that you want to append information):

```ruby
CSV.open("some-file.csv", "a") do |f|
  f.puts(["blah"])
end
```
* If Capybara can't find a field, double-check that the `for` attribute in the `label` element matches the `id` attribute of the `input` element.

```ruby
<label for="these_should_match">Text of label</label>
<input id="these_should_match" />
```
* Reminder: When `rspec` is run, everything in the CSV file (except the headers) is deleted. This happens both before any of the tests run **and** after every `it` and `scenario` blocks in the test suite.

### Exceeding Expectations Requirements

* Write Acceptance Tests for each of the following scenarios and implement the features they describe.
* Add `quantity` as an optional field to the grocery item form. Submitting a form with both a name and a quantity should add the grocery item to the list  The quantity of each item should not be displayed on the list.
* If the form is submitted with only a quantity, and no grocery item, it should not be added to the grocery list. Instead, the page should be re-rendered with the previously submitted quantity pre-filled in the form.
* When viewing this list after visiting `GET /grocery-list` each grocery item should be a link.  This link should lead to a page that displays the individual grocery name and quantity (if quantity was specified).

[sample-app]: https://s3.amazonaws.com/horizon-production/images/grocery-list.png
