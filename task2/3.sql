USE MyDb;
ALTER TABLE addressBook
MODIFY QQ CHAR(12),
    RENAME COLUMN weixin TO wechat;