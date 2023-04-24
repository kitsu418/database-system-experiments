USE MyDb;
ALTER TABLE orderDetail DROP orderDate;
ALTER TABLE orderDetail
ADD unitPrice NUMERIC(10, 2);