<h1> Sequensio web app 📚</h1>
<br>
Sequensio is a playlist generator app for music enthusiasts who wants to use perfect playlist to match their activities. 
You can easily create a playlist of several sequences according to your own criterias. This app is accesible while connecting to your spotify account so that you can access to your music library to create your playlist in seconds.

This app has been developed during Le Wagon's Bootcamp in two weeks by a team of 4 developers including me. We pitched it during the DemoDay (last day of the bootcamp) in front of external people.

You can open the app in production here: https://www.sequensio.me (Best to see it on an iPhone or with a mobile simulator on a computer as the style for larger screens has not been totally implemented).

Please note that this app is submitted to Spotify dev freemium limitation of restricted user before our project gets further approval. Please contact us if you'd like to be granted access.

Here is a presentation of the app :
<br>
https://user-images.githubusercontent.com/115459416/211087364-140cb020-63bb-420a-a789-23de28894d91.mov


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
<img width="300" alt="Connect to Spotify" src="https://user-images.githubusercontent.com/115459416/211086086-539a8c8d-7cd5-48d0-af8a-fbef340823d1.png">

<h4>Homepage<h4>
<img width="300" alt="Create a Music Session with Sequences" src="https://user-images.githubusercontent.com/115459416/211085698-a6bb0515-dfc3-42c4-9444-209e65e06d1b.png">

<h4>Create a new playlist with Sequences<h4>
<img width="300" alt="Create a Music Session with Sequences" src="https://user-images.githubusercontent.com/115459416/211086160-85e150e1-dd4a-483f-a674-f551265f15f1.png">
  
<h4>Parameter & select songs source from your Spotify account's playlists<h4>  
<img width="300" alt="Select songs source from your Spotify playlists" src="https://user-images.githubusercontent.com/115459416/211087136-f37b5db3-ba66-4d54-95f9-1bd7a1ca4507.png">

<h4>Shuffle tracks or entire sequence and modify tracks order with drag and drop if you want<h4>
<img width="300" alt="Shuffle tracks or entire sequence if you want" src="https://user-images.githubusercontent.com/115459416/211086261-76e3376b-a1db-4ad0-adc6-eabaf90f8206.png">

<h4>Play your Music Session<h4>
<img width="300" alt="Play your Music Session" src="https://user-images.githubusercontent.com/115459416/211086324-8cab9ce2-fa9c-4c54-9420-282ffe827921.png">

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



