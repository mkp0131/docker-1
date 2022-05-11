import express from 'express';

const app = express();

app.get('/', (req, res) => {
  res.send('🐳 This is Docker!');
});

app.listen(8080, () => {
  console.log('🤖 server start');
});
