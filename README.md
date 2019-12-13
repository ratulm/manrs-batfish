# manrs-batfish

## Setup 

1. Pull and run the latest Docker Batfish image
    ```
    docker pull batfish/allinone
    docker run --name batfish -v batfish-data:/data -p 8888:8888 -p 9997:9997 -p 9996:9996 batfish/allinone
    ```

2. Install Python dependencies
    ```
    pip install -r requirements.txt

    ```
    
## Run

1. Put your config files in the `test/configs` folder at the top level of this repository

2. Run `robot check_cfg.robot`