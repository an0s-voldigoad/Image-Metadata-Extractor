#!/bin/bash

# Banner function
display_banner() {
    echo "███╗   ███╗██╗███████╗███████╗██ ╗████████╗"
    echo "████╗ ████║██║██╔════╝██╔════╝██║╚══██╔══╝"
    echo "██╔████╔██║██║███████╗█████╗  ██║   ██║  " 
    echo "██║╚██╔╝██║██║╚════██║██╔══╝  ██║   ██║   "
    echo "██║ ╚═╝ ██║██║███████║██║      ██║   ██║   "
    echo "╚═╝     ╚═╝╚═╝╚══════╝╚═╝      ╚═╝   ╚═╝   "
    echo
    echo "        Created by MISFIT KING"
    echo "        YouTube        -- @notsoulplays"
    echo "        Instagram      -- @an0s_voldigoad"
    echo "        Telegram       -- @about_misfit"
    echo
}

# Function to display menu and get user input
show_menu() {
    echo "Choose an option:"
    echo "1) File Information"
    echo "2) Image Properties"
    echo "3) EXIF Data"
    echo "4) IPTC Data"
    echo "5) XMP Data"
    echo "6) Geotagging Details"
    echo "7) Editing Information"
    echo "8) Camera Settings"
    echo "9) Lens Information"
    echo "10) Thumbnail Image"
    echo "11) Copyright & Legal Information"
    echo "12) Custom Metadata"
    echo "13) Social Media Metadata"
    echo "14) Find Image Origin on the Internet"
    echo "15) All Metadata"
    echo "16) Exit"
    read -p "Enter your choice [1-16]: " category_choice
    display_metadata "$category_choice"
}

# Function to upload an image
upload_image() {
    read -p "Enter the full path of the image file: " image_path
    if [[ -f "$image_path" ]]; then
        image_file="$image_path"
        echo "Image uploaded successfully: $image_file"
        while true; do
            show_menu
        done
    else
        echo "File not found! Please enter a valid file path."
        upload_image
    fi
}

# Function to display metadata based on category
display_metadata() {
    local category_choice="$1"
    
    case $category_choice in
        1) exiftool "$image_file" | grep -E "File Name|File Size|File Type|Create Date|Modify Date" ;;
        2) 
            echo "Image Properties:"
            exiftool "$image_file" | grep -E "Image Width|Image Height|Image Resolution|Image Type|Colorspace"
            ;;
        3) exiftool "$image_file" | grep -E "Camera Model|Make|Exposure|ISO|Focal Length|Create Date|Shutter Speed|Aperture|White Balance" ;;
        4) exiftool "$image_file" | grep -E "Title|Keywords|Author|Copyright" ;;
        5) exiftool "$image_file" | grep -E "XMP" ;;
        6) 
            echo "Geotagging Details:"
            gps_data=$(exiftool "$image_file" | grep -E "GPS Latitude|GPS Longitude|GPS Altitude|GPS Position")
            if [ -z "$gps_data" ]; then
                echo "No GPS data found in this image."
            else
                echo "$gps_data"
            fi
            ;;
        7) exiftool "$image_file" | grep -E "Software|History|Transparency" ;;
        8) exiftool "$image_file" | grep -E "White Balance|Flash|Metering Mode" ;;
        9) exiftool "$image_file" | grep -E "Lens Model|Lens Make|Focal Length|Aperture" ;;
        10) exiftool "$image_file" -ThumbnailImage ;;
        11) exiftool "$image_file" | grep -E "Copyright|Usage Terms|Licensing" ;;
        12) exiftool "$image_file" -UserComment ;;
        13) exiftool "$image_file" | grep -E "Social Media|Platform|Tags" ;;
        14) 
            echo "Searching for the image origin on the internet..."
            tineye_url="https://www.tineye.com/search?url="
            encoded_image=$(curl -s -F "image=@$image_file" https://www.tineye.com/search)
            echo "Search results for the image:"
            echo "$tineye_url$encoded_image"
            ;;
        15) exiftool "$image_file" ;;
        16) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option! Please try again."; show_menu ;;
    esac

    echo
    echo "Press Enter to continue..."
    read
}

# Main script starts here
clear
display_banner  # Display the banner at the start
upload_image
