// Generated by CoffeeScript 1.6.1
(function() {
  var abspath, basename, dirname, exists, ext, fs, join, path, print, read, relative, write;

  fs = require("fs");

  path = require("path");

  read = function(file) {
    return fs.readFileSync(file, 'utf8');
  };

  write = function(file, contents) {
    return fs.writeFile(file, contents);
  };

  abspath = function(file) {
    return path.resolve(file);
  };

  exists = function(file) {
    return fs.existsSync(file);
  };

  ext = function(file) {
    return path.extname(file);
  };

  join = path.join;

  dirname = path.dirname;

  relative = path.relative;

  print = console.log;

  basename = path.basename;

  module.exports = {
    read: read,
    write: write,
    exists: exists,
    abspath: abspath,
    ext: ext,
    join: join,
    dirname: dirname,
    relative: relative,
    print: print,
    basename: basename
  };

}).call(this);