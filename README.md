# I wrote this workflow to display observations of waterfowl collected with a Survey123 app.  

## Survey123  

The excel file `Duck Survey.xlsx` contains the necessary data to create the survey in Survey123 Connect. You will need to supply your own waterfowl images in the survey files. Import the excel file into survey123 Connect and publish the survey to your ArcGIS portal.  

## Downloading survey data  

This project uses the Python GIS API to pull data from my ArcGIS Online portal. The python script is called `download_waterfowl.py`. The username and password have been replaced with placeholder values. To automate that python script I have written a shell script (`autodownload.sh`) for linux Ubuntu, which starts a Python environment, runs the Python script, closes the environment, and then unzips the resulting compressed file.  

## Displaying data

To display duck observations I have written a very simple Shiny app. The files `global.R, ui.R, and server.R` make up the app.
