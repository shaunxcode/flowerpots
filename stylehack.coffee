fs = require "fs"

fs.writeFileSync "./example/build.css", (fs.readFileSync("./example/build.css", "utf8").replace /\"\/tim/g, "\"./tim")
