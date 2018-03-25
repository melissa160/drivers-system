# To start your Phoenix app:

  * Start up the web service through the docker-compose `docker-compose up -d web`
  * let’s install the project dependencies: `docker-compose run web mix deps.get`
  * compile: `docker-compose run web mix deps.compile`
  * create the database: `docker-compose run web mix ecto.create`
  * migrate the database: `docker-compose run web mix ecto.migrate`
  * restart the server: `docker-compose restart web`
  * and run the application:`docker-compose run web`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

