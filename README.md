# Stalkme

This is a project built with Elixir that uses Dynamo to serve web requests.

Resources:

* [Elixir website](http://elixir-lang.org/)
* [Elixir getting started guide](http://elixir-lang.org/getting_started/1.html)
* [Elixir docs](http://elixir-lang.org/docs)
* [Dynamo source code](https://github.com/elixir-lang/dynamo)
* [Dynamo guides](https://github.com/elixir-lang/dynamo#learn-more)
* [Dynamo docs](http://elixir-lang.org/docs/dynamo)

Development is being done with Ruby[http://ruby-lang.org/] tools(foreman[http://ddollar.github.io/foreman/] and guard[http://guardgem.org/] primarily).

To run the server in development create a .env file with a DATABASE_URL and SMTP_URL variables and then run:

    foreman start

Asset compiling is only happening from Guard at the moment. From a console run:

    guard

And then modify your assets.  A rake task to compile them will be coming soon.
