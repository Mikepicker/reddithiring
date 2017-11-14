request = require 'request-promise'

formatDate = (utc) ->
    d = new Date(utc*1000);
    return (d.getMonth() + 1) + '/' + d.getDate() + '/' + d.getFullYear()

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
          date: formatDate(post.data.created_utc) 

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
          date: formatDate(post.data.created_utc) 

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
          date: formatDate(post.data.created_utc) 

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
          date: formatDate(post.data.created_utc) 

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
          date: formatDate(post.data.created_utc) 

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()

  Jobbit: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/jobbit/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/jobbit'
          date: formatDate(post.data.created_utc) 

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()

  DesignJobs: (ctx, next) ->
    jobs = []
    await request 'http://www.reddit.com/r/designjobs/search/.json?q=(title:"[hiring]"+OR+flair:Hiring)&sort=new&restrict_sr=on&t=month', (err, res, body) ->
      body = JSON.parse(body);
      for post in body.data.children
        jobs.push
          title: post.data.title
          url: 'https://reddit.com/' + post.data.permalink
          source: 'reddit/r/designjobs'
          date: formatDate(post.data.created_utc) 

    ctx.redditJobs = ctx.redditJobs.concat jobs
    next()

