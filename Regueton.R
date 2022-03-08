library(spotifyr)
library(dplyr)
library(tidyverse)
library(ggjoy)


# ----- Tokens para la aplicación de Spotify -----


Sys.setenv(SPOTIFY_CLIENT_ID = "ad7e096efa13499dbf3fdf6e052b3048")
Sys.setenv(SPOTIFY_CLIENT_SECRET = "1a2f57a5bfa84c0aa903554b384e142f")

access_token <- get_spotify_access_token()
beatles <- get_artist_audio_features('the beatles')

joy %>% 
  arrange(-valence) %>% 
  select(track_name, valence) %>% 
  head(5) %>% 
  kable()


ggplot(joy, aes(x = valence, y = album_name)) + 
  geom_joy() + 
  theme_joy() +
  ggtitle("Joyplot of Joy Division's joy distributions", subtitle = "Based on valence pulled from Spotify's Web API with spotifyr")