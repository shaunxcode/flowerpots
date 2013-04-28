lessc src/example.less > example/example.css
coffee -o ./example -c src/example.coffee 
coffee -o ./example -c src/codeBrowser.coffee
lessc src/index.less > index.css
coffee -o ./ -c src/index.coffee
component install
component build
rsync -r -L build/* ./example

