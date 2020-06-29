package com.dsa.crudapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dsa.crudapp.entity.Customer;
import com.dsa.crudapp.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	//need to inject our customer service
	@Autowired
	private CustomerService CustomerService;
	
	@GetMapping("/list")
	public String listCustomers(Model theModel) {
		//get customers from the service
		List<Customer> theCustomers=CustomerService.getCustomers();
				
		//add the customers to the model
		theModel.addAttribute("customers",theCustomers);
				
		return "list-customers";
	}
	
//	@GetMapping("/showFormForAdd")
//	public String showForForAdd(Model theModel) {
//		Customer theCustomer=new Customer();
//		theModel.addAttribute("customer",theCustomer);
//		
//		return "customer-form";
//	}
	
	@GetMapping("/showFormForAdd")
	public String showForForAdd(Model theModel) {
		Customer theCustomer=new Customer();
		theModel.addAttribute("customer",theCustomer);
		
		return "redirect:/customer/list";
		
		
	}
	
	
	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer")Customer theCustomer, BindingResult result, ModelMap model) {
		
		if (result.hasErrors()) {
            return "error";
        }
        model.addAttribute("firstName", theCustomer.getFirstName());
        model.addAttribute("lastName", theCustomer.getLastName());
        model.addAttribute("email", theCustomer.getEmail());
		//save the customer using our service
//		CustomerService.saveCustomer(theCustomer);
		
		return "redirect:/customer/list";
		
		
	}
	
	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int theId) {
		
		//delete the customer
		CustomerService.deleteCustomer(theId);
		return "redirect:/customer/list";
		
		
	}
	
	
}


