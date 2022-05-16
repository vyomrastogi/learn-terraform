# learn-terraform


### Notes : 

- All the resources for the random provider can be recreated by using `keepers`. It is a map of arbitrary key-values
- `data` keyword is used to configure datasource and is only for read-only
- Maintaining version of providers
    - `version="1.0.0"` - always download specified version
    - `version="!=1.0.0"` - downloads the previous version available
    - `version="> 1.0.0"` - downloads the greather specified version
    - `version="> 1.0.0, < 0.8.0", !=0.9.1` - downloads the latest version matching all conditions
    - `version="~> 1.0.0"` - downloads the incremental version greater than specified version
