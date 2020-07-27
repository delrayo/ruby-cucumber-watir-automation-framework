Ruby automation framework web applications
==================================

This framework is a barebones quickstarter for any ruby automation projects you need.  it comes out of the box and ready to go with some powerful features.
Note:  As you are probably already aware, ruby gems/dependencies can be quite annoying in terms of versions so if you end up running into issues you may need to use
particular versions of some gems, at the moment however (14/12/2017) everything here works as expected.  I've noticed Ruby-cucumber reporting is really poor visually, allure-Rspec is maybe ok but the plugins don't function on cucumber > 2.0.0 so I plan to build a nice looking html report in 2018.

Attributions:
[BuryTheHammer](http://www.burythehammer.com/) => Used his capybara quickstarter framework as a base for this and in general a very helpful guy

Framework features
------------
- Sequential and Parallel execution using rake tasks
- Browserstack integration for all your cloud/config needs
- Data aliasation with persistence across the steps
- Page object design pattern, coupled with PageFactory to load all pages into the (World)
- Cucumber Gherkin syntax for english readable feature files
- It's ruby so.. an abundance of effecient DSLs (e.g Watir)
- Driver and environment configuration
- Selenium grid support for local distribution across nodes (e.g docker-selenium / docker-zalenium)
- Json to HTML reporting, personally it's pretty ugly but its the best available at this moment


Dependencies
------------
- [Ruby](https://www.ruby-lang.org/en/documentation/installation/) (preferably [with RVM](https://rvm.io/))
- [Ruby bundler gem](http://bundler.io/) || `gem install bundle`
- [Firefox](https://www.mozilla.org/en-US/firefox/new/) (optional)
- [Chromedriver](http://chromedriver.storage.googleapis.com/index.html) (optional)
- [SeleniumGrid](http://www.seleniumhq.org/projects/grid/) (again optional, useful to distribute tests to the hub for node selection)
- [Zalenium-docker](https://github.com/zalando/zalenium) (optional - a cool scalable solution to a grid setup with VNC viewer, browser control panel etc)


The Stack
---------

- [Ruby](https://www.ruby-lang.org/en/) - Simple programming language => [Rubymonk](https://www.rubymonk.com) is great for cross training
- [Rake](http://rake.rubyforge.org/) - Ruby build utility
- [Cucumber](https://cucumber.io/) - English written tests in a BDD fashion
- [Watir](http://watir.com/) - Selenium webdriver wrapper with simple DSL
- [BrowserStack](https://www.browserstack.com/) - Platform as a service based cross browser/OS test execution.
- [RSpec Expectations](https://github.com/rspec/rspec-expectations) - Assert the expected results with a powerful DSL
- [Parallel_Tests](https://github.com/grosser/parallel_tests) - A gem for parallel threading of cucumber tests.
- [Factory Girl](https://github.com/thoughtbot/factory_girl) - A data template factory for producing test data.
- [FFaker](https://github.com/ffaker/ffaker) - A random data generation library.
- [Slack-Results](https://github.com/symonk/ruby-automation-slack)- A small gem I wrote to send automation results into a slack group, read the instructions there
- [I18n-Localisation](https://github.com/svenfuchs/i18n) - Set expectations based on YAML files to account for testing of multilingual applications
- [Logger](https://ruby-doc.org/stdlib-2.4.0/libdoc/logger/rdoc/Logger.html) - Basic logging of scenarios, each in their own json file when executing in parallel
- [Report-builder](https://github.com/rajatthareja/ReportBuilder) - Automatically combining json results and dumping a html report in your directory

Installing and using
--------------------
From the command line:

1. Clone the project: `git clone https://github.com/symonk/Ruby-gui-framework-by-simonkay`
2. Add chromedriver/geckodriver executables to PATH environment variables.
3. Navigate to the folder and `bundle install` to install all necessary gems.
4. Execute testing using rake tasks
5. If you want to execute on selenium grid, use the rake task(s) and make sure the GRID hub + nodes are accessible
6. Various other rake tasks exist that you could put in a jenkins pipeline to generate json results, convert them into a html frontend and then attach it to jenkins as artifacts

Available Rake Tasks
--------------------

`rake` default => runs a cucumber sequential session of @regression tests
`rake parallel` runs a cucumber parallel session of @regression tests

To specify your browser, use the following (hopefully self-explanatory) tasks:

- `rake smoke` => runs a sequential session of smoke tests
- `rake smoke-p` => runs a parallel session of smoke tests
- `rake-browserstack` => runs tests on browserstack (requires some configuration of env vars)

The environment and driver functionality can be customised via the environment variables, you can manually set these in the project base directory `./.env`
- RUN_ON_LOCAL => if true => run tests on the local machine else => look for grid to distribute too
- SELENIUM_BROWSER => Browser to run tests on, chrome/firefox etc (this is used in both local and grid setup)
- SELENIUM_GRID_URL => Grid url to use when RUN_ON_LOCAL != true
- APPLICATION_NAME => Used to input into logging / sysout(puts) and reporting
- APPLICATION_BASEURL => Base url used for the application, still to build this into page objects page_urls

Browserstack Configuration
--------------------------
Browserstack is available via `rake browserstack`. You will need to set up your environment variables via the .env file first, to specify your login credentials and required browser/OS. To use this as part of a secure CI environment, Browserstack have an excellent guide on [their website](https://www.browserstack.com/automate/continuous-integration) to keep your credentials secure.
