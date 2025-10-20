from arcgis.gis import GIS
from arcgis.features import FeatureLayer

# Connect to ArcGIS Online
gis = GIS("https://www.arcgis.com", "coreydondero_CWI", "")

# Find the layer you want to export data from
feature_layer_item = gis.content.search("title:Duck Survey_results", item_type="Feature Layer")[0]

# Export to CSV
export_result = feature_layer_item.export(title="Exported_Data", export_format="CSV")

# Download CSV
download_path = export_result.download(save_path="Documents/waterfowl")
print(f"Data downloaded to: {download_path}")

# Delete CSV export from portal
export_result.delete()
