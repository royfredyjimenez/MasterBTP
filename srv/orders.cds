using com.test as test from '../db/test';
define service ManageOrder {
entity GetOrders as projection on test.Orders;
 

}