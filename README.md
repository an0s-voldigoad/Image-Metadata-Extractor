![logo](https://i.postimg.cc/Mpt6N4cD/IMG-20240908-145743.jpg)


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
</head>
<body>
    <h1>📜 Metadata Extraction Guide</h1>
    <p>To use the <code>extract_metadata.sh</code> script for extracting metadata from images, follow these step-by-step instructions. This assumes the script is already written and ready for execution. The script's purpose is to extract metadata (such as geolocation, camera details, timestamps, etc.) from images and check where the image has been used online, as you might have requested earlier.</p>

   <img align = "right" alt="Beluga Hacks" width="200" src="https://gifdb.com/images/high/computer-hacking-blinking-line-vo8sn7mrzroe6tiq.webp">

   <h1>🤖 Step-by-Step Guide:</h1> 

Ensure Required Tools Are Installed The <code>extract_metadata.sh</code> script might require some external tools like ExifTool for metadata extraction and curl or wget for online searches. Install the required tools first:
ExifTool: Used for extracting metadata from images.

<code>bash <Copy code> sudo apt-get update sudo apt-get install libimage-exiftool-perl curl/wget</code>: For sending HTTP requests (if the script checks where the image is used online).

<code>bash <Copy code> sudo apt-get install curl</code> 

OR

<code>bash <Copy code> sudo apt-get install wget</code>

install requirements first then use <code>chmod +x image_metadata_extractor.sh</code>

After Giving Permissions type <code>./extract_metadata.sh</code>

</body><html>
