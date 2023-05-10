package com.example.demo.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

import com.example.demo.entities.Address;
import com.example.demo.entities.Cart;
import com.example.demo.entities.CustomerRegistration;
import com.example.demo.entities.FloristProductDummy;
import com.example.demo.entities.FloristRegistration;
import com.example.demo.entities.LoginCheck;
import com.example.demo.entities.Product;
import com.example.demo.entities.User;
import com.example.demo.entities.UserType;
import com.example.demo.services.AddressService;
import com.example.demo.services.CartService;
import com.example.demo.services.FloristProductService;
import com.example.demo.services.UserService;
import com.example.demo.services.UserTypeService;

@CrossOrigin(origins="http://localhost:3000")
@RestController
public class UserController {

	@Autowired
	UserService uservice;
	
	@Autowired
	AddressService aservice;
	
	@Autowired
	UserTypeService utservice;
	
	@Autowired
	CartService cservice;
	
	@Autowired
	FloristProductService fpservice;
	
	User user;
	
	@GetMapping("/all")
	public List<User> getAll()
	{
		return uservice.getAll();
	}
	
	@PostMapping("/checkLogin")
	public User checkLogin(@RequestBody LoginCheck lcheck  )
	{
		user = uservice.checkLogin(lcheck.getEmail(), lcheck.getPassword());
		return user;
	}
	
	
//	@PostMapping("/saveCustomer")
//	public User save(@RequestBody User c)
//	{
//		return uservice.save(c);
//	}
	
	@PostMapping("/saveFlorist")
	public User saveFlorist(@RequestBody FloristRegistration flo)
	{
//		UserType ut = utservice.getById(2);
		UserType ut = new UserType(2, "Florist");
		
		Address address = new Address (flo.getShop_name(),flo.getLine_1(),flo.getLine_2(),flo.getCity(), flo.getState(),flo.getPincode());
		Address add = aservice.save(address);
		
		User lorist = new User(flo.getFname(), flo.getLname(), flo.getEmail(), flo.getPassword(),flo.getContact(), ut, add, flo.getStatus());
		
		return uservice.save(lorist);
	}
	
	@PostMapping("/saveCustomer")
	public User saveCustomer(@RequestBody CustomerRegistration cr)
	{
		UserType ut = new UserType(1, "Customer");
		
		Address address = new Address (cr.getLine_1(),cr.getLine_2(),cr.getCity(), cr.getState(),cr.getPincode());
		Address add = aservice.save(address);
		
		User cust = new User(cr.getFname(), cr.getLname(), cr.getEmail(), cr.getPassword(),cr.getContact(), ut, add, cr.getStatus());
		
		User newCust = uservice.save(cust);
		
		Cart cart = new Cart(newCust);
		Cart newcart = cservice.saveCart(cart);
		
		return newCust;
	}
	
	@GetMapping("getUserById")
	public User getById(@RequestParam int uid)
	{
		return uservice.getOne(uid);
	}
	
//	@PostMapping("/floristDetail")//Add product and Florist_Product
//	public Product saveFlorist(@RequestBody FloristProductDummy fp)
//	{
//		return fpservice.save(fp,user);
//	}
	
	@GetMapping("/updateRegStatus")
	public boolean updateRegStatus(@RequestParam("user_id") int uid)
	{
		return uservice.updateRegStatus(uid);
	}
	
//	@GetMapping("/")
	
//	@PostMapping("/saveFlorist")
//	public User saveCustomer(@RequestBody User u)
//	{
//		Address a=new Address(u.getAdd_id().getShop_name(),u.getAdd_id().getLine_1(),u.getAdd_id().getLine_2(),u.getAdd_id().getCity(),u.getAdd_id().getState(),u.getAdd_id().getPincode());
//		Address b=aservice.save(a);
//		u.setAdd_id(b);
//		return uservice.save(u);
//	}
	
	
	/*
	@GetMapping("/getone")    //http://localhost:8080/getone?cid=4
	public User getOne(@RequestParam("cid") int cid)
	{
		return cservice.getOne(cid);
	}
	
	@GetMapping("/getfrompath/{id}") //http://localhost:8080/getfrompath/1/bakul
	public User getFromPath(@PathVariable("id")int cid)
	{
		return cservice.getOne(cid);
	}
	
	//get all contacts having 'a' in fname
	@GetMapping("/getwitha")
	public List<User> getAllhavinga()
	{
		return cservice.getAllWithA();
	}
	
	@GetMapping("/getAllwithor")
	public List<User> getContacts(@RequestParam("email") String mail,@RequestParam("contact") String cno)
	{
		return cservice.getContacts(mail, cno);
	}
	
	@PutMapping("/updatemail")
	public int updateEmail(@RequestParam("cid") int id,@RequestParam("email") String mail)
	{
		return cservice.updateEmail(id, mail);
	}
	*/
	
}
