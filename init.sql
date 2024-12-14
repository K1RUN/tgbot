CREATE TABLE IF NOT EXISTS viewer (
     user_id BIGINT,
     number text
);

CREATE TABLE IF NOT EXISTS journ (
     user_id BIGINT,
     number text,
     redaction text
);
