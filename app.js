'use strict';

const express = require('express');
const app = express();

const PORT = process.env.PORT || 8080;

app.set('views', 'views');
app.set('view engine', 'pug');

app.get('/', (req, res) => {
  res.render('index', {
    title: 'My Web App',
    message: 'This is a simple web app running on Node.js.'
  });
});

app.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});

module.exports = app;