<h1> Sequensio web app 📚</h1>
<br>
Sequensio is a playlist generator app for music enthusiasts who wants to use perfect playlist to match their activities. 
You can easily create a playlist of several sequences according to your own criterias. This app is accesible while connecting to your spotify account so that you can access to your music library to create your playlist in seconds.

This app has been developed during Le Wagon's Bootcamp in two weeks by a team of 4 developers including me. We pitched it during the DemoDay (last day of the bootcamp) in front of external people.

You can open the app in production here: https://www.sequensio.me (Best to see it on an iPhone or with a mobile simulator on a computer as the style for larger screens has not been totally implemented).

Please note that this app is submitted to Spotify dev freemium limitation of restricted user before our project gets further approval. Please contact us if you'd like to be granted access.

Here is a presentation of the app :

<h2> Main Features </h2>
<br>
<ul>
  <li>OmniAuth with Spotify</li>
  <li>Select songs source from users'Spotify playlists both public and private (with Spotify dev API)</li>
  <li>Display songs details and image (with Spotify dev API)</li>
  <li>Drag and drop animation with Javascript</li>
  <li>Display final playlist with songs ready to push play (with Spotify dev API)</li>
</ul>

<h2> Screenshots </h2>
<br>
<h4>Connect to Spotify<h4>
<img width="300" alt="Connect to Spotify" src="https://user-images.githubusercontent.com/104831958/210985771-4f261a6f-d24e-4f2b-b544-d3ff596c6d62.png">

<h4>Create a Music Session with Sequences<h4>
<img width="300" alt="Create a Music Session with Sequences" src="https://user-images.githubusercontent.com/104831958/210985988-ea57cb31-3117-42c7-aae3-cbb3dffe01c6.png">

<h4>Shuffle tracks or entire sequence if you want<h4>
<img width="300" alt="Shuffle tracks or entire sequence if you want" src="https://user-images.githubusercontent.com/104831958/210986174-4d8ba167-0b63-465a-8bb0-bc9e9b464fb4.png">

<h4>Play your Music Session<h4>
<img width="300" alt="Play your Music Session" src="https://user-images.githubusercontent.com/104831958/210986380-ba6b7a6b-5fd5-4feb-8a9b-db30a3da7cff.png">
  
<h2> Getting starting in local </h2>
  
<h3>Setup</h3> 

Install gems 
<br>
<code>bundle install</code>
  
Install JS packages
<br>
<code>yarn install</code>
  
<h3>ENV Variables</h3>

Create .env file
<br>
  
<code>touch .env</code>

<br>
Inside .env, set these variables whith the CREDENTIAL PRODUCTION :
<br>
  <code>CLIENT ID=your_own_spotify_dev_key</code>
<br> 
  <code>CLIENT SECRET=your_own_spotify_dev_client_secret_key</code>
  
<h3>DB Setup</h3>
<br>
<code>rails db:create</code>
<code>rails db:migrate</code>
<code>rails db:seed</code>
<br>
<h3>Run a server with javascript</h3>

<code>dev</code>

  <h2> Techno & Tools </h2>
  
<ul>
  <li>Rails 7 - Backend / Front-end</li>
  <li>Stimulus JS - Front-end JS</li>
  <li>Heroku - Deployment</li>
  <li>PostgreSQL - Database</li>
  <li>Bootstrap — Styling</li>
  <li>Figma — Prototyping</li>
  <li>Git & GitHub - Versioning</li>
</ul>

  <h2> Team members </h2>
  
<ul>
  <li>Aude Cateland</li>
  <li>Mathieu Chirac</li>
  <li>Nicolas Monmarqué</li>
  <li>Pierre Untas</li>
</ul>



