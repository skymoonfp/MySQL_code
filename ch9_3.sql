use learnsql;

desc orders_tbl;
desc products_tbl;

#输出产品号和每张订单总金额
select orders_tbl.prod_id, qty*cost from orders_tbl, products_tbl
where orders_tbl.prod_id =products_tbl.prod_id
order by prod_id;

#输出所有订单总金额
select sum(qty*cost) from orders_tbl, products_tbl
where orders_tbl.prod_id =products_tbl.prod_id;

#输出产品号和每张订单总金额和所有订单总金额???
select orders_tbl.prod_id,  qty*cost, sum(qty*cost) from orders_tbl, products_tbl
where orders_tbl.prod_id =products_tbl.prod_id
order by prod_id;

#输出单价为10时所有订单总金额
select sum(qty*10) from orders_tbl;
select sum(qty)*10 from orders_tbl;