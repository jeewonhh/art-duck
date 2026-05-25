INSTALL quack;
LOAD quack;

-- Order matters in quack v1.5.3: serve first, create tables AFTER.
CALL quack_serve('quack:localhost', allow_other_hostname = true, token = 'abcd');

CREATE TABLE pixels (
    x INTEGER,
    y INTEGER,
    color TINYINT,
    user_id VARCHAR,
    updated_at TIMESTAMP DEFAULT now(),
    PRIMARY KEY (x, y)
);

INSERT INTO pixels (x, y, color, user_id)
SELECT x, y, 0, 'seed'
FROM range(200) AS gx(x), range(200) AS gy(y);

SELECT 'serving on 0.0.0.0:9494, token=abcd, ' || count(*) || ' pixels (in-memory)' AS status FROM pixels;
