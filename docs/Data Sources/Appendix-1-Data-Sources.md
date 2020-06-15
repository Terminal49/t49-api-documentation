# Appendix 1: Data Sources

## Shipment Line Data
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