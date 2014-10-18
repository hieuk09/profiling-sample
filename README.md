== README

PROFILING SAMPLE
=======
A sample project to demo several ways to profile a rails application
SLIDE: [http://slides.com/hieunguyen/profiling-ruby/](http://slides.com/hieunguyen/profiling-ruby#/)

SETUP
======

Follow the list of command below:

```shell
cp config/database.yml.example config/database.yml
cp config/newrelic.yml.example config/newrelic.yml
bundle install
rake db:migrate
```

RUN
=====

[Ruby-prof](github.com/ruby-prof/ruby-prof)
---

```shell
rake profiling:rubyprof:all
```

[Stack-prof](github.com/tmm1/stackprof)
---

```shell
rake profiling:stackprof:all
```

[Benchmark](www.ruby-doc.org/stdlib-2.0/libdoc/benchmark/rdoc/Benchmark.html)
---

```shell
rake profiling:benchmark:all
```

Rails Instrumential
---

Goto [localhost:3000/books](localhost:3000/books).
Then goto [localhost:3000/page_requests](localhost:3000/page_requests).
You should be able to see the request and the time which needed to complete that request.
You can try adding parameter `speed` to books page with 2 options: `slow` or `fast` and see the different.

NewRelic
---
You can request the books page, then goto [new relic page](localhost:3000/newrelic) and see the information there.

