Loco Local Vocal Local prototype
===============

Based on Julian Boilen's web-app skeleton. A basic Sinatra app with well organized folders, less-css, and dependency injection.

## Development

### To setup for development
`bundle install`

### To run in devlopment
`./build-scripts/startServer.sh`

### When you add a new javascript file or change their dependencies
Open the `dependencies.rb` file and edit it.
Then run `ruby create-rollups.rb` and restart the server.
Please don't add script tags, those are created automatically. The only exception is external files on a CDN.

When you add LESS files, there must be a javascript file with a matching name, that file must be listed in `dependencies.rb`,
or it must be in a `@import` statement of a LESS file that was included such as `_global.less`.
Again, please don't edit the HTML to include stylesheets, this in done by the dependency manager.

Yes, there is room for improvement to this basic dependency manager I hacked together. In a future update it will parse out required modules in YUI requires statements, removing the need for dependencies.rb.

# Building production files
To run in production run `ruby create-rollups.rb --build` to generate compressed production files. It is *highly* recommended to setup this pre-commit hook which is easy. 

To do so, from the repo root
`cd .git/hooks && ln -s -f ../../build-scripts/hooks/pre-commit pre-commit && cd ../../`