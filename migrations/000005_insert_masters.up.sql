SET @user_id = UUID_TO_BIN('01927f31-c506-7831-bcad-b45aa556e48b');

INSERT INTO `m_task_event_types`
    (`id`, `name`, `register_by`, `updated_by`)
VALUES
    (UUID_TO_BIN('019271db-fcae-7760-b8cf-d5a773e02b2c'), 'タスク作成', @user_id, @user_id),
    (UUID_TO_BIN('019271db-fcae-797a-ad72-6849999ee5ee'), 'タスク編集', @user_id, @user_id),
    (UUID_TO_BIN('019271db-fcae-7864-b7d9-b61db784aba4'), 'タスク完了', @user_id, @user_id),
    (UUID_TO_BIN('019271db-fcae-7bbd-9557-d468a7f149cc'), 'タスク未完了', @user_id, @user_id),
    (UUID_TO_BIN('019271db-fcae-7bda-8ed4-fe79343cf736'), 'タスク削除', @user_id, @user_id);
