CREATE TABLE `tos` (
	`ckey` varchar(32) NOT NULL,
	`datetime` datetime NOT NULL,
	`consent` bit(1) NOT NULL,
	PRIMARY KEY (`ckey`),
	UNIQUE KEY `ckey_UNIQUE` (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `complete_rounds` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`round_id` INT NOT NULL DEFAULT '0',
	`log_dir` VARCHAR(256) NOT NULL DEFAULT '0',
	`parsed` TINYINT NOT NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	INDEX `round_id` (`round_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
