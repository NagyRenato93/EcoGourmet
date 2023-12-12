SELECT 	`vasarlasok`.`vasarlas_id`,
		    `vasarlasok`.`mennyiseg`, 
        `vasarlasok`.`ar_forint`,
		    `user`.`first_name`, 
        `termek`.`nev`
FROM `vasarlasok` 
LEFT JOIN `user`
ON `user`.`id` = `vasarlasok`.`user_id`
LEFT JOIN `termek`
ON `termek`.`termek_id` = `vasarlasok`.`termek_id`;
