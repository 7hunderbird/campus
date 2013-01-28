# Campus [![Build Status](https://travis-ci.org/rubycommcollege/campus.png?branch=master)](https://travis-ci.org/rubycommcollege/campus)

TODO: Add project description

Setup
=====

Application Config
------------------

To get started with Campus you'll need to set the applcation configs and setup your database.yml
file. Run the following commands to copy the appropiate files:

```shell
cp config/examples/application.yml config
cp config/examples/database.yml.sqlite config/database.yml
```

If your environment is development then the default `application.yml` configs will work for you. If you
need to run in another environment, be sure to edit the file and set the values.

Vagrant
-------

The project [campus-vagrant](https://github.com/rubycommcollege/campus-vagrant) is used to create a
virtual machine for campus. Currently it is a work in progress and should not be relied on (yet).

TODO: Add vagrant usage details

Testing
=======

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

Email
-----

To test emails while in development visit
[http://localhost:3000/letter_opener](http://localhost:3000/letter_opener/). This will show you sent
emails using the Rails engine [letter_opener](https://github.com/fgrehm/letter_opener_web).


Sample Data
===========

To run sample data to add courses, just run: bundle exec rake db:load_samples # app rake task to load sample data


