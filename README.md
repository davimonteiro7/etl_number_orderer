# ETL Number Orderer

## Instructions

*  Project download     - `git clone https://github.com/davimonteiro7/etl_number_orderer.git`
*  Open project folder  - `cd etl_number_orderer`
*  Install dependencies - `mix deps.get`
*  Run application      - `mix phx.server`
*  Load sorted numbers  - `curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET http:/localhost:4000/api/load_sorted_numbers`