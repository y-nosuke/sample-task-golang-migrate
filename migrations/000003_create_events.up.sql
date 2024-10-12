CREATE TABLE IF NOT EXISTS `e_task_events` (
    `id` BINARY(16) NOT NULL COMMENT 'タスクイベントID',
    `event_type_id` BINARY(16) NOT NULL COMMENT 'タスクイベントタイプID',
    `task_id` BINARY(16) NOT NULL COMMENT 'タスクID',
    `occurred_by` BINARY(16) NOT NULL COMMENT '発生者',
    `occurred_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '発生日時',
    `register_by` BINARY(16) NOT NULL COMMENT '登録者',
    `register_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '登録日時',
    PRIMARY KEY (`id`),
    CONSTRAINT `fk_e_task_events_event_type_id` FOREIGN KEY (`event_type_id`) REFERENCES `m_task_event_types`(`id`),
    CONSTRAINT `fk_e_task_events_task_id` FOREIGN KEY (`task_id`) REFERENCES `r_tasks`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT='タスクイベント';

CREATE TABLE IF NOT EXISTS `e_task_created` (
    `event_id` BINARY(16) NOT NULL COMMENT 'タスクイベントID',
    `title` VARCHAR(255) NOT NULL COMMENT 'タイトル',
    `detail` TEXT NULL COMMENT '詳細',
    `completed` BOOLEAN NOT NULL COMMENT '完了',
    `deadline` DATE NULL COMMENT '期限',
    `register_by` BINARY(16) NOT NULL COMMENT '登録者',
    `register_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '登録日時',
    PRIMARY KEY (`event_id`),
    CONSTRAINT `fk_e_task_created_event_id` FOREIGN KEY (`event_id`) REFERENCES `e_task_events`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT='タスク作成イベント';

CREATE TABLE IF NOT EXISTS `e_task_edited` (
    `event_id` BINARY(16) NOT NULL COMMENT 'タスクイベントID',
    `title` VARCHAR(255) NOT NULL COMMENT 'タイトル',
    `detail` TEXT NULL COMMENT '詳細',
    `completed` BOOLEAN NOT NULL COMMENT '完了',
    `deadline` DATE NULL COMMENT '期限',
    `register_by` BINARY(16) NOT NULL COMMENT '登録者',
    `register_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '登録日時',
    PRIMARY KEY (`event_id`),
    CONSTRAINT `fk_e_task_edited_event_id` FOREIGN KEY (`event_id`) REFERENCES `e_task_events`(`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT='タスク編集イベント';
