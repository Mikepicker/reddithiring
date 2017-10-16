request = require 'request-promise'

module.exports.middlewares =

  # Reddit
  forhire: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/forhire/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=day', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/forhire'

    ctx.redditJobs = jobs
    next()

  Jobs4Bitcoins: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/Jobs4Bitcoins/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/Jobs4Bitcoins'

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()

  Jobs4Crypto: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/Jobs4Crypto/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/Jobs4Crypto'

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()


  BitcoinJobs: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/BitcoinJobs/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/BitcoinJobs'

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()

  ProgrammingRequests: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/ProgrammingRequests/search/.json?q=(title:"[request]")&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/ProgrammingRequests'

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()
