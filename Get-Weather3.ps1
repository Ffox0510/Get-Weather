Function Get-Weather
{
Param($lat, $long, $city)
#<$weather = Invoke-RestMethod -method Get -Uri "https://api.darksky.net/forecast/90a9368fd7475f154b6e2fa83115a3da/$lat,$long"#>
$City = Invoke-RestMethod -Method Get -URI "http://www.mapquestapi.com/geocoding/v1/address?key=uHwk9TGvdKall0Skwca6khiJyjpz0pGV&location=$city"
## Invokes two methods that pull from RESTful APIs those methods are saved to variables in a function 
## The parameters of this function are the city and that cities latitude and longitude coordinates

$lat = $city.results.locations.latlng.lat
$lat = $lat[0]

$long= $city.results.locations.latlng.lng
$long= $long[0]
## When Calling the Function a city is specified, this cities lattitude and longitude coordinates 
## Are saved into $lat and $long.
## These coordinates are then fed into the get weather API and the weather is got.  


$weather = Invoke-RestMethod -method Get -Uri "https://api.darksky.net/forecast/90a9368fd7475f154b6e2fa83115a3da/$lat,$long"
$weather
#<Displays the weather in the requested location#>

}

Function Get-City
{
Param($city)
Invoke-RestMethod -URI "http://www.mapquestapi.com/geocoding/v1/address?key=uHwk9TGvdKall0Skwca6khiJyjpz0pGV&location=$city"
$city = Invoke-RestMethod -URI "http://www.mapquestapi.com/geocoding/v1/address?key=uHwk9TGvdKall0Skwca6khiJyjpz0pGV&location=$city"
##Gets the city GEOCode InFO
##The City info is a parameter enter into the function 
##and is the City that the API queries for

$City.results | Format-List 
$lat = $city.results.locations.latlng.lat
$lat = $lat[0]
$lat
$long= $city.results.locations.latlng.lng
$long= $long[0]
$long
##Displays the cities LAT Long Info
##Saves the first value into the array

<#$city1 = City1.results 
$city1 | Format-List#>

}
