coffeeJoin = require("../lib/coffee-join")

main = () ->
    files = [
        "src/Common.coffee"
        "src/Obj.coffee"
        "src/Person.coffee"
        "src/Employee.coffee"
        "src/main.coffee"
    ]

    output = "main.js"

    coffeeJoin.process(files, output)

if require.main is module
    main()