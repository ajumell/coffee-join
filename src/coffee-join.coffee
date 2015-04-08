coffeeScript = require("coffee-script")
{print, relative, dirname, read, write, basename} = require("./utils")
{SourceMapConsumer, SourceMapGenerator} = require('source-map')
colors = require("colors")

compile = (code, name = "file.coffee", bare = yes) ->
    ret = coffeeScript.compile code,
        bare: bare
        sourceMap: yes
        filename: name
    return code: ret.js, map: JSON.parse(ret.v3SourceMap)

re_order_source_map = (line_number_mapping, map, out_js_file, out_map_file, code) ->
    rel_map_file = relative(dirname(out_js_file), out_map_file)
    rel_js_file = relative(dirname(out_map_file), out_js_file)

    code += "\n//@ sourceMappingURL=#{rel_map_file}"
    generator = new SourceMapGenerator
        file: rel_js_file

    map = new SourceMapConsumer(map)
    map.eachMapping (mapping) ->
        line = line_number_mapping[mapping.originalLine - 1]
        path = relative(dirname(out_js_file), line.path)
        mapping =
            generated:
                line: mapping.generatedLine
                column: mapping.generatedColumn
            original:
                line: line.line_number
                column: mapping.originalColumn
            source: path
        generator.addMapping(mapping)
    sourceMap = generator.toString()
    return {sourceMap, code}

concat_files = (files) ->
    sourceLines = []
    line_number_mapping = []

    for file in files
        source = read(file)
        lines = source.split("\n")
        file_name = file

        # Line numbers always starts with one
        line_number = 1
        for line in lines
            sourceLines.push(line)
            line_number_mapping.push
                path: file_name
                line_number: line_number
            line_number += 1

    source = sourceLines.join("\n")
    try
        {code, map} = compile(source, "main.coffee", no)
    catch ex
        print "Error occured while compiling coffeescript.".red
        print ex.stack
        process.exit(1)
    return {code, map, line_number_mapping}

process_files = (files, output) ->
    output = basename(output, ".js")
    out_js_file = output + ".js"
    out_map_file = output + ".map"

    {code, map, line_number_mapping} = concat_files(files)
    {sourceMap, code} = re_order_source_map(line_number_mapping, map, out_js_file, out_map_file, code)

    write(out_js_file, code)
    write(out_map_file, sourceMap)

module.exports = {compile, concat_files, re_order_source_map, process_files}