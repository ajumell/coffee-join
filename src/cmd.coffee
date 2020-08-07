optimist = require('optimist')
coffeeJoin = require("./coffee-join")
{write} = require("./utils")


main = () ->
    usage = '''
            Usage: $0 input_file
            '''

    {argv} = optimist
        .usage(usage)

         # require input_file
        .demand([1, 'o'])

        .alias('o', 'output')
        .describe('o', 'Output File path.')


    input_files = argv._

    coffeeJoin.process_files(input_files, argv['o'])

if require.main is module
    main()