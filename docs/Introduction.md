# Introduction

The Terminal 49 API offers a convenient way to programatically track your shipments from origin to destination.

Here are just a few of the data points we return and possible use-cases. 


Data | Example Use Case
-----|-------------------
 Destination ETA | Surface ETA changes to your relevant teams as they're reported
 Last Free Day and terminal status¹ | Track containers approaching LFD and prioritize dispatching
 Fees and holds at destination terminal | Clear your cargo to keep you containers moving
 Actual departure and arrival times | Report journey times by route to compare your ocean carriers performance

_1.  At container ports in the US_
## How it works
All you need to provide are your BOL numbers and SCACs. Terminal 49 will lookup the shipment with the carrier and populate shipment details including containers. 

Once the shipment is setup Terminal 49 periodically checks with the carrier and the destination terminal. If any of the details of your shipment or containers change (for example - if the ETA changes) we will post the shipment to the the webhook you provide so you are always kept up-to-date.


## Supported Shipping Lines and Terminals
| # |Full Name                     |Nickname   |SCAC|BOL Prefix|Support   |Notes               |
|---|------------------------------|-----------|----|----------|----------|--------------------|
|1  |American President Lines      |APL        |APLU|APLU      |Yes       |                    |
|2  |Australia National Line       |ANL        |ANNU|ANLC      |Yes       |                    |
|3  |China Ocean Shipping Company  |COSCO      |COSU|CCMJ      |Yes       |                    |
|4  |CMA CGM                       |CMA CGM    |CMDU|CMDU      |Yes       |                    |
|5  |Evergreen                     |Evergreen  |EGLV|EISU      |Yes       |                    |
|6  |Hamburg Sud                   |Hamburg Sud|SUDU|SUDU      |Yes       |                    |
|7  |Hapag-Lloyd                   |Hapag-Lloyd|HLCU|HLCU      |Yes       |                    |
|8  |Hyundai Merchant Marine       |Hyundai    |HDMU|HDMU      |Partial   |No container numbers|
|9  |Maersk                        |Maersk     |MAEU|MAEU      |Yes       |                    |
|10 |Matson Navigation Company     |Matson     |MATS|MATS      |Yes       |                    |
|11 |Mediterranean Shipping Company|MSC        |MSCU|MEDU      |Yes       |                    |
|12 |Ocean Network Express         |ONE        |ONEY|ONEY      |Yes       |                    |
|13 |Orient Overseas Container Line|OOCL       |OOLU|OOLU      |Yes       |                    |
|14 |Pacific International Lines   |PIL        |PCIU|PABV      |Yes       |                    |
|15 |Safmarine Container Line      |Safmarine  |SAFM|SAFM      |Yes       |                    |
|16 |SeaLand                       |SeaLand    |SEAL|SEAU      |Yes       |                    |
|17 |Yangming Marine Transport     |Yangming   |YMLU|YMLU      |Yes       |                    |
|18 |Wan Hai Lines                 |Wan Hai    |WHLC|          |On roadmap|June Release        |
|19 |Matson                        |Matson     |MATS|          |On roadmap|June Release        |
|20 |Zim                           |Zim        |ZIMU|          |On roadmap|June Release        |
|21 |Seaboard Marine               |Seaboard   |CLAM|          |On roadmap|June Release        |
|22 |Crowley                       |Crowley    |CLAM|          |On roadmap|June Release        |
[CSV of support carriers with roadmap]("https://www.terminal49.com/api/docs/assets/data/Terminal49 Shiping Line Support.csv")



[CSV of supported US terminals](https://www.terminal49.com/api/docs/../assets/data/Terminal49 Terminal Support.csv)
If you would you like us to support a shipping line or terminals that is not listed above please reach out to us. 

## Integrated Ports
Presently, the Terminal 49 api integrates with terminals at the following ports:
- Baltimore
- Boston
- Florida
- Houston
- Jacksonville
- Long Beach
- Los Angeles
- Miami
- Mobile
- New Jersey
- New Orleans
- New York
- Oakland
- Philadelphia
- Port Everglades
- Savannah
- Seattle
- Tacoma
- Tampa
- Virginia
