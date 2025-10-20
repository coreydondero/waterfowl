# Switch to python env
source arcgis_env/bin/activate

# Run python script
python Documents/waterfowl/download_waterfowl.py

# Deactivate python environment
deactivate

# Unzip file
unzip Documents/waterfowl/Exported_Data.zip -d Documents/waterfowl
