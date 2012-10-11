#### Include test framework

chai = require 'chai'
expect = chai.expect
chai.should()

#### Pre-define file paths

binPath = 'bin/xlsx2json'
libPath = 'lib/xlsx2json'
inputPath = 'test/input.xlsx'
outputPath = 'test/output.json'
referPath = 'test/refer.json'

path = require 'path'
binPath = path.join __dirname, '..', binPath
libPath = path.join __dirname, '..', libPath
inputPath = path.join __dirname, '..', inputPath
outputPath = path.join __dirname, '..', outputPath
referPath = path.join __dirname, '..', referPath

# Use Xlsx2Json as a executable binary
# -----
#
#### Helper functions

_generateJsonFile = (callback) ->
  {spawn} = require 'child_process'
  bin = spawn binPath, inputPath, outputPath
  bin.on 'exit', -> callback?()

_removeOutputJsonFile = (callback) ->
  fs = require 'fs'
  fs.exists outputPath, (isExisted) ->
    if isExisted then fs.unlinkSync outputPath
    callback?()

_loadOutputJsonFile = (callback) ->
  oJson = require outputPath
  callback?()

#### Test cases

describe 'As Binary:', ->
  fs = require 'fs'

  describe 'The executable binary file', ->
    it 'should exist', (done) ->
      fs.exists binPath, (isExisted) ->
        throw "Binary file (#{binPath}) not found" unless isExisted
        done()

  describe 'The JSON file', ->
    describe 'converted from Excel file', ->
      it 'should be converted successfully', (done) ->
        _removeOutputJsonFile -> _generateJsonFile -> done()

      it 'should be existed after running', (done) ->
        fs.exists outputPath, (isExisted) ->
          throw "Output file (#{outputPath}) not found" unless isExisted
          done()

      it 'should has same data as reference JSON file', ->
        oJson = require outputPath
        rJson = require referPath
        oJson.should.be.deep.equal rJson

# Use Xlsx2Json as a library
# -----
#
#### Test cases

describe 'As Library:', ->
  fs = require 'fs'

  describe 'The library file', ->
    it 'should exist', (done) ->
      try
        require libPath
      catch e
        throw "Library file (#{libPath}) not found"
      finally
        done()

  describe 'The function', ->
    it 'should be accessible', ->
      xlsx2json = require libPath
      (typeof xlsx2json.convert).should.be.equal 'function'

  describe 'When convert to memory,', ->
    describe 'the json object', ->
      it 'should be converted successfully', ->
        xlsx2json = require libPath
        oJson = xlsx2json.convert inputPath
        if typeof oJson isnt 'object' then throw 'Output data is NOT a object'

      it 'should be same as what loads from JSON file', ->
        xlsx2json = require libPath
        oJson = xlsx2json.convert inputPath
        rJson = require referPath
        oJson.should.be.deep.equal rJson
