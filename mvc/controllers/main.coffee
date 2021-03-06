mongoose = require 'mongoose'

# Import models
Job = require '../models/job.coffee'

module.exports.controller = (router) ->

  # Show jobs
  router.get '/', (ctx) ->
    ctx.render('home', jobs: ctx.redditJobs)

  # Create new job
  router.post '/job', (ctx) ->
    job = new Job
      title: ctx.request.body.title
      url: ctx.request.body.url
      source: ctx.request.body.source
      date: ctx.request.body.date

    await job.save (err) ->
      console.log err if err

    ctx.body = 'Job posted'
