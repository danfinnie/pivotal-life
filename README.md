# Pivotal Life

A dashboard for Pivots at the office.

## Running Locally

To run the status board locally, do the following:

    $ git clone git@github.com:spilth/pivotal-life.git
    $ cd pivotal-life
    $ bundle

Create a `.env` file in the root of the project with the following contents:

    LATITUDE=<your lat>
    LONGITUDE=<your long>
    FORECAST_API_KEY=<your forecast.io api key>
    EVENT_CALENDAR_URL=<your google calendar xml url>
    TWITTER_CONSUMER_KEY=<your twitter consumer key>
    TWITTER_CONSUMER_SECRET=<your twitter consumer secret>
    TWITTER_OAUTH_TOKEN=<your twitter oauth token>
    TWITTER_OAUTH_SECRET=<your twitter oauth secret>

Don't check that file into version control.

Start up Dashing:

    $ dashing start

Then navigate to <http://localhost:3030/pivotal>.

## Running on Heroku

    $ heroku apps:create myapp
    $ heroku config:set LATITUDE=<your lat>
    $ heroku config:set LONGITUDE=<your long>
    $ heroku config:set FORECAST_API_KEY=<your forecast.io api key>
    $ heroku config:set EVENT_CALENDAR_URL=<your google calendar xml url>
    $ heroku config:set TWITTER_CONSUMER_KEY=<your twitter consumer key>
    $ heroku config:set TWITTER_CONSUMER_SECRET=<your twitter consumer secret>
    $ heroku config:set TWITTER_OAUTH_TOKEN=<your twitter oauth token>
    $ heroku config:set TWITTER_OAUTH_SECRET=<your twitter oauth secret>
    $ git push heroku master

Check out http://shopify.github.com/dashing for more information.

## Resources

- [Pivotal Tracker Project](https://www.pivotaltracker.com/s/projects/950406)
- [Dashing](http://shopify.github.com/dashing)


