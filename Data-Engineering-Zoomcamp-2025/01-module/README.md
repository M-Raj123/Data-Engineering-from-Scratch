## Module 1 Homework: Docker & SQL

Dataset link : 
NY Trips Dataset

https://www1.nyc.gov/site/tlc/about/tlc-trip-record-data.page
https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf

## Question 1. Understanding docker first run 

Run docker with the `python:3.12.8` image in an interactive mode, use the entrypoint `bash`.

What's the version of `pip` in the image?

- 24.3.1
- 24.2.1
- 23.3.1
- 23.2.1

```
docker run -it python:3.12.8 bash
pip --version
```
_Answer_ :  **24.3.1**

## Question 2. Understanding Docker networking and docker-compose

Given the following `docker-compose.yaml`, what is the `hostname` and `port` that **pgadmin** should use to connect to the postgres database?

```yaml
services:
  db:
    container_name: postgres
    image: postgres:17-alpine
    environment:
      POSTGRES_USER: 'postgres'
      POSTGRES_PASSWORD: 'postgres'
      POSTGRES_DB: 'ny_taxi'
    ports:
      - '5433:5432'
    volumes:
      - vol-pgdata:/var/lib/postgresql/data

  pgadmin:
    container_name: pgadmin
    image: dpage/pgadmin4:latest
    environment:
      PGADMIN_DEFAULT_EMAIL: "pgadmin@pgadmin.com"
      PGADMIN_DEFAULT_PASSWORD: "pgadmin"
    ports:
      - "8080:80"
    volumes:
      - vol-pgadmin_data:/var/lib/pgadmin  

volumes:
  vol-pgdata:
    name: vol-pgdata
  vol-pgadmin_data:
    name: vol-pgadmin_data
```

- postgres:5433
- localhost:5432
- db:5433
- postgres:5432
- db:5432

If there are more than one answers, select only one of them


```
hostname - db
port - 5432
```

_Answer_ :  **db:5432**

## Question 3. Trip Segmentation Count

During the period of October 1st 2019 (inclusive) and November 1st 2019 (exclusive), how many trips, **respectively**, happened:
1. Up to 1 mile
2. In between 1 (exclusive) and 3 miles (inclusive),
3. In between 3 (exclusive) and 7 miles (inclusive),
4. In between 7 (exclusive) and 10 miles (inclusive),
5. Over 10 miles 

Answers: 

- 104,802;  197,670;  110,612;  27,831;  35,281
- 104,802;  198,924;  109,603;  27,678;  35,189
- 104,793;  201,407;  110,612;  27,831;  35,281
- 104,793;  202,661;  109,603;  27,678;  35,189
- 104,838;  199,013;  109,645;  27,688;  35,202

```
SELECT
	SUM(CASE WHEN trip_distance <= 1 THEN 1 ELSE 0 END) AS up_to_one_sum,
	SUM(CASE WHEN trip_distance > 1 AND trip_distance <= 3 THEN 1 ELSE 0 END) AS one_three_sum,
	SUM(CASE WHEN trip_distance > 3 AND trip_distance <= 7 THEN 1 ELSE 0 END) AS three_seven_sum,
	SUM(CASE WHEN trip_distance > 7 AND trip_distance <= 10 THEN 1 ELSE 0 END) AS seven_ten_sum,
	SUM(CASE WHEN trip_distance >10 THEN 1 ELSE 0 END) AS over_ten_sum
FROM
	green_taxi_trips
WHERE 
	lpep_pickup_datetime >= '2019-10-01 00:00:00'
	AND lpep_dropoff_datetime < '2019-11-01 00:00:00';
```

_Answer_ : **104,802;  198,924;  109,603;  27,678;  35,189**


## Question 4. Longest trip for each day

Which was the pick up day with the longest trip distance?
Use the pick up time for your calculations.

Tip: For every day, we only care about one single trip with the longest distance. 

Answers: 

- 2019-10-11
- 2019-10-24
- 2019-10-26
- 2019-10-31

```
SELECT
	MAX(trip_distance),
	lpep_pickup_datetime::date as Pickup_Date 
FROM
	green_taxi_trips
WHERE 
	EXTRACT (YEAR FROM lpep_pickup_datetime) = 2019 and 
	EXTRACT (MONTH FROM lpep_pickup_datetime ) = 10
GROUP BY 2
ORDER BY 1 DESC;
```

_Answer_ : **2019-10-31**

## Question 5. Three biggest pickup zones

Which were the top pickup locations with over 13,000 in
`total_amount` (across all trips) for 2019-10-18?

Consider only `lpep_pickup_datetime` when filtering by date.
 
- East Harlem North, East Harlem South, Morningside Heights
- East Harlem North, Morningside Heights
- Morningside Heights, Astoria Park, East Harlem South
- Bedford, East Harlem North, Astoria Park

```
SELECT 
	z."Zone",
	SUM(t."total_amount") as tot
FROM 
	green_taxi_trips t
JOIN 
	zones z
ON 
	t."PULocationID" = z."LocationID"
WHERE 
	EXTRACT (YEAR FROM lpep_pickup_datetime) = 2019 and 
	EXTRACT (MONTH FROM lpep_pickup_datetime ) = 10 and 
	EXTRACT (DAY FROM lpep_pickup_datetime ) = 18 
GROUP BY
	z."Zone"
HAVING
	SUM(t."total_amount") >= 13000
ORDER BY 
	tot DESC
LIMIT 
	3;
```
_Answer_ : **East Harlem North, East Harlem South, Morningside Heights**

## Question 6. Largest tip

For the passengers picked up in October 2019 in the zone
named "East Harlem North" which was the drop off zone that had
the largest tip?

Note: it's `tip` , not `trip`

We need the name of the zone, not the ID.

- Yorkville West
- JFK Airport
- East Harlem North
- East Harlem South

```
SELECT
	zdo."Zone",
  t.tip_amount
FROM 
    green_taxi_trips t
JOIN 
    zones zpu ON t."PULocationID" = zpu."LocationID"
JOIN
    zones zdo ON t."DOLocationID" = zdo."LocationID"
WHERE 
	EXTRACT (YEAR FROM t.lpep_pickup_datetime) = 2019 and 
	EXTRACT (MONTH FROM t.lpep_pickup_datetime ) = 10 and 
	zpu."Zone" = 'East Harlem North'
ORDER BY
	2 DESC
LIMIT 1;
```

_Answer_ : **JFK Airport**
