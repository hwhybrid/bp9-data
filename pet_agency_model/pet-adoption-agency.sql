CREATE TABLE `Animals` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar NOT NULL,
	`species` INT NOT NULL,
	`breed` varchar,
	`adopted` BOOLEAN NOT NULL,
	`staff_carer` varchar NOT NULL,
	`notes` varchar(1000) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `species` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`species` varchar(100) NOT NULL,
	`breed` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Adopters` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(50) NOT NULL,
	`last_name` varchar(50) NOT NULL,
	`adoptions` INT,
	`pet` INT NOT NULL,
	`phone_number` INT(20) NOT NULL,
	`email` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Adoption_History` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`witness` varchar NOT NULL,
	`adopter` INT NOT NULL,
	`animal` INT NOT NULL,
	`date` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Employees` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`first_name` varchar(100) NOT NULL,
	`last_name` varchar(100) NOT NULL,
	`phone_number` INT(50) NOT NULL,
	`email` varchar(100) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Animals` ADD CONSTRAINT `Animals_fk0` FOREIGN KEY (`species`) REFERENCES `species`(`id`);

ALTER TABLE `Animals` ADD CONSTRAINT `Animals_fk1` FOREIGN KEY (`staff_carer`) REFERENCES `Employees`(`id`);

ALTER TABLE `Adopters` ADD CONSTRAINT `Adopters_fk0` FOREIGN KEY (`pet`) REFERENCES `Animals`(`id`);

ALTER TABLE `Adoption_History` ADD CONSTRAINT `Adoption_History_fk0` FOREIGN KEY (`witness`) REFERENCES `Employees`(`id`);

ALTER TABLE `Adoption_History` ADD CONSTRAINT `Adoption_History_fk1` FOREIGN KEY (`adopter`) REFERENCES `Adopters`(`id`);

ALTER TABLE `Adoption_History` ADD CONSTRAINT `Adoption_History_fk2` FOREIGN KEY (`animal`) REFERENCES `Animals`(`id`);






