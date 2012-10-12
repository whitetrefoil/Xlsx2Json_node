#### Include test framework

chai = require 'chai'
expect = chai.expect
chai.should()

#### Pre-define file paths

libPath = 'src/xlsx2json.coffee'
requirePath = 'src/xlsx2json'
inputPath = 'test/input.xlsx'
outputPath = 'sheet1.xml'
referPath = 'test/ref_sheet1.xml'

path = require 'path'
os = require 'os'
libPath = path.join __dirname, '..', libPath
requirePath = path.join __dirname, '..', requirePath
inputPath = path.join __dirname, '..', inputPath
outputPath = path.join os.tmpDir(), 'xlsx2json', 'xl/worksheets', outputPath
referPath = path.join __dirname, '..', referPath

#### Test

describe 'Using the lib,', ->
  describe 'the cache file', ->
    it 'should be able to removed', ->

  describe 'the Excel file', ->
    it 'should be extract as a zip file', ->



describe 'The lib file', ->
  it 'should be existed', ->
    fs = require 'fs'
    fs.existsSync(libPath).should.be.true
  it 'should be successfully required', (done) ->
    try
      require libPath
    finally
      done()

describe 'cleanCache()', ->
  it 'should be a function', ->
    xlsx2json = require libPath
    (typeof xlsx2json.cleanCache).should.be.equal ''
  it 'should work', ->


describe 'extract()', ->
  it 'should be a function', ->
    xlsx2json = require libPath
    (typeof xlsx2json.extract).should.be.equal ''

