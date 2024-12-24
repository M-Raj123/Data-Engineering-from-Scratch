import json
import os
import boto3
from spotipy.oauth2 import SpotifyClientCredentials
import spotipy
from datetime import datetime 

def lambda_handler(event, context):
  client_id = os.environ.get('client_id')
  client_secret = os.getenv('client_secret')
  client_credential_manager =  SpotifyClientCredentials(client_id=client_id, client_secret=client_secret)

  # add layer for spotipy 
  sp = spotipy.Spotify(client_credentials_manager=client_credential_manager) #authorization
    
  playlist_link = "https://open.spotify.com/playlist/0rAdSPycrFdaBXh9xSW3ap?si=5tDWCf4KS9eGfTXGjMvFbQ"
  
  # function expect this code to get the url information 
  playlist_URI = playlist_link.split('/')[-1].split('?')[0]   
  
  data = sp.playlist_tracks(playlist_URI)

  #print(type(data))

  filename = 'spotify_data'+str(datetime.now())+'.json'

  client = boto3.client('s3')
  client.put_object(
      Body=json.dumps(data),
      Bucket='spotify-etl-project-raj-25dec24',
      Key='raw_data/to_processed/'+filename
  )
