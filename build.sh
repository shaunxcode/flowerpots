lessc src/example.less > example/example.css
coffee -o ./example -c src/example.coffee 
lessc src/index.less > index.css
coffee -o ./ -c src/index.coffee
component install
component build
