# Refer:
# 1. https://github.com/twilson63/cakefile-template/blob/master/Cakefile
# 2. https://github.com/jashkenas/docco/blob/master/Cakefile

# Paths
files = [
  'lib',
  'bin',
  'docs',
  'src'
]

jsInput = 'src'
jsOutput = 'lib'
docOutput = 'docs'
path = 'path'

# ANSI Terminal Colors
bright = '\x1b[0;1m'
green = '\x1b[0;1;32m'
reset = '\x1b[0m'
red = '\x1b[0;1;31m'

# Requirements
fs = require 'fs'
path = require 'path'
util = require 'util'
{spawn, exec} = require 'child_process'

try
  which = require('which').sync
catch err
  if process.platform.match(/^win/)?
    console.log 'WARNING: the which module is required for windows\ntry: npm install which'
  which = null

# Arguments
option '-w', '--watch', 'continually build'
option '-f', '--force', 'clean all files in output folder whatever they\'re compilation output or anything else'
option '-r', '--rebuild', 'do relative cleaning tasks before build js or generate documents'

# Tasks
task 'build', 'build coffee scripts into js', (options) -> build(options)
task 'doc', 'generate documents', (options) -> doc(options)
task 'clean:all', 'clean pervious built js files and documents', -> clean 'all'
task 'clean:js', 'clean pervious built js files', -> clean 'js'
task 'clean:doc', 'clean pervious built documents', -> clean 'doc'
task 'test', 'do test', -> test()

# Task Functions
build = (options) ->
  clean 'js' if options.rebuild
  try
    coffeePath = which 'coffee'
  catch e
    error 'cannot find executable `coffee`'
    return
  coffee = spawn coffeePath, ['-c' + (if options.watch then 'w' else ''), '-o', jsOutput, jsInput]
  coffee.stdout.on 'data', (data) -> puts data
  coffee.stderr.on 'data', (data) -> error data
  coffee.on 'close', -> success 'building finished'

doc = (options) ->
  clean 'doc' if options.rebuild
  try
    doccoPath = which 'docco'
  catch e
    error 'cannot fild executable `docco`'
    return
  docco = spawn doccoPath, ['-o', docOutput, path.normalize(jsInput.concat('/*.coffee'))]
  docco.stdout.on 'data', (data) -> puts data
  docco.stderr.on 'data', (data) -> error data
  docco.on 'close', -> success 'building finished'

clean = (target = 'all') ->


test = () ->


# Helper Functions
puts = (data) ->
  _output data, bright

error = (data) ->
  _output data, red, 'ERR'

success = (data) ->
  _output data, green, 'SCC'

fail = (data) ->
  _output data, red, 'FAIL'

pass = (data) ->
  _output data, green, 'PASS'

_output = (data, color, prefix) ->
  data = data.toString().trim() unless typeof data is 'string'
  util.print color
  if prefix?
    util.print "#{prefix}: "
    util.print bright
  util.puts data
  util.print reset
