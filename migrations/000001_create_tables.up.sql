CREATE TABLE IF NOT EXISTS `r_tasks` (
	`id` BINARY(16) NOT NULL COMMENT 'id',
	`title` VARCHAR(255) NOT NULL,
	`detail` TEXT NULL,
	`completed` BOOLEAN NOT NULL,
	`deadline` DATE NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
	`updated_by` BINARY(16) NOT NULL,
	`updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	`version` BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
	PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `e_task_registered` (
	`task_id` BINARY(16) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`detail` TEXT NULL,
	`deadline` DATE NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL,
	PRIMARY KEY (`task_id`),
	FOREIGN KEY `FK_task_registered_tasks`(`task_id`) REFERENCES r_tasks(id) ON DELETE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `e_task_updated` (
	`task_id` BINARY(16) NOT NULL,
	`title` VARCHAR(255) NOT NULL,
	`detail` TEXT NULL,
	`deadline` DATE NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL,
	PRIMARY KEY (`task_id`, `created_at`),
	FOREIGN KEY `FK_task_updated_tasks`(`task_id`) REFERENCES r_tasks(id) ON DELETE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `e_task_completed` (
	`task_id` BINARY(16) NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL,
	PRIMARY KEY (`task_id`, `created_at`),
	FOREIGN KEY `FK_task_completed_tasks`(`task_id`) REFERENCES r_tasks(id) ON DELETE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `e_task_uncompleted` (
	`task_id` BINARY(16) NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL,
	PRIMARY KEY (`task_id`, `created_at`),
	FOREIGN KEY `FK_task_uncompleted_tasks`(`task_id`) REFERENCES r_tasks(id) ON DELETE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
