const express = require('express');
const app = express();
app.use(express.json());
app.get('/', (req, res) => {
  res.send('Social Media Content Scheduler API');
});
// Add routes for posts, schedules, analytics, etc.
app.listen(3001, () => console.log('API Server running on port 3001'));
