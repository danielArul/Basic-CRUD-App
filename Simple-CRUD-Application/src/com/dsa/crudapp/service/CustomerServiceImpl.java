package com.dsa.crudapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dsa.crudapp.dao.CustomerDAO;
import com.dsa.crudapp.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService{
	
		//Injecting customerDAO	
		@Autowired
		private CustomerDAO customerDAO;
		
		
		@Override
		@Transactional
		public List<Customer> getCustomers() {
			
			return customerDAO.getCustomers();
		}


		@Override
		@Transactional
		public void saveCustomer(Customer theCustomer) {
			// TODO Auto-generated method stub
			customerDAO.saveCustomer(theCustomer);
		}


		@Override
		@Transactional
		public Customer getCustomer(int theId) {
			// TODO Auto-generated method stub
			return customerDAO.getCustomer(theId);
		}


		@Override
		@Transactional
		public void deleteCustomer(int theId) {
			customerDAO.deleteCustomer(theId);
		
		}
}
