
module.exports = (env, cb) ->

  env.helpers.getPages = (contents, dir) =>
    contents[dir]._.pages
    .filter (item) -> item.metadata.template isnt 'none'
    .sort (a, b) -> a.metadata.title > b.metadata.title
    .map (item) -> title: item.title, url: item.url.replace /^\//, ''

  cb()
