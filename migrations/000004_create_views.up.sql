CREATE OR REPLACE VIEW `v_task_histories` AS
SELECT
    BIN_TO_UUID(`te`.`task_id`) AS `task_id`,
    BIN_TO_UUID(`te`.`id`) AS `event_id`,
    `tet`.`name` AS `event_type_name`,
    BIN_TO_UUID(`te`.`occurred_by`) AS `occurred_by`,
    `te`.`occurred_at`
FROM `e_task_events` AS `te`
INNER JOIN `m_task_event_types` AS `tet` ON `te`.`event_type_id` = `tet`.`id`
ORDER BY `task_id`, `event_id` ASC;
