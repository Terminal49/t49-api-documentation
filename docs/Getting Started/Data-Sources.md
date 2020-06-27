# Data Sources

Our platform gets data from variety of sources. 

- **Ocean carriers (aka steamship lines):** bill of lading/booking details, vessel eta, containers and milestones
- **Container terminal operators:** container availability, last free day, holds, fees etc
- **Container rail carriers:** container milestones via rail
- **AIS data: ** vessel details and real-time location tracking

## Supported Ocean Carriers
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


## Ports and Terminals
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


## Known Issues (ocean)
Shipment data is populated from requests to the shipping lines. 

Below are a list of known issuses with our data sources:

### Cma-Cgm, APL, ANL
- No container weight
- No container seal number

### Maersk, Sealand, Safmarine
- Shipment departure/arrival events are not always available depending on when BL is entered into system. 
- No container seal number

### Hamburg Süd
- No estimated departure time
- No container weight
- No container seal number

### MSC 
- No departure or arrival events. Actual departure and arrival times are based on lading/unlading. Estimated times are departure / arrival times. 
- No container seal number

### Hapag Lloyd
- No container weight
- No container seal number

### Evergreen
- All dates are provided as dates, not datetimes. We record and return them all as midnight at the location the event happened (when location is available) or midnight UTC.
- Only Dry, Reefer, and Flatpack container types are mapped to our system

### COSCO
- No departure or arrival events. Does not affect departure/arrival times.

###  OOCL
- No container seal number

### ONE
- Only Dry, and Reefer container types are mapped to our system

### Yang-Ming
- When BL has multiple containers, the container weight returned is the average of the shipment. (i.e. the BL gross weight / number of containers)

### Hyundai Merchant Marine
- No container type

### ZIM
- No container weight
- No container seal number

### PIL
- No departure or arrival events. All departure and arrival times are based on lading/unlading. 
- No container weight
- No container seal number

### Westwood Shipping
- No container weight
- Only Dry container types are mapped to our system