fs = require("fs")
path = require("path")

read = (file) ->
    fs.readFileSync(file, 'utf8')

write = (file, contents) ->
    fs.writeFile(file, contents)

abspath = (file) ->
    path.resolve(file)

exists = (file) ->
    fs.existsSync(file)

ext = (file) ->
    path.extname(file)

join = path.join

dirname = path.dirname

relative = path.relative

print = console.log

basename = path.basename

module.exports = {read, write, exists, abspath, ext, join, dirname, relative, print, basename}