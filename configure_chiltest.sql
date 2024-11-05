CREATE USER 'chiltest' IDENTIFIED BY 'cryoparty';
-- SET PASSWORD 'chiltest'@'localhost' = PASSWORD('cryoparty');
GRANT ALL PRIVILEGES ON *.* TO 'chiltest'@'localhost';
