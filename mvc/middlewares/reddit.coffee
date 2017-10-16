request = require 'request-promise'

module.exports.middleware = (ctx, next) ->

  jobs = []
  await request 'http://www.reddit.com/r/forhire/new.json?sort=new&limit=5', (err, res, body) ->
    body = JSON.parse(body);
    jobs.push
      title: body.data.children[0].data.title
      url: body.data.children[0].data.permalink
      source: 'reddit/r/forhire'

  ctx.redditJobs = jobs
  next()
