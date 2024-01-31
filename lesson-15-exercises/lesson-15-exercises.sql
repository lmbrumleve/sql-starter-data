CREATE TABLE plant (
plant_id INTEGER PRIMARY KEY AUTO_INCREMENT,
plant_name VARCHAR(100),
zone INTEGER, 
season VARCHAR(50)
);

CREATE TABLE seeds (
seed_id INTEGER PRIMARY KEY AUTO_INCREMENT,
expiration_date DATE, 
quantity INTEGER, 
reorder BOOL,
plant_id INTEGER,
FOREIGN KEY (plant_id) REFERENCES plant (plant_id)
);

CREATE TABLE garden_bed (
space_number INTEGER PRIMARY KEY AUTO_INCREMENT,
date_planted DATE, 
doing_well INTEGER, 
plant_id INTEGER,
FOREIGN KEY (plant_id) REFERENCES plant (plant_id)
);

SELECT *
FROM seeds
INNER JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id);

SELECT plant_name, expiration_date, quantity, date_planted FROM seeds
INNER JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id)
INNER JOIN plant ON (plant.plant_id=seeds.plant_id);

SELECT * FROM seeds
LEFT JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id);

SELECT * FROM seeds
RIGHT JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id);

SELECT * FROM seeds LEFT JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id)
UNION
SELECT * FROM seeds RIGHT JOIN garden_bed ON (seeds.plant_id=garden_bed.plant_id);

SELECT *
FROM plant
INNER JOIN
        (SELECT seeds.plant_id FROM seeds INNER JOIN garden_bed ON seeds.plant_id=garden_bed.plant_id) AS planted_plants ON plant.plant_id=planted_plants.plant_id;

INSERT INTO seeds (expiration_date, quantity, reorder, plant_id)
VALUES ("2020-08-05", 100, 0, 
(SELECT plant_id FROM plant WHERE plant_name LIKE 'Hosta')
);