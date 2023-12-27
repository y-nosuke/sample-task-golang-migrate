CREATE TABLE IF NOT EXISTS `r_users` (
	`id` BINARY(16) NOT NULL COMMENT 'id',
	`username` VARCHAR(255) NOT NULL,
	`email` VARCHAR(255) UNIQUE NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
	`updated_by` BINARY(16) NOT NULL,
	`updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `r_oidc_users` (
	`user_id` BINARY(16) NOT NULL,
	`sub` BINARY(16) NOT NULL,
	`iss` VARCHAR(255) NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
	`updated_by` BINARY(16) NOT NULL,
	`updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
	PRIMARY KEY (`user_id`),
	FOREIGN KEY `FK_oidc_users_users`(`user_id`) REFERENCES `r_users`(`id`) ON DELETE CASCADE
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `e_user_events` (
	`id` BINARY(16) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	`user_id` BINARY(16) NOT NULL,
	`data` JSON NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
	PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

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

CREATE TABLE IF NOT EXISTS `e_task_events` (
	`id` BINARY(16) NOT NULL,
	`type` VARCHAR(255) NOT NULL,
	`task_id` BINARY(16) NOT NULL,
	`data` JSON NOT NULL,
	`created_by` BINARY(16) NOT NULL,
	`created_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
	PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;