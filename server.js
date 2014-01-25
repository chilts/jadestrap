// ----------------------------------------------------------------------------
//
// License: MIT. Copyright 2014 Andrew Chilton. All Rights Reserved.
//
// ----------------------------------------------------------------------------

// core
var fs = require('fs');
var http = require('http');
var url = require('url');

// npm
var jade = require('jade');
var st = require('st');

// ----------------------------------------------------------------------------

var valid = {
    '/bootstrap-v3.0.3/starter-template/' : true,
    '/bootstrap-v3.0.3/navbar/'           : true,
};
var jadeOpts = {
    pretty : true,
};
var mount = st(__dirname + '/htdocs');

var server = http.createServer();
server.on('request', function(req, res) {
    req.url = url.parse(req.url);

    if ( req.url.path === '/' ) {
        res.setHeader('content-type', 'text/html');
        res.end(fs.readFileSync(__dirname + '/htdocs/index.html', 'utf8'));
        return;
    }

    if ( req.url.path in valid ) {
        var html = jade.renderFile(
            __dirname + '/jade' + req.url.path + 'index.jade',
            {
                pretty : true,
            }
        );
        res.setHeader('content-type', 'text/html');
        res.end(html);
        return;
    }

    // otherwise, try to send it statically (404 if not there)
    mount(req, res);
});

var port = process.env.PORT || 3000;
server.listen(port, function() {
    console.log('Server listening on port ' + port);
});

// ----------------------------------------------------------------------------
