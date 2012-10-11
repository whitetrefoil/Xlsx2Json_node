#### Public functions

##### convert()
# **input** path string to xlsx file
# **outputPath**_(optional)_ if given, will save output to a file
# **callback** _(optional)_
convert = (input, outputPath, callback) ->
  if typeof outputPath is 'function'
    callback = outputPath
    outputPath = null
    _cleanCacheSync()


# Map public functions
exports[key] = value for key, value of {
  convert: convert
}