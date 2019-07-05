CREATE TABLE `tos` (
	`ckey` varchar(32) NOT NULL,
	`datetime` datetime NOT NULL,
	`consent` bit(1) NOT NULL,
	PRIMARY KEY (`ckey`),
	UNIQUE KEY `ckey_UNIQUE` (`ckey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
