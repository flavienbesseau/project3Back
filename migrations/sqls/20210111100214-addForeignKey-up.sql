/* Replace with your SQL commands */

/* Replace with your SQL commands */
-- ALTER TABLE ms_response 
-- ADD CONSTRAINT `fk_ms_experience_1` 
-- FOREIGN KEY (`fk_experience_id`)
-- REFERENCES `ms_experience` (`id`)
-- ON DELETE SET NULL
-- ON UPDATE SET NULL;

ALTER TABLE `ms_response` 
ADD COLUMN `fk_experience_id` INT NOT NULL AFTER `fk_specialty_id`,
ADD INDEX `fk_ms_experience_1_idx` (`fk_experience_id` ASC) VISIBLE;

ALTER TABLE `ms_response` 
ADD CONSTRAINT `fk_ms_experience_1`
  FOREIGN KEY (`fk_experience_id`)
  REFERENCES `ms_experience` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
