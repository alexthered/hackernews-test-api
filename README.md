### Hacker news test project

## Demo

Website: https://hackernews-test-fe.herokuapp.com/

## Documentation

- API docs: https://hackernews-test-api.herokuapp.com/docs
- Hosting: Heroku
- Database: Redis
- Backend: Rails
- Front-end: React & Redux
- CI: Codeship
- Scheduler task: Rake task on Heroku, running every 10 minutes.

## To do & Room for improvement

- Selective fetching of newest 500 stories, as not all stories have changed. We should only
re-fetch the new story in the list of newest 500 stories and the one have been updated (can be determined
by this endpoint: https://hacker-news.firebaseio.com/v0/updates.json).
- Better tests for controller & service for backend
- Better UX for front-end: auto refreshing when there is new data
