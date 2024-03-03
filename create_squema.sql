#Eliminamos las tablas en caso tal que exitan ya en el squema

DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS shops CASCADE;
DROP TABLE IF EXISTS locations CASCADE;
DROP TABLE IF EXISTS suppliers CASCADE;

# creamos la tabla empleados la cual contendra 7 columanas
# con la llave primaria de la tabla como employee_id
# y con una llave foranea la cual hara referencia a la tabla shops

CREATE TABLE employees(
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    hire_date DATE,
    gender VARCHAR(1),
    coffeshop_id INT
);

# ahora creamos la tabla tiendas la cual contendra 3 columanas
# con la llave primaria llamada coffeeshop_id
# y la llave foranea de city_id la cual referenciara a la tabla locaciones
# ademas la llave primaria de shop sera referenciada como llave foranea de la tabla proveedores

CREATE TABLE shops(
    coffeeshop_id INT PRIMARY KEY,
    coffeeshop_name VARCHAR(50),
    city_id INT
)

#Creamos la union entre la tabla empleados y la tabla tiendas
#por medio de sus respectiva columnas

ALTER TABLE employees
ADD FOREIGN KEY coffeeshop_id
REFERENCES shops(coffeshop_id)
ON DELETE SET NULL;

# creamos la tabla locaciones la cual contendra tres columnas
# la cual tiene como llave primaria city_id
# y no posee ninguna llave foranea

CREATE TABLE locations(
    city_id INT PRIMARY KEY,
    city VARCHAR(50),
    country VARCHAR(50)
)

#unimos la tabla tienda con la tabla locacion por medio de city_id


ALTER TABLE shops
ADD FOREIGN KEY city_id
REFERENCES locations(city_id)
ON DELETE SET NULL

# cramos la tabla proveedores la cual tendra tres columnas
# de las cuales dos seran llaves primarias de esta tabla
# y una de esas llave coffeeshop_id tambien es foranea y es enlazada a la tabla tienda

CREATE TABLE suppliers(
    coffeeshop_id INT,
    supplier_name VARCHAR(40),
    coffee_type VARCHAR(20),
    PRIMARY KEY (coffeeshop_id, supplier_name),
    FOREIGN KEY (coffeeshop_id) REFERENCES shops(coffeeshop_id)
    ON DELETE CASCADE
);






