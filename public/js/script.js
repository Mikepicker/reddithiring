fetch('http://www.reddit.com/r/forhire/new.json?sort=new&limit=5')
  .then(function(res) {
    return res.json()
  }).then(function(json) {
    console.log(json);
  });
