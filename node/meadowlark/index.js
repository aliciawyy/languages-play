const express = require('express');
const path = require('path');
const app = express();

const fortunes = [
  "Conquer your fears or they will conquer you.",
  "Rivers need springs.",
  "Do not fear what you don't know.",
  "You will have a pleasant surprise.",
  "Whenever possible, keep it simple.",
];

/* HTML templating framework */
const handlebars = require('express3-handlebars').create(
  { defaultLayout: 'main' }
);
app.engine('handlebars', handlebars.engine);
app.set('views', path.join(__dirname, 'views/layouts/'));
app.set('view engine', 'handlebars');

app.use(express.static(__dirname + '/public'));

app.set('port', process.env.PORT || 3000);

app.get('/', (req, res) => {
  res.render('main');
});

app.get('/about', (req, res) => {
  let fortuneIndex = Math.floor(Math.random()) * fortunes.length;
  res.render('about', { fortune: fortunes[fortuneIndex] });
});

app.use((req, res) => {
  res.status(404);
  res.render('404');
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500);
  res.render('500');
});

app.listen(app.get('port'), () => {
  console.log('Express started at localhost:' + app.get('port'));
});
