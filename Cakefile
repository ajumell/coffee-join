{exec} = require "child_process"
fs = require "fs"

build = () ->
    exec 'coffee --compile --output lib/ src/', (err, stdout, stderr) ->
        throw err if err
        console.log stdout + stderr

        main_file = "lib/cmd.js"
        fs.readFile main_file, "utf8", (err, data) ->
            throw err if err
            data = "#!/usr/bin/env node\n" + data
            fs.writeFile main_file, data, (err) ->
                throw err if err
                exec "chmod +x #{main_file}", (err, stdout, stderr) ->
                    throw err if err
                    console.log stdout + stderr
task 'build', 'Build project from src/*.coffee to lib/*.js', ->
    build()

task "publish", "Publish to npm", ->
    build()
    exec "npm publish"