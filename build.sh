lessc src/example.less > example/example.css
coffee -o ./example -c src/example.coffee 
coffee -o ./example -c src/codeBrowser.coffee
lessc src/index.less > index.css
coffee -o ./ -c src/index.coffee
./node_modules/.bin/component install
./node_modules/.bin/component build
rsync -r -L build/* ./example
coffee stylehack.coffee
