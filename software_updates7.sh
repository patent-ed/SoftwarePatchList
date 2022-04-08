#!/bin/bash
# Software Update Check Script... 04/08/2022 08:15AM edited - changed location to shared
# Microsoft https://macadmins.software/

hostmac=$(hostname)
MacUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )


# Create name for Parent folder
# Software List
name=$(/bin/date +"%Y-%m-%d_Time_%H%M"_software_patch_list)
dated=$(/bin/date +"%Y-%m-%dT%H%M")
daydate=$(/bin/date +"%Y-%m-%d")
dayTimedate=$(/bin/date +"%H%M")

# Create Parent folder with $name from right above /Users/Shared
# mkdir -p ~/Desktop/"$name"/
mkdir -p /Users/Shared/"$name"/

# Create Location on mac Variable
# dropplace=(~/Desktop/"$name"/)
dropplace=(/Users/Shared/"$name"/)

# Create file on mac Variable
# touch ~/Desktop/"$name"/"$hostmac"_Software_list.txt
touch /Users/Shared/"$name"/"$hostmac"_Software_list.txt

# Create File on mac Variable
#dropfile=("$hostmac"_listZ.txt)

#location=$(echo ~/Desktop/"$name"/"$hostmac"_Software_list.txt)
location=$(echo /Users/Shared/"$name"/"$hostmac"_Software_list.txt)

line_topper=$(echo "####################################################")
linebreaker=$(echo "----------------------------------------------------")
#MacUser=$( scutil <<< "show State:/Users/ConsoleUser" | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

############################################# VARIABLES ABOVE
# ####################################################################################

echo "Host: $hostmac" >> "$location"
echo "User: $MacUser" >> "$location"
echo "$dated Software List" >> "$location"
echo "Date: $daydate" >> "$location"
echo "Time: $dayTimedate" >> "$location"

echo "$line_topper" >> "$location"
echo "$linebreaker" >> "$location"
echo -e "\n" >> "$location"

# macOS Information
echo "$line_topper" >> "$location"
echo "Apple macOS Information:" >> "$location"
echo "Report Date: $dayTimedate Date: $daydate" >> "$location"
echo "$linebreaker" >> "$location"
# NEW SECTION - WEB BROWSERS
echo -e "\n" >> "$location"

# macOS Catalina Information
echo "macOS Catalina Version Information" >> "$location"
echo "$linebreaker" >> "$location"

Catalina=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/195" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $Catalina" >> "$location"

CatalinaBuild=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/195" | grep currentVersion | tr -d '"' | awk '{ print $3 }')
echo "Build: $CatalinaBuild" >> "$location"

CatalinaLastModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/195" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $CatalinaLastModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"
#echo -e "New line hello World\0041\nNew line hello World\0041\n" >> "$location"

# macOS Big Sur Information
echo "macOS Big Sur Version Information" >> "$location"
echo "$linebreaker" >> "$location"

BigSur=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/303" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $BigSur" >> "$location"

BigSurBuild=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/303" | grep currentVersion | tr -d '"' | awk '{ print $3 }')
echo "Build: $BigSurBuild" >> "$location"

BigSurModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/303" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $BigSurModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# macOS Monterey Information
echo "macOS Monterey Version Information" >> "$location"
echo "$linebreaker" >> "$location"

Monterey=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/41F" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $Monterey" >> "$location"

MontereyBuild=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/41F" | grep currentVersion | tr -d '"' | awk '{ print $3 }')
echo "Build: $MontereyBuild" >> "$location"

MontereyModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/41F" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $MontereyModified" >> "$location"

# ####################################################################################
# NEW SECTION - WEB BROWSERS
echo -e "\n" >> "$location"

# Browser Information
echo "$line_topper" >> "$location"
echo "Web Browser Information:" >> "$location"
echo "Report Date: $dayTimedate Date: $daydate" >> "$location"
echo "$linebreaker" >> "$location"
# NEW SECTION - WEB BROWSERS
echo -e "\n" >> "$location"

# Microsoft Edge Information
echo "Microsoft Edge Version Information" >> "$location"
echo "$linebreaker" >> "$location"
edgeID=(1D4)

Edge=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$edgeID" | grep name | tr -d '"' | awk '{ print $2 " " $3 }')
echo "Name: $Edge" >> "$location"

EdgeVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$edgeID" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $EdgeVersion" >> "$location"


EdgeModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$edgeID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $EdgeModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Firefox Information
echo "Firefox Version Information" >> "$location"
echo "$linebreaker" >> "$location"
FirefoxID=(0B4)

Firefox=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$FirefoxID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $Firefox" >> "$location"

FirefoxVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$FirefoxID" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $FirefoxVersion" >> "$location"

FirefoxModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$FirefoxID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $FirefoxModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Google Chrome Information
echo "Google Chrome Version Information" >> "$location"
echo "$linebreaker" >> "$location"
ChromeID=(0BC)

Chrome=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ChromeID" | grep name | tr -d '"' | awk '{ print $2 " " $3 }')
echo "Name: $Chrome" >> "$location"

ChromeVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ChromeID" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $ChromeVersion" >> "$location"

ChromeVendorVersion=$(curl -s "http://omahaproxy.appspot.com/all" | grep mac,stable, | cut -b '12-24')
echo "Vendor's Version: $ChromeVendorVersion" >> "$location"

ChromeModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ChromeID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $ChromeModified" >> "$location"

ChromeVendorVersionMod=$(curl -s "http://omahaproxy.appspot.com/all" | grep mac,stable, | cut -b '40-47')
echo "Vendor's Last Revision Date: $ChromeVendorVersionMod" >> "$location"

# ####################################################################################
# NEW SECTION - Adobe Applications
echo -e "\n" >> "$location"

# Browser Information
echo "$line_topper" >> "$location"
echo "Adobe Applications Information:" >> "$location"
echo "Report Date: $dayTimedate Date: $daydate" >> "$location"
echo "$linebreaker" >> "$location"
# NEW SECTION - Adobe
echo -e "\n" >> "$location"

# Adobe Acrobat Reader XI Information
echo "Adobe Acrobat Reader XI Version Information" >> "$location"
echo "$linebreaker" >> "$location"
ADOBECRID=(AdobeAcrobatReaderXI)

ADOBECR=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ADOBECRID" | grep name | tr -d '"' | awk '{ print $2 " " $3 }')
echo "Name: $ADOBECR" >> "$location"

ADOBECRVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ADOBECRID" | grep currentVersion | tr -d '"' | awk '{ print $2 }')
echo "Version: $ADOBECRVersion" >> "$location"


ADOBECRModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$ADOBECRID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $ADOBECRModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Adobe Photoshop Lightroom CC Information
echo "Adobe Photoshop Lightroom CC Version Information" >> "$location"
echo "$linebreaker" >> "$location"
PhotoshopLCID=(AdobePhotoshopLightroomCC)

PhotoshopLCC=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$PhotoshopLCID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $PhotoshopLCC" >> "$location"

PhotoshopLCCVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$PhotoshopLCID" | grep currentVersion | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Version: $PhotoshopLCCVersion" >> "$location"

PhotoshopLCModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$PhotoshopLCID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $PhotoshopLCModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Adobe Illustrator CC Information
echo "Adobe Illustrator CC Version Information" >> "$location"
echo "$linebreaker" >> "$location"
AdobeILLCCID=(00A)

AdobeILLCC=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeILLCCID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $AdobeILLCC" >> "$location"

AdobeILLCCVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeILLCCID" | grep currentVersion | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Version: $AdobeILLCCVersion" >> "$location"

AdobeILLCCModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeILLCCID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $AdobeILLCCModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Adobe InDesign CC Information
echo "Adobe InDesign CC Version Information" >> "$location"
echo "$linebreaker" >> "$location"
AdobeInDesCCID=(011)

AdobeInDesCC=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeInDesCCID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $AdobeInDesCC" >> "$location"

AdobeInDesCCCVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeInDesCCID" | grep currentVersion | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Version: $AdobeInDesCCCVersion" >> "$location"

AdobeInDesCCModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeInDesCCID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $AdobeInDesCCModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Adobe Premiere CC Information
echo "Adobe Premiere CC Version Information" >> "$location"
echo "$linebreaker" >> "$location"
AdobePremCCID=(AdobePremiereProCC)

AdobePremCC=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobePremCCID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $AdobePremCC" >> "$location"

AdobePremCCVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobePremCCID" | grep currentVersion | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Version: $AdobePremCCVersion" >> "$location"

AdobePremCCModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobePremCCID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $AdobePremCCModified" >> "$location"

# NEW SECTION
echo -e "\n" >> "$location"

# Adobe Camera Raw CC Information
echo "Adobe Camera Raw CC Version Information" >> "$location"
echo "$linebreaker" >> "$location"
AdobeCamRawCCID=(073)

AdobeCamRawCC=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeCamRawCCID" | grep name | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Name: $AdobeCamRawCC" >> "$location"

AdobeCamRawCCVersion=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeCamRawCCID" | grep currentVersion | tr -d '"' | awk '{ print $2 " " $3 " " $4  }')
echo "Version: $AdobeCamRawCCVersion" >> "$location"

AdobePremCCModified=$(curl -s "https://jamf-patch.jamfcloud.com/v1/software/$AdobeCamRawCCID" | grep lastModified | tr -d '"' | awk '{ print $2 }')
echo "Last Revision Date: $AdobePremCCModified" >> "$location"



# ####################################################################################
# NEW SECTION - Microsoft Office Applications - https://macadmins.software/
echo -e "\n" >> "$location"

# Microsoft Mac Downloads Information
echo "$line_topper" >> "$location"
echo "Microsoft Office Mac Downloads Information:" >> "$location"
echo "Report Date: $dayTimedate Date: $daydate" >> "$location"
echo "$linebreaker" >> "$location"
# NEW SECTION - Microsoft Mac Downloads Microsoft Office
echo -e "\n" >> "$location"

# Microsoft Mac Downloads - Jamf Cloud
# echo "Microsoft Office Applications Information" >> "$location"
# echo "$linebreaker" >> "$location"
# MSOFFICEID=(AdobeAcrobatReaderXI)

# curl -s "https://macadmins.software" | grep 'Office 365 Business Pro'
# curl -s "https://macadmins.software" | grep 'Office 365 Business Pro' | tr -d '<td>'
# curl -s "https://macadmins.software" | grep 'Office 365 Business Pro' | tr -d '<td>' | tr -d '</td>'
# curl -s "https://macadmins.software" | grep mac,stable, | cut -b '12-24'

# Microsoft Office Applications Information
MSOfficeVndrName=$(curl -s "https://macadmins.software" | grep 'Office 365 Business Pro' | tr -d '<td>' | tr -d '</td>')
echo "Microsoft Vendor Application: $MSOfficeVndrName" >> "$location"



