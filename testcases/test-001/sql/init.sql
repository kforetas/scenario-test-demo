-- テーブル作成
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- 初期データ投入
INSERT INTO users (name, email) VALUES ('Test User', 'test@example.com');
