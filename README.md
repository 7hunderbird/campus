# Campus [![Build Status](https://travis-ci.org/rubycommcollege/campus.png?branch=master)](https://travis-ci.org/rubycommcollege/campus)

TODO: Add project description

Setup
=====

TODO: Add setup details

Vagrant
-------

The project [campus-vagrant](https://github.com/rubycommcollege/campus-vagrant) is used to create a
virtual machine for campus. Currently it is a work in progress and should not be relied on (yet).

TODO: Add vagrant usage details

Testing
=======

Specs will be created if you use the rails generators:

```shell
bundle exec rails g rspec:model user    #=> creates `spec/models/user_spec.rb`
```

Available generators:

* controller
* helper
* install
* integration
* mailer
* model
* observer
* scaffold
* view

To run all of the specs do either of the following:

```shell
bundle exec rake
bundle exec rake spec
bundle exec rspec
```

This project uses `.rspec` to sets various rspec options. You can customize these options by passing
command line arguments when running your tests.

```shell
bundle exec rspec --format progress
bundle exec rake spec SPEC_OPTS="--format progress"
```

Automated Tests with Guard
--------------------------

Run tests automatically with guard. Guard will listen to changes to your test files and re-run your
tests when you save the file.

```shell
bundle exec guard
```

Preparing the Test Database
---------------------------

Running `rake` or `rake spec` will also run the `db:test:prepare` task for you.  When using guard
you'll have to run the prepare task yourself each time the database migrates.

To make running the task easier you could create an alias:

```
alias migrate='bundle exec rake db:migrate && bundle exec rake
db:test:prepare'
```

Continuous Integration (Travis)
-------------------------------

[![Build Status](https://travis-ci.org/rubycommcollege/campus.png?branch=master)](https://travis-ci.org/rubycommcollege/campus)

We use [Travis](https://travis-ci.org/rubycommcollege/campus) for continuous integration. As a
public member of this project you'll receive notifications about the build status via email. Travis
will also publish notifications to the project Campfire.

Travis is configured to run the build each time code is pushed to the repo. Get in the habit of
running the test suite (`bundle exec rake spec`) **before** pushing your code to make sure your
changes didn't break any tests. If you do break the build just be sure to fix it.

Debugging
=========

To help with debugging the Gemfile includes [Pry](http://pryrepl.org/) and [Awesome
Print](https://github.com/michaeldv/awesome_print).

Sample Data
===========

To run sample data to add courses, just run: bundle exec rake db:load_samples # app rake task to load sample data


