SELECT 	`user`.`first_name`,
		`user`.`last_name`,
        `subscription_plans`.`nev`,
     	`user_plans`.`expire`   
FROM `user_plans` 
INNER JOIN `user`
ON `user`.`id` = `user_plans`.`user_id`
INNER JOIN `subscription_plans`
ON `user_plans`.`termek_id` = `subscription_plans`.`termek_id`
WHERE 	`user_plans`.`user_id` = 1 AND
		DATE(`user_plans`.`expire`) >= DATE(NOW())