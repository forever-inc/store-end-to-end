# Getting Started

Make sure you have QT 5.0+ installed and linked to qmake.
```
brew install qt5
brew link --force qt5
bundle
```

## Tests

Run `rspec`.  Currently the tests are not consistent because of server response times, so run it a couple times if it fails.

## Rspec

Learn expect DSL from https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers.

## Capybara

Learn the DSL from https://github.com/jnicklas/capybara.

## Debugging

Try `save_and_open_page` or `save_and_open_screenshot` (Capybara helpers) in your scenaraios.
