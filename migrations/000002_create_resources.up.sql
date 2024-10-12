CREATE TABLE IF NOT EXISTS `r_tasks` (
    `id` BINARY(16) NOT NULL COMMENT 'タスクID',
    `title` VARCHAR(255) NOT NULL COMMENT 'タイトル',
    `detail` TEXT NULL COMMENT '詳細',
    `completed` BOOLEAN NOT NULL COMMENT '完了',
    `deadline` DATE NULL COMMENT '期限',
    `created_by` BINARY(16) NOT NULL COMMENT  '作成者',
    `created_at` DATETIME(6) NOT NULL COMMENT '作成日時',
    `edited_by` BINARY(16) NOT NULL COMMENT '編集者',
    `edited_at` DATETIME(6) NOT NULL COMMENT '編集日時',
    `register_by` BINARY(16) NOT NULL COMMENT '登録者',
    `register_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) COMMENT '登録日時',
    `updated_by` BINARY(16) NOT NULL COMMENT '更新者',
    `updated_at` DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6) COMMENT '更新日時',
    `version` BINARY(16) NOT NULL DEFAULT (UUID_TO_BIN(UUID())),
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT='タスク';
