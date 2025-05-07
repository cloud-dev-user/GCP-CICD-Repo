const express = require('express');
const app = express();
const crash = process.env.CRASH === 'true';

app.get('/', (req, res) => {
  if (crash) {
    res.status(500).send('App failed!');
  } else {
    res.send('App is healthy!');
  }
});

const port = process.env.PORT || 8080;
app.listen(port, () => console.log(`App listening on port ${port}`));
