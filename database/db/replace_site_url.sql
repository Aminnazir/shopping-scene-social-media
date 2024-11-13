UPDATE sp_options
SET value = REPLACE(value, 'https://localhost', 'http://localhost:9030')
WHERE value LIKE '%https://localhost%';

UPDATE `sp_options` SET `value` = '#1 Exceptional Social Media Management &amp; Analysis Platform' WHERE `sp_options`.`id` = 181;

