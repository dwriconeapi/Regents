/**
 * @author      Andrew Pieniezny <andrew.pieniezny@neric.org>
 * @version     x.x.x
 * @since       Nov 2, 2016
 * @filename	OptionScanService.java
 */
package org.neric.regents.service;

import java.util.List;

import org.neric.regents.model.Order;
import org.neric.regents.model.OrderForm;

public interface OrderService
{
	Order findById(int id);
	
	Order findByUUID(String uuid);
	
	List<Order> findAllOrders();

	List<Order> findAllOrdersByActiveOrderForm(int id);
	
	List<Order> findAllOrdersByUsername(String username);
	
	void saveOrder(Order order);
	
	void updateOrder(Order order);
	
	void deleteOrder(int id);
	
	void deleteOrder(String uuid);
	
	void updateStatus(String uuid, Boolean isComplete);
	
	public void updateStatus (List<String> uuids, String action);

	int count();

	int countByActiveOrderForm(int id);

	int countByActiveOrderFormUniqueDistrict(int id);
}
