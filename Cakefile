# Refer to:
# 1. https://github.com/twilson63/cakefile-template/blob/master/Cakefile
# 2. https://github.com/jashkenas/docco/blob/master/Cakefile

# Paths
files = [
  'lib',
  'bin',
  'docs'
]

# ANSI Terminal Colors
bold = '\x1b[0;1m'
green = '\x1b[0;32m'
reset = '\x1b[0m'
red = '\x1b[0;31m'

# Requirements
fs = require 'fs'
path = require 'path'
util = require 'util'
{ spawn, exec } = require 'child_process'

# Arguments
option '-w', '--watch', 'continually build'
option '-f', '--force', 'clean all files in output folder whatever they\'re compilation output or anything else'
option '-r', '--rebuild', 'do relative cleaning tasks before build js or generate documents'

# Tasks
task 'build', 'build coffee scripts into js', -> build()
task 'doc', 'generate documents', -> doc()
task 'clean:all', 'clean pervious built js files and documents', -> clean 'all'
task 'clean:js', 'clean pervious built js files', -> clean 'js'
task 'clean:doc', 'clean pervious built documents', -> clean 'doc'
task 'test', 'do test', -> test()

# Functions
build = () ->


doc = () ->


clean = (target = 'all') ->


test = () ->


