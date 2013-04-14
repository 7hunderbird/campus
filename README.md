# Campus [![Build Status](https://travis-ci.org/rubycommcollege/campus.png?branch=master)](https://travis-ci.org/rubycommcollege/campus)

Ruby Community College is where you come to learn to be a better ruby developer.  It unifies all the great ruby training that exists on the web on such websites like Railscasts, Peepcode, Blogs, eBooks, etc into one application to help the developer concetrate on becoming the best developer they can.

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

Foreman
-------

You can use foreman to run all your services for this project while in development. Copy the example
Procfile and run.

```shell
cp config/examples/Procfile.dev .
bundle exec foreman start -f Procfile.dev
```

Search
------

For Mac users, it's quickest to use Homebrew and follow the instructions:

```shell
$ brew install elasticsearch
```

In order to install elasticsearch on ubuntu you need to have Java installed.  This github script automates this process:

https://github.com/flexiondotorg/oab-java6

```shell
cd ~/
wget https://github.com/flexiondotorg/oab-java6/raw/0.2.7/oab-java.sh -O oab-java.sh
chmod +x oab-java.sh
sudo ./oab-java.sh
sudo apt-get install sun-java6-jre -y
```

This downloads the source to he current folder and allows you to run the elasticsearch daemon from this current folder.

```shell
$ curl -k -L -o elasticsearch-0.20.5.tar.gz http://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.20.5.tar.gz
$ tar -zxvf elasticsearch-0.20.5.tar.gz
$ ./elasticsearch-0.20.5/bin/elasticsearch -f
```

Finally, if the search doesn't seem to return values, you may need to index by running `rake db:seed` to cause the indexes to fire.  If you don't have any courses, enter some or use the Sample Data command below to add some.

Sample Data
-----------

To run sample data to add courses, just run: `bundle exec rake db:load_samples` # app rake task to load sample data

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

Email
-----

To test emails while in development visit
[http://localhost:3000/letter_opener](http://localhost:3000/letter_opener/). This will show you sent
emails using the Rails engine [letter_opener](https://github.com/fgrehm/letter_opener_web).




