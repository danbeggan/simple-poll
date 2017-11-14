# Simple Poll

## Setup

Used Rbenv to manage Ruby version - 2.4.2
Used Bundle to manage Rails version - 4.2.10
Used mySql database with no password on local machine

Used Rspec & Capybara for testing '/spec/\*'
```
bundle exec rspec
```

### Gems

**Application**

* Devise - used for user authentication
* Foundation-rails - adds foundation css to
* Cocoon - nested forms, simplifies the process of creating multiple answers for polls in the view.

**Tests:**

* Rspec - testing
* Factory_girl_rails - mocks for models
* Capybara - Feature/Integration testing
* Database_cleaner - cleans test database before tests run
* Faker - generates fake data for models such as names, email addresses

## Approach

**Rails**

I broke down the task in the beginning into stages which I did step by step. These are laid out in PLAN.md, which I followed. If you would like to see the approach I used when designing the models these are in NOTES.md which I did before writing a plan.

**Javascript**

Used jQuery a lot. Worker function polls_show.js makes a json call to polls/show which returns a json representation of a poll and its answers/votes. The data is then sent to the updateResults method which checks through the results div in the page and if any value is different (ie its been updated since the page has been loaded) then the new result is shown in the table instead.

**CSS**

I didn't do any custom css for this task.

## Future

### Features

I didn't implement everything I would have liked to.

The gem friendly_id would have made the urls for polls more readable, ie instead of /polls/2 it would have made the url /polls/who-is-your-favourite-guitar-player. This would have been a nice feature.
Another gem is kaminari which simplifies pagination of results, so on the homepage instead of showing all polls it would show 5 for example and a [next page] button at the bottom.
Pie chars or bar charts of poll results would have been nice to show also. Could have used Chart.js for this.

### Low priority:
Update error names
Add some style, footer
Issue with session cookies if vote has been deleted.. feature?
