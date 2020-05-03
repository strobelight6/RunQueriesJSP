CREATE INDEX username ON users (screen_name);

CREATE INDEX poster ON tweet (posting_user);

CREATE INDEX state ON users (ofstate);
